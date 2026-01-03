import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
import joblib


data = pd.read_csv("staking_data.csv")
X = data.drop("earlyUnstake", axis=1)
y = data["earlyUnstake"]


X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2)


model = LogisticRegression(max_iter=1000)
model.fit(X_train, y_train)


joblib.dump(model, "stake_model.pkl")
print("Model trained and saved")
