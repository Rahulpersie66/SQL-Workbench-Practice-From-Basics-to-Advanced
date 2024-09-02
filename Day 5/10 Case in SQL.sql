-- CASE - When u want to implement logic like IF else in SLECT Statement
SELECT first_name, last_name,
CASE
	WHEN age>=50 THEN 'Old'
END
FROM employee_demographics;
-- Where condition met it is printing result as OLD elsewise NULL

SELECT 
CONCAT(first_name, " ",last_name) AS full_name,
CASE
	WHEN age <=30 THEN 'young'
    WHEN age BETWEEN 31 AND 50 THEN 'old'
    WHEN age >=50 THEN "On death's Door"
END AS age_bracket
FROM employee_demographics;

-- USE CASE -- 
-- Party counseller send memo for caluculate salary to be increase after one year and bonus for finace dept. 
SELECT CONCAT(first_name, " ", last_name) AS full_name,
salary,
CASE
	WHEN salary < 50000 THEN salary * 1.05
    WHEN salary > 50000 THEN salary + (salary * 0.07)
END AS new_salary,
CASE
	WHEN dept_id = (
		SELECT dept_id FROM employee_salary sal JOIN parks_departments depts ON depts.department_id = sal.dept_id WHERE depts.department_name LIKE 'Fin%'
    ) THEN salary*0.10
END AS bonus_salary
FROM employee_salary;