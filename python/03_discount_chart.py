import os
import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv("data/superstore.csv", encoding="latin-1")

# Put each order line into a discount band (same bands as the SQL query)
df["discount_band"] = pd.cut(
    df["Discount"],
    bins=[-0.01, 0, 0.2, 0.4, 1],
    labels=["0%", "1-20%", "21-40%", "41%+"],
)

# Total profit per band
profit = df.groupby("discount_band", observed=True)["Profit"].sum()

# Red bars for losses, blue for profits
colors = ["tab:red" if value < 0 else "tab:blue" for value in profit]

plt.figure(figsize=(8, 5))
plt.bar(profit.index.astype(str), profit.values, color=colors)
plt.axhline(0, color="black", linewidth=0.8)
plt.title("Total profit by discount band")
plt.xlabel("Discount band")
plt.ylabel("Total profit")
plt.tight_layout()

os.makedirs("images", exist_ok=True)
plt.savefig("images/profit_by_discount_band.png", dpi=150)