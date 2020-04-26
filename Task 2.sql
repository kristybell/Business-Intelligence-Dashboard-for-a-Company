# Compare the number of male managers to the number of female managers from different departments
# for each year, starting from 1990.
SELECT
	td.dept_name AS dept_name,
    tee.gender AS gender,
    tdm.emp_no AS emp_no,
    tdm.from_date AS from_date,
    tdm.to_date AS to_date,
    e.calendar_year,
    CASE 
		WHEN YEAR(tdm.to_date) >= e.calendar_year AND YEAR(tdm.from_date) <= e.calendar_year THEN 1
        ELSE 0
    END AS active
FROM
	(SELECT
		YEAR(hire_date) AS calendar_year
	 FROM
		t_employees
	GROUP BY calendar_year) e
    CROSS JOIN
	t_dept_manager tdm
    JOIN
    t_departments td ON tdm.dept_no = td.dept_no
    JOIN
    t_employees tee ON tee.emp_no = tdm.emp_no	
ORDER BY tdm.emp_no, calendar_year ASC;	
