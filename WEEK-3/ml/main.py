#!/usr/bin/env python3
import tkinter as tk
from tkinter import ttk, filedialog, messagebox
import pandas as pd
import numpy as np
import matplotlib
from matplotlib.figure import Figure
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg, NavigationToolbar2Tk
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.metrics import accuracy_score, confusion_matrix, roc_curve, auc

matplotlib.use("TkAgg")


# -------------------------
# Enhanced Synthetic Data Logic
# -------------------------
def generate_realistic_staking_data(n=1000):
    rng = np.random.default_rng(42)
    data = {
        "stake_amount": rng.uniform(0.1, 10.0, n),
        "duration_days": rng.choice([7, 14, 30, 90, 180, 365], n),
        "gas_fee_gwei": rng.normal(50, 20, n).clip(5, 150),
        "yield_rate": rng.uniform(2.0, 12.0, n),
        "market_volatility": rng.uniform(0.01, 0.8, n),
        "user_loyalty_score": rng.integers(1, 11, n),
    }
    df = pd.DataFrame(data)
    risk_score = (
        (df["gas_fee_gwei"] / 150) * 0.4
        + (df["market_volatility"] * 0.4)
        - (df["user_loyalty_score"] / 10) * 0.3
        - (df["yield_rate"] / 12) * 0.1
    )
    df["early_unstake"] = (risk_score + rng.normal(0, 0.1, n) > 0.2).astype(int)
    return df


class MLStakingApp:
    def __init__(self, root):
        self.root = root
        self.root.title("Staking Guard: ML Risk Analytics")
        self.root.geometry("1300x950")
        self.root.configure(bg="#f5f6fa")

        self.df = None
        self.model = None
        self.scaler = StandardScaler()
        self.feature_vars = {}
        self.prediction_entries = {}

        # UI Styling
        self.style = ttk.Style()
        self.style.theme_use("clam")
        self.style.configure("TFrame", background="#f5f6fa")
        self.style.configure("TLabel", background="#f5f6fa", foreground="#2f3640")
        self.style.configure(
            "Accent.TButton",
            foreground="white",
            background="#4834d4",
            font=("Arial", 10, "bold"),
        )
        self.style.map("Accent.TButton", background=[("active", "#686de0")])

        self._setup_ui()

    def _setup_ui(self):
        # --- TOP TITLE BAR ---
        header_frame = tk.Frame(self.root, bg="#2f3542", height=60)
        header_frame.pack(fill="x")
        title_lbl = tk.Label(
            header_frame,
            text="STAKING GUARD | Predictive Risk Engine | EtherAuthority Internship Project",
            font=("Helvetica", 18, "bold"),
            fg="#ffffff",
            bg="#2f3542",
            pady=10,
        )
        title_lbl.pack()

        # Main Paned Window
        self.paned = ttk.PanedWindow(self.root, orient=tk.HORIZONTAL)
        self.paned.pack(fill=tk.BOTH, expand=True)

        # --- Sidebar ---
        self.sidebar = ttk.Frame(self.paned, padding="15")
        self.paned.add(self.sidebar, weight=1)

        ttk.Label(
            self.sidebar, text="1. DATA CONTROLS", font=("Arial", 10, "bold")
        ).pack(pady=5, anchor="w")
        ttk.Button(self.sidebar, text="📂 Load Custom CSV", command=self.load_csv).pack(
            fill="x", pady=2
        )
        ttk.Button(
            self.sidebar, text="🔄 Generate Realistic Data", command=self.load_synthetic
        ).pack(fill="x", pady=2)

        ttk.Separator(self.sidebar, orient="horizontal").pack(fill="x", pady=15)

        ttk.Label(
            self.sidebar, text="2. SELECT FEATURES", font=("Arial", 10, "bold")
        ).pack(anchor="w")
        self.check_canvas = tk.Canvas(
            self.sidebar,
            height=180,
            bg="#ffffff",
            highlightthickness=1,
            highlightbackground="#dcdde1",
        )
        self.check_scrollbar = ttk.Scrollbar(
            self.sidebar, orient="vertical", command=self.check_canvas.yview
        )
        self.check_frame = ttk.Frame(self.check_canvas)
        self.check_canvas.create_window((0, 0), window=self.check_frame, anchor="nw")
        self.check_canvas.configure(yscrollcommand=self.check_scrollbar.set)
        self.check_canvas.pack(fill="both", pady=5)
        self.check_scrollbar.pack(side="right", fill="y", before=self.check_canvas)

        ttk.Label(
            self.sidebar, text="3. TARGET LABEL", font=("Arial", 10, "bold")
        ).pack(anchor="w", pady=(10, 0))
        self.target_combo = ttk.Combobox(self.sidebar, state="readonly")
        self.target_combo.pack(fill="x", pady=5)

        ttk.Button(
            self.sidebar,
            text="🚀 Train Analytics Model",
            command=self.train_model,
            style="Accent.TButton",
        ).pack(fill="x", pady=20)

        self.stats_text = tk.Text(
            self.sidebar,
            height=8,
            width=35,
            font=("Consolas", 10),
            bg="#2d3436",
            fg="#00df00",
        )
        self.stats_text.pack(fill="both", expand=True)

        # --- Main View Area ---
        self.main_area = ttk.Frame(self.paned, padding="15")
        self.paned.add(self.main_area, weight=3)

        # Graph Controls (Save Button)
        graph_ctrl = ttk.Frame(self.main_area)
        graph_ctrl.pack(fill="x")
        ttk.Button(
            graph_ctrl, text="💾 Save Graph Image", command=self.save_graph
        ).pack(side="right")
        self.hover_lbl = ttk.Label(
            graph_ctrl,
            text="Hover over graph for values...",
            font=("Arial", 9, "italic"),
        )
        self.hover_lbl.pack(side="left")

        self.fig = Figure(figsize=(8, 4), dpi=100, facecolor="#f5f6fa")
        self.canvas = FigureCanvasTkAgg(self.fig, master=self.main_area)
        self.canvas_widget = self.canvas.get_tk_widget()
        self.canvas_widget.pack(fill=tk.BOTH, expand=True)

        # Connect Hover Event
        self.canvas.mpl_connect("motion_notify_event", self.on_hover)

        # Prediction UI
        self.predict_frame = ttk.LabelFrame(
            self.main_area, text="LIVE RISK PREDICTION", padding="15"
        )
        self.predict_frame.pack(fill="x", pady=10)
        self.inputs_container = ttk.Frame(self.predict_frame)
        self.inputs_container.pack(fill="x")
        self.predict_btn = ttk.Button(
            self.predict_frame,
            text="Run Prediction",
            state="disabled",
            command=self.make_prediction,
        )
        self.predict_btn.pack(pady=10)
        self.result_label = ttk.Label(
            self.predict_frame,
            text="Awaiting Model Training...",
            font=("Arial", 12, "italic"),
        )
        self.result_label.pack()

        # --- FOOTER ---
        footer = tk.Label(
            self.root,
            text="made by aditya-an1l",
            fg="#7f8c8d",
            bg="#f5f6fa",
            font=("Arial", 8),
        )
        footer.pack(side="bottom", anchor="e", padx=10, pady=5)

    def _update_column_ui(self):
        for widget in self.check_frame.winfo_children():
            widget.destroy()
        self.feature_vars = {}
        cols = list(self.df.columns)
        for col in cols:
            var = tk.BooleanVar(value=True)
            cb = ttk.Checkbutton(self.check_frame, text=col, variable=var)
            cb.pack(anchor="w", padx=5)
            self.feature_vars[col] = var
        self.target_combo["values"] = cols
        if cols:
            self.target_combo.current(len(cols) - 1)
        self.check_frame.update_idletasks()
        self.check_canvas.configure(scrollregion=self.check_canvas.bbox("all"))

    def train_model(self):
        if self.df is None:
            return messagebox.showerror("Error", "No data loaded.")
        selected_features = [
            name for name, var in self.feature_vars.items() if var.get()
        ]
        target = self.target_combo.get()
        if not selected_features:
            return messagebox.showerror("Error", "Select at least one feature.")

        try:
            X = self.df[selected_features]
            y = self.df[target]
            X_train, X_test, y_train, y_test = train_test_split(
                X, y, test_size=0.2, random_state=42
            )
            X_train_scaled = self.scaler.fit_transform(X_train)
            X_test_scaled = self.scaler.transform(X_test)

            self.model = LogisticRegression()
            self.model.fit(X_train_scaled, y_train)

            acc = accuracy_score(y_test, self.model.predict(X_test_scaled))
            self.stats_text.delete(1.0, tk.END)
            self.stats_text.insert(
                tk.END, f"STATUS: Success\nACCURACY: {acc:.2%}\n\nCOEFFICIENTS:\n"
            )
            for f, c in zip(selected_features, self.model.coef_[0]):
                self.stats_text.insert(tk.END, f"{f}: {c:.4f}\n")

            self._plot_results(y_test, X_test_scaled)
            self._generate_predict_inputs(selected_features)
            self.predict_btn.config(state="normal")
            self.result_label.config(
                text="Ready for Live Prediction",
                font=("Arial", 12, "bold"),
                foreground="#4834d4",
            )
        except Exception as e:
            messagebox.showerror("Model Error", str(e))

    def _generate_predict_inputs(self, features):
        for widget in self.inputs_container.winfo_children():
            widget.destroy()
        self.prediction_entries = {}
        for i, feature in enumerate(features):
            row, col = divmod(i, 2)
            ttk.Label(self.inputs_container, text=f"{feature}:").grid(
                row=row, column=col * 2, padx=5, pady=5, sticky="e"
            )
            ent = ttk.Entry(self.inputs_container)
            ent.grid(row=row, column=col * 2 + 1, padx=5, pady=5, sticky="w")
            self.prediction_entries[feature] = ent

    def make_prediction(self):
        try:
            features = list(self.prediction_entries.keys())
            vals = [float(self.prediction_entries[f].get()) for f in features]
            scaled = self.scaler.transform(np.array(vals).reshape(1, -1))
            prob = self.model.predict_proba(scaled)[0][1]
            pred = self.model.predict(scaled)[0]
            status = "🚨 HIGH RISK (Unstake)" if pred == 1 else "✅ LOW RISK (Stay)"
            color = "#eb4d4b" if pred == 1 else "#6ab04c"
            self.result_label.config(
                text=f"{status} | Risk Prob: {prob:.1%}", foreground=color
            )
        except Exception:
            messagebox.showerror(
                "Input Error", "Please ensure all fields contain numbers."
            )

    def _plot_results(self, y_test, X_test_scaled):
        self.fig.clear()
        self.ax1, self.ax2 = self.fig.add_subplot(121), self.fig.add_subplot(122)

        # 1. Annotated Confusion Matrix
        cm = confusion_matrix(y_test, self.model.predict(X_test_scaled))
        self.ax1.imshow(cm, cmap="Blues", alpha=0.7)
        self.ax1.set_title("Detection Accuracy", fontweight="bold")

        # Add numbers in the matrix
        for i in range(cm.shape[0]):
            for j in range(cm.shape[1]):
                self.ax1.text(
                    j,
                    i,
                    str(cm[i, j]),
                    ha="center",
                    va="center",
                    color="white" if cm[i, j] > cm.max() / 2 else "black",
                    fontsize=12,
                )

        # 2. ROC Curve
        fpr, tpr, _ = roc_curve(y_test, self.model.predict_proba(X_test_scaled)[:, 1])
        self.ax2.plot(
            fpr, tpr, color="#4834d4", lw=2, label=f"AUC: {auc(fpr, tpr):.2f}"
        )
        self.ax2.plot([0, 1], [0, 1], "k--", alpha=0.3)
        self.ax2.set_title("Model Reliability (ROC)", fontweight="bold")
        self.ax2.legend(loc="lower right")

        self.fig.tight_layout()
        self.canvas.draw()

    def on_hover(self, event):
        """Displays graph values as the cursor moves."""
        if event.inaxes:
            x, y = event.xdata, event.ydata
            if event.inaxes == self.ax2:  # ROC Curve
                self.hover_lbl.config(text=f"ROC: FPR={x:.2f}, TPR={y:.2f}")
            elif event.inaxes == self.ax1:  # Matrix
                self.hover_lbl.config(
                    text=f"Matrix: Predicted={int(round(x))}, Actual={int(round(y))}"
                )
        else:
            self.hover_lbl.config(text="Hover over graph for values...")

    def save_graph(self):
        if self.model is None:
            return messagebox.showwarning(
                "Warning", "Train a model first to generate a graph."
            )
        file_path = filedialog.asksaveasfilename(
            defaultextension=".png",
            filetypes=[
                ("PNG file", "*.png"),
                ("PDF file", "*.pdf"),
                ("All files", "*.*"),
            ],
        )
        if file_path:
            self.fig.savefig(file_path, dpi=300)
            messagebox.showinfo("Saved", f"Graph saved to {file_path}")

    def load_csv(self):
        path = filedialog.askopenfilename(filetypes=[("CSV Files", "*.csv")])
        if path:
            self.df = pd.read_csv(path)
            self._update_column_ui()

    def load_synthetic(self):
        self.df = generate_realistic_staking_data(1200)
        messagebox.showinfo(
            "Generator", "1,200 records generated with market-aware logic."
        )
        self._update_column_ui()


if __name__ == "__main__":
    root = tk.Tk()
    app = MLStakingApp(root)
    root.mainloop()
