 SELECT * 
 FROM employee_demographics edemo
 INNER JOIN employee_salary esal
	ON edemo.employee_id = esal.employee_id;
    
-- SELECTIG some colmuns from inner joins
SELECT demo.employee_id, age, occupation 
FROM employee_demographics AS demo
INNER JOIN employee_salary AS sal
	ON demo.employee_id = sal.employee_id;
    
-- LEFT Join
-- SELECTIG some colmuns from inner joins
SELECT demo.employee_id, age, occupation 
FROM employee_demographics AS demo
LEFT JOIN employee_salary AS sal
	ON demo.employee_id = sal.employee_id;
    
    
SELECT *
FROM employee_salary AS demo;


-- Right Join
-- SELECTIG some colmuns from inner joins
SELECT * 
FROM employee_demographics AS demo
RIGHT JOIN employee_salary AS sal
	ON demo.employee_id = sal.employee_id;
    
    
-- SELF JOIN  
-- SECRET SANTA
SELECT * 
FROM employee_salary;

SELECT emp2.employee_id AS Emp_id, concat(emp2.first_name," ",emp2.last_name) AS Emp_Name, emp1.employee_id AS Santa_id, concat(emp1.first_name," ",emp1.last_name) AS Santa_name  
FROM employee_salary emp1
JOIN employee_salary emp2
	ON emp1.employee_id = emp2.dept_id 
    ;
    
    
    
-- MULTIPLES TABLES
SELECT * 
FROM employee_demographics AS demo
INNER JOIN employee_salary AS sal
	ON demo.employee_id = sal.employee_id
INNER JOIN parks_departments dept
	ON sal.dept_id = dept.department_id
;    

-- We cannot join `department` table with emp_demographics table as they dont have any common column so we need to join `employee_demographics` with `employees salary`
-- so that we have salary.dept_id hich we can further join to `parks_department` department_id even though botgh column have different name but still data type inside them are same 

SELECT * 
FROM parks_departments;
    