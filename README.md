# SQL Analysis Project: Identifying Outliers and Department Statistics

## Overview
This project analyzes departmental salaries to identify outliers and calculate various departmental statistics using SQL. The analysis is divided into three main parts:

1. **Department Statistics Calculation**:
   - A Common Table Expression (CTE) called `DepartmentStats` is created.
   - This CTE calculates the standard deviation and average salaries for each department, filtering out salaries below $10,000.

2. **Identifying Salary Outliers**:
   - Another CTE named `DepartmentOutliers` is created.
   - This CTE combines the `Employee_Salaries` table with `DepartmentStats`, enabling the calculation of Z-scores for each salary.
   - Z-scores indicate how far a salary deviates from the department's average salary, taking into account the standard deviation.
   - Salaries below $10,000 are filtered out.

3. **Final Insights and Analysis**:
   - The final query presents valuable insights, including department, standard deviation, average, coefficient of variation (standard deviation divided by average), and the count of outliers.
   - A left join ensures all departments are included in the analysis, even if they have no outliers.
   - The outlier count is determined by identifying salaries with a Z-score greater than 1.96 or less than -1.96.
   - Results are grouped by department, standard deviation, average, and coefficient of variation, and sorted by department for clarity.

## Key Findings
- Standard deviations and averages for departmental salaries.
- Identification of outliers based on Z-scores.
- Calculation of the coefficient of variation for each department.
- Count of outliers per department.

## Tools and Libraries
- SQL
- Database Management System (e.g., PostgreSQL, MySQL)

## How to Use
1. Clone the repository to your local machine.
2. Run the SQL scripts in the provided order to replicate the analysis.
3. Review the `README.md` and additional documentation for detailed steps and explanations.

## Contributing
Contributions are welcome! Please create a pull request with your proposed changes or enhancements.
