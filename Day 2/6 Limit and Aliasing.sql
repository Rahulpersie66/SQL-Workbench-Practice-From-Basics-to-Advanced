-- Limit only gonna tell how many rows we need to print
SELECT * FROM employee_demographics
ORDER BY age DESC
LIMIT 3
;
-- this gonna do oldest 3 employee from table

SELECT * FROM employee_demographics
ORDER BY age DESC
LIMIT 3,1
;
-- LIMIT 3,1 gonna start at 3 POSITION and 1 UNIT ROW from it i.e ONLY Chris will be print that is 4th highest age employee

SELECT * FROM employee_demographics
ORDER BY age DESC
LIMIT 2,1
;
-- LIMIT 2,1  start at position 2 and 1 unit below it ..that is 3rd highest age employee

-- ALIASING
SELECT gender, AVG(age) AS avg_age
FROM employee_demographics
GROUP BY gender
HAVING avg_age > 2;
-- also use ALISING like `AVG(age) avg_age` without mentioning AS