-- GROUP BY and ORDER BY Clause
-- AFter group by we can do aggregation things

-- WE wanna do GROUP BY gneder column --- So we get MALE and FEMALE two row
SELECT *
FROM parks_and_recreation.employee_demographics
GROUP BY gender;
-- The above statement is WRONG as it contains NON AGGREGATE columns

-- Here we only can SLECT column which are AGGREGATE columns -- can do same results by DISTINCT(gender)
SELECT gender
FROM parks_and_recreation.employee_demographics
GROUP BY gender;

SELECT Count(first_name)
FROM employee_demographics
GROUP BY gender;


-- We can do aggreagte function for GROUP BY, so this below statement is doing AVG of the AGES of MALES and FEMALES
SELECT gender, AVG(age)
FROM parks_and_recreation.employee_demographics
GROUP BY gender;

-- for this we have TWO OFFICE MNAGER as there SALARY are diffeent 50000 and 60000 so GROUP BY occupation and salary have 2 different rows,
-- if the occupation OFFICE MANAGER and SALARY--50000 both are same then there would be only ONE row for OFFICE MANGER  
SELECT occupation, salary
FROM parks_and_recreation.employee_salary
GROUP BY occupation,salary;


-- GROUP BY for ROLL UP the data i.e how GROUP BY can be use to roll up data and only those columns are used in SELECT which are in GROUP by and if usibg other then aggregate them according to GROUP BY
SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age), SUM(age), MIN(birth_date)
FROM parks_and_recreation.employee_demographics
GROUP BY gender;

-- ORDER BY 
SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY gender, age;
-- THIS WILL do grouping all FEMALE and MALES so FEMALES first and in between them also increasing order of AGE

-- But we can CHANGE ORDER DESC for AGE and Gender ASC
SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY gender, age DESC;


-- But we can SWAP the ORDER first AGE and then Gender then, it gonna only do ORDEER by AGE as AGE has whole unique values, so will not fgo for GENDER column
-- so ORDER of columns ORDER BY is very IMPORTANT doing ORDER BY
SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY age, gender DESC;

-- WE CAN DO it using ORDER BY column NUMBER 
SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY 5, 4 ASC;