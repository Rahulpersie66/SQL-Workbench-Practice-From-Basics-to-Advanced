SELECT gender, AVG(age) 
FROM employee_demographics
WHERE AVG(age)>40
GROUP BY gender;
-- SELECT gender and AVG(age) only occur when `GROUP BY gender` is occured first then SELCT gender, AVG(age)occurs, 
-- So AVG(age) is not created yet, therefore `WHERE AVG(age) >40` can't be checked
-- Therefore HAVING comes to check WHERE condition after GROUP BY so HAVING is used after GROUP BY and was specifically created
-- for above example that shows error


SELECT gender, AVG(age) 
FROM employee_demographics
GROUP BY gender
HAVING AVG(age)>40
;


SELECT occupation, AVG(salary) 
FROM employee_salary
WHERE occupation LIKE '%manager%'
GROUP BY occupation
HAVING AVG(salary) < 75000
;
-- IN this example we filtered at ROW LEVEL at `WHERE occupation like %manager% ` and then FILTERED at 
-- Aggreagte LEVEL when used `HAVING AVG(salary) > 75000 `
-- If you want to filter at AGRREGATE level WE USE HAVING cluase

SELECT occupation, AVG(salary) 
FROM employee_salary
WHERE occupation != 'City Manager'
GROUP BY occupation
HAVING AVG(salary) > 50000;