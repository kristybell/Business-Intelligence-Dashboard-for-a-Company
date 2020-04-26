# Create an SQL stored procedure that will allow one to obtain the average male and female salary
# per department within a certain salary rang. Let this range be defined by two values the user
# can insert when calling the procedure.
# Finally, visualize the obtained result-set in Tableau as a double bar chart.

USE employees_mod;
DROP PROCEDURE IF EXISTS avg_mf_salary;

DELIMITER $$
USE employees_mon $$
CREATE PROCEDURE avg_mf_salary(IN p_min_salary FLOAT, IN p_max_salary FLOAT)
BEGIN
SELECT 
	te.gender,
    td.dept_name,
    AVG(ts.salary) AS avg_salary
FROM
	t_employees te
    JOIN
    t_salaries ts ON te.emp_no = ts.emp_no
    JOIN
    t_dept_emp tde ON ts.emp_no = tde.emp_no
    JOIN
    t_departments td ON tde.dept_no = td.dept_no
WHERE
	ts.salary BETWEEN p_min_salary AND p_max_salary
GROUP BY td.dept_no, te.gender;
END$$

DELIMITER ;

CALL avg_mf_salary(50000,90000);