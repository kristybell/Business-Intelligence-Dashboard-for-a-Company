# Compare the average salary of female versus male employees in the entire company until year 2002,
# and add a filter allowing you to see that per each department.
SELECT
	te.gender,
    td.dept_name,
    ROUND(AVG(ts.salary), 2) AS salary,
    YEAR(ts.from_date) AS calendar_year
FROM
	t_salaries ts
    JOIN
    t_employees te ON ts.emp_no = te.emp_no	
    JOIN
    t_dept_emp tde ON te.emp_no = tde.emp_no	
    JOIN
    t_departments td ON tde.dept_no = td.dept_no
GROUP BY td.dept_no, te.gender, calendar_year
HAVING calendar_year <= 2002
ORDER BY td.dept_no;	