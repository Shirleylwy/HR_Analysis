--Check out the Data
select * from Employee_Salaries

--group by the department and obtain the standard deviation and average
with DepartmentStats AS 
(select Department,
	STDEV(Salary) as Standard_Deviation,
	AVG(Salary) as Average
from Employee_Salaries
WHERE Salary >= 10000
Group by Department)

--Create your Department Outliers
select emp.Department,
	emp.Salary,
	dt.Standard_Deviation,
	dt.Average,
	(emp.Salary - dt.Average)/dt.Standard_Deviation as zscore
from Employee_Salaries emp join DepartmentStats dt on emp.Department = dt.Department
where emp.Salary >=10000;

--join the two tables so we can select what we need
with DepartmentStats AS (
	select Department,
		STDEV(Salary) as Standard_Deviation,
		AVG(Salary) as Average
	from Employee_Salaries
	WHERE Salary >= 10000
	Group by Department
),
DepartmentOutliers as (
	select emp.Department,
		emp.Salary,
		dt.Standard_Deviation,
		dt.Average,
		(emp.Salary - dt.Average)/dt.Standard_Deviation as zscore
	from Employee_Salaries emp join DepartmentStats dt on emp.Department = dt.Department
	where emp.Salary >=10000)

Select dt.Department,
	Round(dt.Standard_Deviation,2) as Standard_Deviation,
	Round(dt.Average,2) as Salary_Average,
	Round((dt.Standard_Deviation / dt.Average),2)*100 as Coefficient_of_Variation,
	SUM(case when (do.zscore > 1.96 or do.zscore < -1.96) then 1 else 0 end) as Outlier_Count
from DepartmentOutliers dt 
left join DepartmentOutliers do on dt.Department = do.Department
Group by dt.Department, dt.Standard_Deviation, dt.Average, dt.Standard_Deviation / dt.Average
order by Outlier_Count DESC