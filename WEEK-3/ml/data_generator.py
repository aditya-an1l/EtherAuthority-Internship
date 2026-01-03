import random
import csv


with open("staking_data.csv", "w", newline="") as f:
    writer = csv.writer(f)
    writer.writerow(
        [
            "stakeAmount",
            "stakeDuration",
            "entryPrice",
            "avgGasFee",
            "userHistory",
            "earlyUnstake",
        ]
    )


for _ in range(1000):
    stake = round(random.uniform(0.01, 2), 3)
    duration = random.choice([7, 14, 30, 90])
    price = random.uniform(1500, 3500)
    gas = random.uniform(5, 80)
    history = random.randint(0, 10)


early = 1 if (stake < 0.2 and duration > 30) or gas > 60 else 0
writer.writerow([stake, duration, price, gas, history, early])
