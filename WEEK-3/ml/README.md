# 🌐 EtherAuthority Internship: Week 3 Report (ML Project)

### _Predictive Analytics: Machine Learning & Risk Modeling_

## 👤 Intern Profile

- **Full Name:** Aditya Anil
- **Email Address:** [aditya.anil.productions@gmail.com](mailto:aditya.anil.productions@gmail.com)
- **Program / Course Name:** Web3 & Blockchain · React.js · Node.js · AI-Tools
- **Reporting Period:** `29 Dec 2025 – 03 Jan 2026`
- **Week Number:** Week 3

### Topics Covered

- **Supervised Machine Learning:** Binary classification for user behavior prediction.
- **Logistic Regression Architecture:** - Using the Sigmoid function:

- Understanding coefficients and their impact on risk probability.

- **Data Engineering:** - Synthetic data generation with multi-factorial logic.
- Feature scaling using `StandardScaler`.
- Train-Test splitting (80/20 ratio).

- **Model Evaluation Metrics:**
- **Confusion Matrix:** Precision, Recall, and Accuracy.
- **ROC-AUC Curve:** Measuring the diagnostic ability of a binary classifier.

- **Desktop UI Development:** Using **Tkinter** for high-performance ML dashboards.

---

## 🛠 Completed Tasks

### 1️⃣ Staking Guard: ML Risk Analytics Engine

Developed a comprehensive desktop application that allows protocol managers to predict the likelihood of "Early Unstaking" based on live or synthetic market data.

| Feature               | Implementation                      | Purpose                                                           |
| --------------------- | ----------------------------------- | ----------------------------------------------------------------- |
| **Data Engine**       | Multi-Factorial Synthetic Generator | Simulates realistic gas fees, volatility, and loyalty scores.     |
| **Model**             | Scikit-Learn Logistic Regression    | Provides a fast, interpretable risk score for staking.            |
| **Interactive Plots** | Annotated Confusion Matrix          | Visualizes True Positives/Negatives with real counts.             |
| **Live Prediction**   | User Input Interface                | Allows manual entry of user stats to get a live risk % status.    |
| **Data Export**       | PNG/PDF Plot Exporter               | Enables saving model performance results for stakeholder reports. |

### 2️⃣ Machine Learning Pipeline Logic

The application implements a full-stack ML pipeline within a local environment.

- **Preprocessing:** Features like `gas_fee_gwei` and `stake_amount` are normalized using:

- **Training:** The model learns weights for each feature, identifying that **Market Volatility** and **Gas Fees** are the strongest predictors of churn.
- **Inference:** A real-time engine translates model output into human-readable alerts (e.g., 🚨 HIGH RISK vs ✅ LOW RISK).

### 3️⃣ Interactive Visualization & Hover Diagnostics

Implemented an advanced Matplotlib canvas within the Tkinter UI that supports:

- **Hover Tracking:** Real-time coordinate feedback (FPR/TPR) on the ROC curve.
- **Annotated Heatmaps:** Auto-adjusting text colors inside the Confusion Matrix for readability.

---

## 📦 Work Output / Deliverables

- **GitHub Repository (Week 3):**
  [https://github.com/aditya-an1l/EtherAuthority-Internship/tree/main/WEEK-3](https://www.google.com/search?q=https://github.com/aditya-an1l/EtherAuthority-Internship/tree/main/WEEK-3)
- **Core Application Script:**
  [`staking_guard_v2.py`](<https://www.google.com/search?q=%5Bhttps://github.com/aditya-an1l/EtherAuthority-Internship/blob/main/WEEK-3/staking_guard_v2.py%5D(https://github.com/aditya-an1l/EtherAuthority-Internship/blob/main/WEEK-3/staking_guard_v2.py)>)
- **Project Documentation:**
  [`README.md`](<https://www.google.com/search?q=%5Bhttps://github.com/aditya-an1l/EtherAuthority-Internship/blob/main/WEEK-3/README.md%5D(https://github.com/aditya-an1l/EtherAuthority-Internship/blob/main/WEEK-3/README.md)>) - Outlining ML concepts and internship project goals.

---

## 🧠 Challenges & Learnings

### Challenges

- **Synthetic Logic Alignment:** Ensuring the generated data followed realistic DeFi correlations (e.g., high gas + low loyalty = higher risk).
- **GUI Integration:** Embedding interactive Matplotlib figures into Tkinter while maintaining responsiveness.
- **Event Handling:** Capturing hover events on the canvas to display coordinates in the status bar without lagging the UI.

### Learnings

- **Interpretability Matters:** In Fintech/Web3, "Black Box" models are less useful than Logistic Regression, which clearly shows _why_ a user is considered high risk.
- **Data Quality:** Even a perfect model fails with unscaled data; standardization is the most critical step in the pipeline.
- **User Experience:** Adding features like "Save Plot" and "Hover Text" makes data science tools accessible to non-technical users.

## ✅ Week 3 AI Project Checklist

✔ Multi-factor Synthetic Generator Completed
✔ Logistic Regression Model Integrated
✔ Annotated Confusion Matrix Implemented
✔ ROC Curve with Hover Tracking Completed
✔ Graph Export Feature (PNG/PDF) Added
✔ Final Internship README Documented
