# Create a visualization that provides a breakdown between the male and female employees working in
# the company each year, starting from 1990.
# Use the 'employees_mod' database
USE employees_mod;

# Check the number of rows returned to determine if each row correlates to one employee only
SELECT 
    emp_no, from_date, to_date
FROM
    t_dept_emp;

SELECT DISTINCT
    emp_no, from_date, to_date
FROM
    t_dept_emp;

# Extract the sorted data as asked
SELECT
	YEAR(tde.from_date) AS calendar_year,
    te.gender AS gender,
    COUNT(te.emp_no) AS num_of_employees
FROM
	t_employees te
    JOIN
    t_dept_emp tde ON te.emp_no = tde.emp_no
GROUP BY te.gender, calendar_year
HAVING calendar_year >= 1990
ORDER BY YEAR(tde.from_date);	
