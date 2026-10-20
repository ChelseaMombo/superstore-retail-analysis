import os
import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv("data/superstore.csv", encoding="latin-1")

# Total profit per sub-category, sorted from lowest to highest
profit = df.groupby("Sub-Category")["Profit"].sum().sort_values()

# Red bars for losses, blue for profits
colors = ["tab:red" if value < 0 else "tab:blue" for value in profit]

plt.figure(figsize=(9, 7))
plt.barh(profit.index, profit.values, color=colors)
plt.title("Total profit by sub-category")
plt.xlabel("Total profit")
plt.tight_layout()

os.makedirs("images", exist_ok=True)
plt.savefig("images/profit_by_subcategory.png", dpi=150)