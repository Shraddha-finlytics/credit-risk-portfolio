# Credit Risk Scorecard

This project builds a credit risk scorecard model to estimate the probability that a customer will default within two years.  
The scorecard approach is widely used in banking because it provides both a probability of default (PD) and an interpretable credit score.

The project uses the **Give Me Some Credit** dataset (from Kaggle) and follows a structured, step-by-step roadmap from raw data to a working scorecard model.

---

## Project Roadmap

### Stage 1: Setup & Data Load
- Loaded the raw dataset (`cs-training.csv`) into Python (pandas).
- Saved a clean version into an SQLite database for analysis.
- Ran basic checks: number of rows, columns, and summary statistics.

### Stage 2: SQL-based Exploratory Data Analysis
- Used SQL queries to explore data directly in SQLite.
- Checked default rate, age distribution, and utilization outliers.
- Reviewed missing values (e.g., `MonthlyIncome`, `NumberOfDependents`).

### Stage 3: Data Cleaning & Feature Engineering
- Handled missing values by imputation (e.g., median income).
- Addressed outliers (e.g., utilization capped at 1.0, age minimum set to 18).
- Created binned variables for **age, income, utilization**.
- Calculated **Weight of Evidence (WoE)** and **Information Value (IV)**.

### Stage 4: Scorecard Model (Python)
- Trained a logistic regression model on WoE-transformed variables.
- Evaluated performance using ROC curve, Precision-Recall curve, and cutoff tuning.
- Converted logistic regression coefficients into **scorecard points**.
- Built customer-level credit scores and visualized their distribution.

---

## Repository Structure

- `data/` → raw dataset (excluded if large, see `.gitignore`)
- `notebooks/` → Jupyter notebooks with full workflow
- `sql/` → SQL queries and supporting notes
  - `eda_queries.sql` → exploratory SQL queries
  - `schema_and_load_notes.md` → how the SQL table was created in Python
- `reports/` → charts and outputs
- `requirements.txt` → Python dependencies
- `.gitignore` → files excluded from version control
- `README.md` → project summary
```

---

## Installation

To run this project locally, install the required dependencies:

```
pip install -r requirements.txt
```

---

## Results

- Built an interpretable **credit risk scorecard**.
- Demonstrated how customer characteristics (age, income, utilization) affect default probability.
- Produced a scoring system aligned with banking practices (base score, points to double odds).
![Credit Score Distribution](reports/credit_score_distribution.png)
---

## License

This project is for **educational purposes** and not intended for production use in real credit risk modeling.

