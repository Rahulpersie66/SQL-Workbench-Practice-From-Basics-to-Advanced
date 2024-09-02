-- STORED Procedure
-- It is a way to save the SQL code in stored Procedures folder, which can be reusable and which gonna execute all the code written in procedure 
-- all over again
-- Helpful for storng complex queries, simplifying repetitive code and just enhancing performance

-- creating STORED& PROCEDURE -- just by entering CREATE PROCEDURE name() select statement;
-- it will be save under `storedprocedure folder` 
-- NOTE: just `USE DB_name;` before using STOREd procedure creation to avoid confusion
CREATE PROCEDURE large_salary()
SELECT *
FROM employee_salary
WHERE salary>=50000;

-- CALL procedure_name -- call and display the result of SAVED PROCEDURE
CALL large_salary();
-- NOTE: use `CALL DB_name.procedure_name` for ror and beteer clarity.

-- For MULTIPLE queries in STORED PROCEDURES
USE parks_and_recreation;
CREATE PROCEDURE mul_procedure()
SELECT * 
FROM employee_salary
WHERE salary >=50000;
SELECT *
FROM employee_salary
WHERE salary >= 10000;
-- Here it will save FIRST query in procedure and SECOND query DISPLAY as there ois `;` so it will treat both statement as different
-- iT EVEN DOENOT create PROCEDURE for FIRST statement

CALL mul_procedure();

-- For MULTIPLE PROCEDURE
-- use DELIMITER $$ or any symbol
-- and then CREATE PROCEDURE procd_name() 
-- BEGIN 
-- 		SELEECT ; 
-- 		SELEECT; 
-- END $$

DELIMITER $$
CREATE PROCEDURE mul_query()
BEGIN
	SELECT *
    FROM employee_salary
    WHERE salary >= 50000;
	
    SELECT *
    FROM employee_salary
    WHERE salary >= 10000;
END $$
-- CHANGE BACK dleimeter to `;`
DELIMITER ;
    
-- CALLL MULTIPLE_PROCEDURE_QUERY
CALL mul_query();
-- NOTE: SOmetime have to call DB_NAME.procedure_name;

-- ANOTHER way: you can click on `STORED & PROCEDURE` folder and add 'SELECT ' statement after BEGIN and will observe the generate code of PROCEDURE
-- and PRESS APPLY and it will generate code for STORED PROCEDURE
-- the SQL CODE will be in format 
-- USE `parks_and_recreation`;
-- DROP procedure IF EXISTS `new_procedure`;

-- DELIMITER $$
-- USE `parks_and_recreation`$$
-- CREATE PROCEDURE `new_procedure` ()
-- BEGIN
-- 	SELECT *
--     FROM employee_salary
--     WHERE salary >= 50000;
-- 	
--     SELECT *
--     FROM employee_salary
--     WHERE salary >= 10000;

-- END$$

-- HERE DROP procedure IF EXIST `new_procedure`; is efficent as if there will be some PROCEDURE with SAME name then it will DROP that procedure
-- and replace it with NEW one that is new_procedure-- it is good practioce to do so.


-- PRAMATER- these are the variables that are passed as an INPUT to the STORED PROCEDURE
-- it allo stored PROCEDURE to accept an INPUT value and PLACE it into YOUR CODE.

-- So while DEFINING procedure we need to defoine VARIABLE_NAME and its TYPE while CREATING a:CREATE PROCEDURE porcedure_name(variable_name INT)
-- USE CASE:
-- GET a salary of the emp id 1 using PROCEDURE
DROP PROCEDURE IF EXISTS `Parameter _creation`; 
DELIMITER $$
CREATE PROCEDURE Parameter_creation(parameter_employee_id INT)
BEGIN
	SELECT salary
    FROM employee_salary
    WHERE employee_id = parameter_employee_id;
END $$
DELIMITER ;

-- so we will be use the variable_name something DIFFERENT not need to be EMPLOYEE_ID and then we can compare like JAVA, C function
-- parmater comparing WHERE employee_id = `VARIABLE_NAME`
-- naming convention for PARAMETER is --- param_employee_id

-- CALLING a PARMETER Procedure
CALL Parameter_creation(1);
