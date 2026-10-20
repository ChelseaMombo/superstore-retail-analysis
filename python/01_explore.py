import pandas as pd

# Load the CSV into a DataFrame (a table in memory)
df = pd.read_csv("data/superstore.csv", encoding="latin-1")

# First look at the data
print(df.shape)
print(df.head())
print(df.info())