# A/B Testing & Policy Impact Analytics

**Role fit:** Data Analyst · Business Analyst · Product Analyst · Policy Analyst  
**Industries:** Government digital services, online platforms, fintech, edtech, healthcare portals

---

## 1. Problem & Context

Imagine a government or online portal where citizens/users need to complete an important action, such as:

- applying for a permit,
- booking a health appointment,
- signing up for a benefit or program.

The team has two versions of the page:

- **Version A** – the current (old) design/policy
- **Version B** – a new design/policy that is supposed to make completion easier

The key question is:

> **“Does Version B actually perform better than Version A, or is the difference just random?”**

This project is a complete, working mini-system to answer that question using real data, SQL, Excel, and Python.

---

## 2. Data

The main dataset is stored in [`data/ab_test_results.csv`](data/ab_test_results.csv).

- Each row = one user/session in the experiment.
- Columns:
  - `user_id` – unique ID for each user
  - `variant` – `'A'` (old) or `'B'` (new)
  - `device` – e.g., `mobile` or `desktop`
  - `region` – e.g., `North`, `South`, `East`, `West`
  - `date` – date of the visit
  - `converted` – `1` if the user completed the target action, `0` otherwise

Total experiment size (from this dataset):

- **Total visits:** `[TOTAL_VISITS]`
- **Total conversions:** `[TOTAL_CONVERSIONS]`
- **Overall conversion rate:** `[OVERALL_RATE]%`

*(Replace the placeholders above with your actual numbers from Excel.)*

---

## 3. Tech Stack & Skills Demonstrated

**Data & SQL**

- Designed a clean table schema in [`sql/schema.sql`](sql/schema.sql)
- Wrote analysis queries in [`sql/queries.sql`](sql/queries.sql) to compute:
  - overall conversion rate,
  - conversion by variant (A vs B),
  - conversion by variant & device,
  - conversion by variant & region.

**Excel**

- Built a manager-friendly A/B test calculator in [`excel/ab_test_calculator.xlsx`](excel/ab_test_calculator.xlsx) that:
  - Takes total visitors and conversions for A and B as input.
  - Calculates conversion rates.
  - Calculates the difference (uplift).
  - Gives a simple decision recommendation: **"Ship B" or "Do not ship B"** based on a threshold.

**Python (pandas)**

- Implemented a full analysis script in [`notebooks/ab_test_analysis.py`](notebooks/ab_test_analysis.py) that:
  - Reads the CSV data.
  - Prints overall conversion.
  - Prints conversion by variant, by variant & device, and by variant & region.
  - Uses `groupby` and aggregations for fast analysis.

**Business & Analytics Skills**

- Experiment design and A/B testing thinking.
- Metric definition: visits, conversions, conversion rate, uplift.
- Communicating results in business language and making a go/no-go recommendation.

---

## 4. Approach

1. **Data design**
   - Defined a simple but realistic schema for experiment data.
   - Created a synthetic dataset of user visits, variants, devices, regions, and outcomes.

2. **SQL analysis**
   - Wrote reusable SQL queries to answer:
     - “What is the overall conversion rate?”
     - “Is B better than A?”
     - “Does performance change by device or region?”

3. **Excel A/B calculator**
   - Created a lightweight tool any manager can use without code:
     - Enter visitors & conversions for A and B.
     - See conversion rates and the difference.
     - Get a human-readable decision suggestion.

4. **Python script**
   - Automated the same calculations programmatically.
   - Prepared the project for deeper analysis or integration into larger pipelines/dashboards.

---

## 5. Results (with this sample data)

From the current sample dataset:

- **Version A conversion rate:** `[RATE_A]%`
- **Version B conversion rate:** `[RATE_B]%`
- **Difference (B – A):** `[DIFFERENCE]%`

Based on these numbers:

- If B is significantly higher than A (for example, more than 2 percentage points), the Excel calculator recommends:  
  **"Ship B (B is clearly better than A)"**.
- Otherwise, it recommends:  
  **"Do not ship B (no strong improvement)"**.

*(Replace `[RATE_A]`, `[RATE_B]`, and `[DIFFERENCE]` with your actual values.)*

### Key Metrics (from this experiment)

| Variant | Visits | Conversions | Conversion rate |
|---------|--------|------------:|----------------:|
| A       | 50     | 29          | 58%             |
| B       | 50     | 35          | 70%             |

Overall across both variants:

- **Total visits:** 100  
- **Total conversions:** 64  
- **Overall conversion rate:** 64%

In simple terms: Version **B** converted **12 percentage points** better than Version **A** in this sample (70% vs 58%).


---

## 6. Business Impact

If hosted inside a real organization, this project would support:

- **Faster decisions** on whether to roll out new designs/policies.
- **Clear visibility** of how performance varies by:
  - device (e.g., mobile vs desktop),
  - region (e.g., North vs South),
  which is critical for government portals and high-traffic sites.
- **Reduced risk** of shipping changes that do not actually improve results.

This kind of analysis is directly useful for:

- **Data / Business Analyst** roles in product, marketing, or policy.
- **Product Analyst** roles in tech companies, telecoms, fintech, etc.
- **Policy Analyst / Digital services** roles in government and public sector.

---

## 7. How to Run the Components

### SQL (any SQL database)

1. Create a database (e.g., PostgreSQL).
2. Run the script in [`sql/schema.sql`](sql/schema.sql) to create the `ab_test_results` table.
3. Import `data/ab_test_results.csv` into that table.
4. Run queries from [`sql/queries.sql`](sql/queries.sql) to get conversion metrics.

### Excel

- Open [`excel/ab_test_calculator.xlsx`](excel/ab_test_calculator.xlsx).
- Enter visitors and conversions for A and B.
- The sheet automatically calculates conversion rates and a simple decision.

### Python

- Ensure Python and `pandas` are installed.
- From the project root, run:

  ```bash
  python notebooks/ab_test_analysis.py
