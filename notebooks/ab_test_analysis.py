"""
ab_test_analysis.py

Simple analysis script for the A/B Testing & Policy Impact Analytics project.

This script:
- Reads data/ab_test_results.csv
- Calculates overall conversion rate
- Calculates conversion by variant (A vs B)
- Calculates conversion by variant & device
- Calculates conversion by variant & region
"""

import pandas as pd

# 1. Read the CSV file
# Make sure this script is run from the ROOT of the repo so that the path works.
df = pd.read_csv("data/ab_test_results.csv")

# 2. Quick look at the data structure
print("First 5 rows:")
print(df.head())
print("\nColumns:", list(df.columns))
print("-" * 50)

# 3. Overall conversion rate
overall_total = len(df)
overall_converted = df["converted"].sum()
overall_rate = df["converted"].mean()

print("Overall results")
print(f"Total rows: {overall_total}")
print(f"Total converted: {overall_converted}")
print(f"Overall conversion rate: {overall_rate:.3%}")
print("-" * 50)

# 4. Conversion rate by variant (A vs B)
print("Conversion rate by variant (A vs B)")
by_variant = (
    df.groupby("variant")["converted"]
      .agg(total_rows="count",
           total_converted="sum",
           conversion_rate="mean")
      .reset_index()
)
print(by_variant)
print("-" * 50)

# 5. Conversion rate by variant and device
print("Conversion rate by variant and device")
by_variant_device = (
    df.groupby(["variant", "device"])["converted"]
      .agg(total_rows="count",
           total_converted="sum",
           conversion_rate="mean")
      .reset_index()
)
print(by_variant_device)
print("-" * 50)

# 6. Conversion rate by variant and region
print("Conversion rate by variant and region")
by_variant_region = (
    df.groupby(["variant", "region"])["converted"]
      .agg(total_rows="count",
           total_converted="sum",
           conversion_rate="mean")
      .reset_index()
)
print(by_variant_region)
print("-" * 50)

print("Analysis complete.")
