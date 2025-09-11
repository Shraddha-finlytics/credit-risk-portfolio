-- ==========================================
-- Credit Risk Scorecard — SQL EDA Queries
-- Source table: credit_data
-- Created from Kaggle "Give Me Some Credit" dataset
-- ==========================================

-- 0) Inspect table schema (column names and types)
PRAGMA table_info(credit_data);

-- 1) Quick preview of key fields
SELECT
  ID,
  SeriousDlqin2yrs,
  RevolvingUtilizationOfUnsecuredLines,
  age
FROM credit_data
LIMIT 5;

-- 2) Count total rows (portfolio size)
SELECT COUNT(*) AS total_rows
FROM credit_data;

-- 3) Overall default rate (good vs bad)
SELECT
  SeriousDlqin2yrs,
  COUNT(*) AS count,
  ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM credit_data), 2) AS percent
FROM credit_data
GROUP BY SeriousDlqin2yrs
ORDER BY SeriousDlqin2yrs;

-- 4) Top 5 by utilization (to spot extreme values/outliers)
SELECT
  ID,
  RevolvingUtilizationOfUnsecuredLines,
  age
FROM credit_data
ORDER BY RevolvingUtilizationOfUnsecuredLines DESC
LIMIT 5;

-- 5) Age distribution summary (find invalids like age=0)
SELECT
  MIN(age) AS min_age,
  MAX(age) AS max_age,
  AVG(age) AS avg_age
FROM credit_data;

-- 6) Missing values in MonthlyIncome and NumberOfDependents
SELECT
  SUM(CASE WHEN MonthlyIncome IS NULL THEN 1 ELSE 0 END) AS missing_income,
  SUM(CASE WHEN NumberOfDependents IS NULL THEN 1 ELSE 0 END) AS missing_dependents
FROM credit_data;

-- 7) Distribution: 30–59 days past due
SELECT
  "NumberOfTime30-59DaysPastDueNotWorse" AS late_30_59,
  COUNT(*) AS count
FROM credit_data
GROUP BY "NumberOfTime30-59DaysPastDueNotWorse"
ORDER BY late_30_59;

-- 8) Distribution: 60–89 days past due
-- Note: fixed the column name typo to match the table schema
SELECT
  "NumberOfTime60-89DaysPastDueNotWorse" AS late_60_89,
  COUNT(*) AS count
FROM credit_data
GROUP BY "NumberOfTime60-89DaysPastDueNotWorse"
ORDER BY late_60_89;

-- 9) Distribution: 90+ days past due
SELECT
  NumberOfTimes90DaysLate AS late_90,
  COUNT(*) AS count
FROM credit_data
GROUP BY NumberOfTimes90DaysLate
ORDER BY late_90;

-- 10) Small cross-tab of all three delinquency buckets
SELECT
  "NumberOfTime30-59DaysPastDueNotWorse" AS late_30_59,
  "NumberOfTime60-89DaysPastDueNotWorse" AS late_60_89,
  "NumberOfTimes90DaysLate" AS late_90,
  COUNT(*) AS count
FROM credit_data
GROUP BY
  "NumberOfTime30-59DaysPastDueNotWorse",
  "NumberOfTime60-89DaysPastDueNotWorse",
  "NumberOfTimes90DaysLate"
ORDER BY
  late_30_59,
  late_60_89,
  late_90
LIMIT 10;

-- 11) Number of dependents distribution
SELECT
  NumberOfDependents AS dependents,
  COUNT(*) AS count
FROM credit_data
GROUP BY NumberOfDependents
ORDER BY NumberOfDependents;
