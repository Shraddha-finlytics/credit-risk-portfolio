## Schema and Data Load Notes

### Context
- SQL queries were executed inside Python using the `sqlite3` library.  
- The dataset (`cs-training.csv`) was first loaded into a pandas DataFrame.  
- The DataFrame was then written into a SQLite database (`creditrisk.db`) as a table named `credit_data`.  

### Step 1: Load CSV into pandas
- Loaded the raw dataset into pandas for inspection.  
- Verified shape, columns, and summary statistics before saving.  

### Step 2: Rename index column
- Renamed the unnamed index column to `ID`.  
- This makes the table easier to query and ensures every row has a clear identifier.  

### Step 3: Save DataFrame into SQLite
- Established a connection to the SQLite database.  
- Saved the DataFrame into a new table called `credit_data`.  

### Step 4: Verify schema
- Ran `PRAGMA table_info(credit_data);` to confirm column names and types.  
- Verified the table contains 150,000 rows and 12 columns.  

### Result
- Table name: `credit_data`.  
- Includes key fields such as `SeriousDlqin2yrs` (target), `RevolvingUtilizationOfUnsecuredLines`, `age`, `MonthlyIncome`, and delinquency counts.  
- Dataset is now ready for SQL-based exploratory analysis.  
