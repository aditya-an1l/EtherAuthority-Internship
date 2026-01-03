import sys, json, joblib
import numpy as np


model = joblib.load("stake_model.pkl")
features = json.loads(sys.argv[1])


X = np.array(
    [
        [
            features["stakeAmount"],
            features["stakeDuration"],
            features["entryPrice"],
            features["avgGasFee"],
            features["userHistory"],
        ]
    ]
)


prediction = model.predict(X)[0]
print(prediction)
