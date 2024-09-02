-- Trigger & Event
-- Trigger is block of code that executes automatically when an event takes place on a specific table.
-- Example:: Ehen a new employee is hired , they put in the salary table but they forget to enter the details in to 
-- demographics table, so we want to put everybody in the salary table automatically into demograpics table

-- Now we have to write a trigger that when the data is entered into the salary it get automatically enters to 
-- demographics

-- TRIGGER Creation::
-- Start with delimIter
-- CREATE TRIGGER trigger_name
-- BEFORE if we want to do something before delete 
-- or AFTER if we want to add new row in salary and then autmatically TRIGGERS to add row in `demographics`
-- AFTER iNSERT on emp_salary
-- FOR EACH ROW -- tells that for each row of salary table
-- There are MS SQL Server that have `BATCH Trigger` or `TREE level Trigger` that are nice and can do all at once ,
-- but we dont have them so use FOR EACH ROW like if 4 new roW so FOR EACH ROW will check four(4) NEW row
-- Now define but action to define 
-- BEGIN and END and in between it define the action
-- INSERT INTO emp_demo(employee_id, f_nameof emp_demo, l_name of emp_demo) -- defines which columns of emp_demo 
-- we need to fill
-- and there VALUES from emp_salary table columns VALUES(emp_id from emp_salary, f_name from emp_Salary, l_name from emp_salary 
-- NEW.employee_id means NEW values taht are inserted in employee_salalry 
-- we can use OLD.employee_id, OLD.first_name for UPDATED or DELETED values from `employee_salary` that we want 
-- to save to `emp_demo`
DELIMITER $$
CREATE TRIGGER employee_insert
	AFTER INSERT ON employee_salary
		FOR EACH ROW
BEGIN
	INSERT INTO employee_demographics(employee_id, first_name, last_name) 
	VALUES (NEW.employee_id, NEW.first_name, NEW.last_name);
END $$   
DELIMITER ;           
            
-- NEW -- new rows that were inserted and OLD --  old row tgat were deleted and updated
-- ON Right click on TRIGGER CREATED under table emp_salary under trigger folder we can't do anything like
-- Alter, DROP, but except `REFRESH ALL`

-- now check it by inserting values into the `salaary table`
INSERT INTO employee_salary(employee_id, first_name, last_name, occupation, salary, dept_id) VALUES(13,'Ron-Brown',
'Brown', 'Entertainment 7 CEO', 1000000, NULL);

-- TO check the result
SELECT * FROM employee_salary;
-- now checking iF TRIGGER WORKED or NOT -- by slecting emp_demo
SELECT * FROM employee_demographics;

-- IN REAL WORLD we have TON of tables and ton things that you want to do AUTOMATICALLY then TRIGGER CAN SAVE 
-- your time and help you to do it AUTOMATICALLY 
-- AND we DONT NEED TO DO IT MANUALLY.and can save a TON of time.alter



-- EVENSTS
-- Events is similar to TRIGGER
-- Trigger happens when event take palce.
-- EVnets happens when it is scheduled. it is more like SCHEDULED AUTOMATOR rather than trigger that happens when 
-- an event happens
-- EVENTS can be fantastic for lot of things when you IMPORT data, you can PULL DATA FROM specific FILE PATH on a 
-- SCHEDULED.
-- YOU can BUILD REPORTS that are EXPORTED to a FILE on a scheduled, you can do daily weekly, monthly, yearly . 
-- Events are super helpful in AUTOMATION.

-- USECASE : The PAWNEE council has come with new law, they need to save some money by cutting spend on parks_and_dept
-- by retiring employee that  are over 60 and cheking it monthly basis or daily basis so AUTOMATING The thing

-- CREATE EVENT
-- Earlier we are trigger this thing on specific event BUT here we are SCHEDULING an EVENT
-- ON SCHEDULE EVERY 1 MONTH-- it will check after 1 month that is scheduled 
-- ON SCHEDULE EVREY 30 second it will check after every 30 second it is scheduled there is 30 microsecond too
DROP EVENT IF EXISTS delete_retires;
DELIMITER $$
CREATE EVENT delete_retires
ON SCHEDULE EVERY 30 SECOND
DO 
	BEGIN
		DELETE 
        FROM employee_demographics 
        WHERE age >= 60;
    END $$
DELIMITER ;

-- To check if ROW >=60 is deleted by SCHEDULED EVENT -- we will check SLEECT statement after 30 sec
SELECT * 
FROM employee_demographics;

-- IF that DEOSNOT work, then you can check if EVENT SCHEDUER IS ON or not??
-- show variables LIKE 'event%';
SHOW VARIABLES LIKE 'event%';

-- if your EVENT avriable is ON but still didnot deleted then CHECK for deete permission
-- Edit -> Preferences -> SQL editor -> very bottom check for box 
-- SAVE updtaes and DELete permission resttricted( .. something ) --> this need to ne UNCHECK BOX -- then have delete permission to delete


-- To delete a row of SPECIFIC condition FIRST WRITE a SELECT statement of the same, if same row is dispalyed or not
-- then delete


-- TYPICALLY we dont do it for EVERY 30 SCEOND we do SChEDULE it for EVERY 1 MONTH or ONE YEAR