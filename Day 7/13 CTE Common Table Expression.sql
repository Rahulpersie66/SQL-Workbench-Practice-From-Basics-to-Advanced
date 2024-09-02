-- CTE .. COmmon table expression
-- These are used for complex queries when we want to use COMPLEX SUB SECTION of TWO TABLES then use CTE first to EXTRACT the SUB SECTION
-- and then JOIN of the two table
-- CTE are easily redable then subqueries
-- They Provide a sub query block that we can use in main query

--  Use WITH CTE_NAME AS ( ) SELECT * FROM CTE_NAME;

WITH name_CTE AS 
	(
		SELECT gender, AVG(salary), MAX(salary), MIN(salary), COUNT(salary)
        FROM employee_demographics d
        JOIN employee_salary s
			ON d.employee_id = s.employee_id
		GROUP BY gender
    )
    
    SELECT * FROM name_CTE; 
    
-- same above query with SUB QUERY
SELECT *  
FROM
	(
		SELECT gender, AVG(salary), MAX(salary), MIN(salary), COUNT(salary)
        FROM employee_demographics d
        JOIN employee_salary s
			ON d.employee_id = s.employee_id
		GROUP BY gender
    ) AS t;
    
-- REASON why CTE used immediately after created
-- BCS you are not creating VIEW or TEMP TABLE, not creating REAL table so not STORED in memory thats why have to used 
-- after defininf CTE   
-- MULTIPLE CTE exmple
WITH CTE_Example1 AS
	(
		SELECT employee_id, gender, birth_date
        FROM employee_demographics
        WHERE birth_date > '1985-01-01'
	),
    CTE_Example2 AS
    (
		SELECT salary, employee_id
		FROM employee_salary
        WHERE salary > 60000
    )
    
    SELECT * 
    FROM CTE_Example1
    JOIN CTE_Example2
		ON CTE_Example1.employee_id = CTE_Example2.employee_id
;

-- use multiple CTE by separting by COMMA ( , ) all CTE's and then AS

-- IF you want to change deafult column name use Cte(Gender, MAx_age,MIN_AGE) .. inside bracket are Defaulkt name of CTE
WITH CTE_EXAMPLE(GENDER, MIN_AGE) AS
	(
		SELECT gender,  MIN(age)
        FROM employee_demographics
		GROUP BY gender
    )
    
    SELECT * FROM CTE_EXAMPLE;

-- Number of coulmn name default should be same as number of column name extracted 