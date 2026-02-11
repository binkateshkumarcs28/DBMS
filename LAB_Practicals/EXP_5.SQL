-- Experiment - 5

-- 1. Display the total number of employee working in the company.

SELECT 
    COUNT(*) AS Total_Employees     
                  -- COUNT() is used to returns the total number of rows or non-NULL values in a column. 
    FROM employee;

-- 2. Display the total salary being paid to all employees.

SELECT 
     SUM(SAL) AS Total_Salary 
                  -- SUM() is used to returns the total sum of all non-NULL numeric values in a column.
     FROM employee;

-- 3. Display the maximum salary from employee table.

SELECT 
    MAX(SAL) AS Maximum_Salary 
    FROM employee;

-- 4. Display the minimum salary from employee table.

SELECT 
    MIN(SAL) AS Minimum_Salary 
    FROM employee;

-- 5. Display the average salary from employee table

SELECT 
    AVG(SAL) AS Average_Salary 
    FROM employee;

-- 6. Display the maximum salary being paid to clerk.

SELECT 
    MAX(SAL) AS Maximum_Clerk_Salary 
    FROM employee 
	WHERE 
        JOB = 'CLERK';

-- 7. Display the maximum salary being paid in dept no 20.

SELECT 
    MAX(SAL) AS Maximum_DEPTNO_Salary 
    FROM employee 
    WHERE 
       DEPTNO = 20;

-- 8. Display the minimum salary paid to any salesman.

SELECT 
    MIN(SAL) AS Minimum_Salesman_Salary 
    FROM employee 
    WHERE 
       JOB = 'SALESMAN';

-- 9. Display the average salary drawn by managers.

SELECT 
    AVG(SAL) AS Average_Manager_Salary 
    FROM employee 
	WHERE 
       JOB = 'MANAGER';

-- 10. Display the total salary drawn by analyst working in dept no 40.

SELECT 
    SUM(SAL) AS Total_Analyst_Salary 
    FROM employee 
    WHERE 
       JOB = 'ANALYST'
       AND
       DEPTNO = 40;

-- 11. Display the names of the employee in Uppercase.

SELECT 
    UPPER(ENAME) AS Uppercase_Employees_Name 		-- UPPER() is used to convert the strings into uppercase
    FROM employee; 

-- 12. Display the names of the employee in Lowercase.

SELECT 
   LOWER(ENAME) AS Lowercase_Employees_Name      -- LOWER() is used to convert the strings into lowercase
   FROM employee;

-- 13. Display the names of the employee in Proper case.

SELECT 
     CONCAT(UPPER(LEFT(ENAME,1)), 				-- CONCAT() is used to combines multiple strings into a single string.
									    -- LEFT(ENAME,1) is used to extracts the first character of the employee name.
     LOWER(SUBSTRING(ENAME,2))) AS Propercase_Employee_Name  
							-- SUBSTRING(ENAME,2) is used to extracts the string from the second character to the end.
	 FROM employee;

-- 14. Display the length of Your name using appropriate function.

SELECT 
    LENGTH('Akarsh') AS Length_Of_My_Name;
    

-- 15. Display the length of all the employee names

SELECT 
     ENAME,
     LENGTH(ENAME) AS Length_Of_Employees_Name 
     FROM employee;