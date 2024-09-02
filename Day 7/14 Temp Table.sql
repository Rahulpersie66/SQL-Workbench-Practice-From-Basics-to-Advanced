-- Temp Table : these are tables only visible to the session they are created in.
-- As a data analuyst i will using those to store complex queries result or intermediate result.. somewhat like CTE
-- or MANIPULATING the data before feeding it to permanent table.

-- create TEMPORARY TABLE ... just like a normal table 
-- also have to provide column name and their data type
-- 1st Way
CREATE TEMPORARY TABLE temp_table(
f_name varchar(10),
l_name varchar(10),
fav_movie varchar(50)
);
-- After creating this nothing going to be happen in DATABASE but their will be temporary table craeted in the memory.
SELECT * from temp_table;
-- Its like real table and we can use it over and over until the sesion of mysql is there. It is saved in memory for RAM but not permanent mem.

-- 2nd way -- using SELCT statement
-- name of temp table SHOULD be MEANINGFUL
CREATE TEMPORARY table sal_over_50k
SELECT * 
FROM employee_salary
WHERE salary > 50000;

-- to display these temp table use SELECT command but until mysql session is there
SELECT * from sal_over_50k;

-- Use CAse 
-- Temp table are used for CPMPLEX and ADVANCED stuff and when STORING PROCEDURES and MANIPULATING data and JOINING multiples
-- JOINING multiple TEMP tables.. doing lot more comples stuff..
-- subquery < CTE < TEMP TABLE