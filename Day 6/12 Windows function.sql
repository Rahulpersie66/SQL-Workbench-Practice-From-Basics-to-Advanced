SELECT * FROM parks_and_recreation.employee_salary;

-- WINDOW function 
-- Extremly powrful somewhat like GROUP BY except they don't ROLL up into ONE ROW which Group by does.

-- USE CASE -- GROUP by on gender basis and avg salary afer join of two table
SELECT gender, AVG(salary)
FROM employee_demographics d
JOIN employee_salary s
	ON d.employee_id = s.employee_id
GROUP BY gender;

-- IT IS ROLLING up every column to ONE ROW according to FROUP BY column result of MALE/FEMALE.
-- SAME thing with OVER() and partition BY

-- OVER() takes every thing fromthat column e,.g every salary
SELECT gender, AVG(salary) OVER()
FROM employee_demographics d
JOIN employee_salary s
	ON d.employee_id = s.employee_id;
-- but here AVG(salary) OVER() - will produce a AVG of SALRY coulmn not AVG of MALE SALAY or FEMALE SALARY


-- iF WE USE PARTITION BY then we can use first_name, last_name column too because it doesnot ROLL Up to ONE ROW
SELECT d.first_name, d.last_name,gender, AVG(salary) OVER(PARTITION BY gender)
FROM employee_demographics d
JOIN employee_salary s
	ON d.employee_id = s.employee_id;
    
-- ROLLING UP TOTAL -- total adding to next row and every row is sum of previous row + its value
-- FOR use ROLLING up total use ORDER BY inside OVER()
SELECT d.first_name, d.last_name, s.salary, SUM(salary) OVER( ORDER BY d.employee_id)
FROM employee_demographics d
JOIN employee_salary s
ON d.employee_id = s.employee_id;

-- USE CASE -- SALARY of male and female but different group sum 
SELECT d.first_name, d.last_name, gender, s.salary, SUM(salary) OVER( PARTITION BY gender ORDER BY d.employee_id)
FROM employee_demographics d
JOIN employee_salary s
ON d.employee_id = s.employee_id;

-- ROW_NUMBER -- provide unique numbering to rows for every row
-- same like employee_id
SELECT d.employee_id, d.first_name, d.last_name, s.salary, 
SUM(salary) OVER( ORDER BY d.employee_id),
ROW_NUMBER() OVER( )
FROM employee_demographics d
JOIN employee_salary s
ON d.employee_id = s.employee_id;

-- Male row number start from 1 and so on nad female number start from 1 and so on.
-- To ROLLBACK SUM use ORDER by
SELECT d.employee_id, d.first_name, d.last_name, s.salary, 
SUM(salary) OVER( partition by gender  ORDER BY d.employee_id),
ROW_NUMBER() OVER(  partition by gender )
FROM employee_demographics d
JOIN employee_salary s
ON d.employee_id = s.employee_id;

-- RANK() -- same like ROW_NUMBER .. but only difference is that on SAME (duoplicate) value of SALARY it has RANK SAME and SKIP ONE RANK
-- USE CASE -id we want to RANK these output based on there salary in PARTITIONof MALE highes RANK and FEMALE highest RANK
SELECT d.employee_id, d.first_name, d.last_name, s.salary, 
SUM(salary) OVER( ORDER BY d.employee_id),
RANK() OVER(  partition by gender ORDER BY salary) AS rank_num
FROM employee_demographics d
JOIN employee_salary s
ON d.employee_id = s.employee_id;
-- RANK() also need ORDER BY .. becasue by default it have NO ORDER BY so every RANK AS 1

-- When RANK() count in duplicate BASED on ORDER by which is SALARY, it gonna assign same RANK and that next number is not going to be next
-- NUMERICALLY but going to be next number POSITIONALLY of order by salary.

-- DENSE_RANK() -- NOT GONNA SKIP NUMBER after DUPLICATE 
-- ROW_NUMBER nit gonna have duplicate
-- RANK() -- skip number on DUPLICATE and same number on DUPLICATE
SELECT d.employee_id, d.first_name, d.last_name, s.salary, 
SUM(salary) OVER( ORDER BY d.employee_id),
ROW_NUMBER() OVER(  partition by gender ORDER BY salary),
RANK() OVER(  partition by gender ORDER BY salary),
DENSE_RANK() OVER(  partition by gender ORDER BY salary)
FROM employee_demographics d
JOIN employee_salary s
ON d.employee_id = s.employee_id;