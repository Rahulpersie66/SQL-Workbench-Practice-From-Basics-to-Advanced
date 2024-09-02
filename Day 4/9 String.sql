-- STRING


-- LENGTH - return length of the String character
SELECT LENGTH('skyfall');

-- USECASE - can have firstname and their length
SELECT first_name, LENGTH(first_name)
FROM employee_demographics
ORDER BY 2 desc;

-- UPPER and LOWER 
-- USE CASE -- USED for standardization issue -- make everything UPPER or LOWEr for SYNC
SELECT first_name, UPPER(first_name), LOWER(first_name) 
FROM employee_demographics;

-- TRIM TRIM is gonna remove spaces from both sides
SELECT RTRIM('        SKy     ');

-- SUBSTRING -- gives string from start and to up to length -- i.e SUBSTRING('string', 3, 2) -- ri
-- LEFT -- gives the number of charcaters from LEFT i.e LEFT('string,3) -- str
-- RIGHT -- gives number of character from RIGHT i.e RIGHT('string',3) -- ing
SELECT first_name,
LEFT(first_name, 3),
RIGHT(first_name, 3),
SUBSTRING(first_name, 2,3) 
FROM employee_demographics;

-- REPLACE -- it replaces a charcater or sequence with set of charcaters -- lowercase and uppercase sensitive
SELECT first_name, REPLACE(first_name, 'An', 'z')
FROM employee_demographics;

-- LOCATE -- it just locate the character set or characters in the given string ..its first occurence in string
-- LOCATE('x', 'Alex') -- 4
SELECT first_name, 
LOCATE('nn', first_name)
FROM employee_demographics;

-- CONCATENATION - multiple columns can we connect into single column
-- CONCAT(first_name, last_name)
-- USE case -- Mostly used to connect first name and last name
SELECT first_name, last_name,
CONCAT(first_name, " " , last_name) AS full_name
FROM employee_demographics;

