-- Unions allos us to combine row together.

-- UNIONS allows you to combine row from separate table and the same table together.
-- UNION combine TWO SELECT statement together.

-- NO data type restriction is there, SO WE CAUTIOUS YOU ghave to manage SIMILAR DATA type under its.

SELECT age, first_name
FROM employee_salary
UNION 
SELECT * 
FROM employee_demographics;
-- Error as NUMBER of Coulmn SHOULD BE SAME. Table 1 has 2 COLUMN sleceted and table 2 has 6 COLUMNS SELECTED. 

SELECT employee_id, salary
FROM employee_salary
UNION 
SELECT first_name, last_name
FROM employee_demographics;


-- UNION takes distinct row data from both the SELECT STAMENT
SELECT first_name, last_name
FROM employee_salary
UNION 
SELECT first_name, last_name
FROM employee_demographics;
-- SO WHY DEFAULT it is UNION DISTINCT

-- UNION ALL keep all the DUPLICATES
SELECT first_name, last_name
FROM employee_salary
UNION ALL 
SELECT first_name, last_name
FROM employee_demographics;

-- MULTIPLE SELECT STAEMENT with UNION
-- USE CASE -- point ut old man > 40 and lady > 40 and highly paid > 70000
SELECT first_name, last_name, 'OLD Man' AS Label
FROM employee_demographics
WHERE age > 40 and gender LIKE 'm%'
UNION
SELECT first_name, last_name, 'OLD Lady' AS Label
FROM employee_demographics
WHERE age > 40 AND gender='female'
UNION
SELECT first_name, last_name, 'Highly Paid Employee' AS Label
FROM employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name;

-- COUNT the number of employee and distinct data only
SELECT COUNT(*) AS Kick_out
FROM
(SELECT first_name, last_name
FROM employee_demographics
WHERE age > 40 and gender LIKE 'm%'
UNION
SELECT first_name, last_name
FROM employee_demographics
WHERE age > 40 AND gender='female'
UNION
SELECT first_name, last_name
FROM employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name
) LayOff

;