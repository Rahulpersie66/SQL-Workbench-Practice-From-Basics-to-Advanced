-- WHERE Clause

SELECT * 
FROM parks_and_recreation.employee_salary
WHERE first_name = 'Leslie';


SELECT * 
FROM parks_and_recreation.employee_salary
WHERE salary <= 50000;

SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE gender = 'Female';


-- Not Equal <>  OR !=
SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE gender != 'Female';

-- DATE Greater than --date in 'quotes'
SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1982-03-04';

-- Logical operator AND OR NOT
SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1985-01-01' OR NOT gender = 'male';

-- Quotes for string 'date' and integer don't require braces
-- PEMDAS is applies to MYSQL i.e brackets are prefered first and solvred first so bracket is ISOLATION ststement
SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE (first_name='Leslie' AND age = 44) OR age > 51;

-- LIKE statement look for specific PATTERN  % --anything and _ means specific value 
-- LIKE is not the exact match but specific sequence in column 
SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE '%er%';
-- Anything start with anything and in between 'er' andending with anything

SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE 'a%';

-- a__  ONLY TWO Character after alter
SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE 'a___%';

-- We cann do that with birth DATE
SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE birth_date LIKE '1989%';

