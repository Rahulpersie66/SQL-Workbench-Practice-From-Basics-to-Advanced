 -- SUBQUERIES 
 -- Queries under query 
 -- Subqueries can be used with FROM , WHERE, SELECT
 
 -- With WHERE 
 -- Suppose want to take all employee who works with parks_dept by using table employee demographics
 
 SELECT * FROM employee_salary emp
 INNER JOIN parks_departments pd
 ON emp.dept_id = pd.department_id
 WHERE pd.department_name LIKE 'pa%';
 
 SELECT * FROM employee_salary 
 WHERE dept_id = (SELECT department_id FROM parks_departments WHERE department_name = 'Parks and Recreation');
 
 -- Employee demographics where dept_id 1
 SELECT * 
 FROM employee_demographics
 WHERE employee_id IN (
						SELECT employee_id
                        FROM employee_salary
                        WHERE dept_id = ( SELECT department_id
											FROM parks_departments
                                            WHERE department_name LIKE 'Par%'
										)
						)
;

-- SUBQUERIES in SELECT 
-- CASE SELECT salary of everyone with average salary to check which one is above or below salary
SELECT first_name, salary, AVG(salary)
FROM employee_salary
GROUP BY salary, first_name;
-- Wrong output as AVG ssalary is now a combnation of FIRST_NAME and Salary so SALARY is now AVG_salary

SELECT first_name, salary,
(SELECT AVG(salary) FROM employee_salary)
FROM employee_salary;

SELECT first_name, salary,
CASE 
	WHEN salary > ( SELECT AVG(salary) FROM employee_salary) THEN 'Above Salary'
    WHEN salary < ( SELECT AVG(salary) FROM employee_salary) THEN 'Below Salary'
END AS sal_desc
FROM employee_salary;


-- SUBQUERIES In FROM
SELECT gender,  AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender;

SELECT gender 
FROM 
( SELECT gender,  AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender)
;
--  GIVE From Table a NAME AS AGG_Table


SELECT AVG(max_age), AVG(`AVG(age)`)
FROM 
( SELECT gender,  AVG(age), MAX(age) AS max_age, MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender) AS Agg_table
;

-- To use coumns of FROM (derived table) use AS for column of derived table or USE ` BACKTICK to write column name as `MAX(age)`
-- SO you are creating TEMP table but there are better way to use it using CTE table