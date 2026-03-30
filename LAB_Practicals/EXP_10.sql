	-- Experiment - 10 
USE company2cse2;
           
-- 1. Display the names of employees from department number 10 with salary greater than that of any employee working in other departments.

SELECT ENAME
  FROM employee
  WHERE
  SAL > ANY (SELECT SAL FROM employee )
  AND 
  DEPTNO = 10; 
  
-- 2. Display the names of employee from department number 10 with salary greater than that of all employee working in other departments.

SELECT ENAME
  FROM employee
  WHERE
  SAL > ALL (SELECT SAL FROM employee )
  AND 
  DEPTNO = 10; 
  
-- 3. Display the details of employees who are in sales dept and grade is 3.

SELECT *
    FROM employee 
    WHERE
       DEPTNO = (SELECT DEPTNO FROM department WHERE DNAME = "SALES");
       
-- 4. Display those who are not managers and who are managers anyone. 

SELECT *
    FROM employee 
    WHERE
    JOB <> "MANAGER"
    AND
    MGR IN (SELECT EMPNO FROM employee WHERE JOB = "MANAGER");
    
    
-- 5. Display those employees whose manager name is jones.

SELECT *
   FROM employee
   WHERE
     MGR = ALL (SELECT EMPNO FROM employee WHERE ENAME = "JONES");
     
-- 6. Display ename who are working in sales dept.

SELECT ENAME 
   FROM employee
   WHERE
      DEPTNO = (SELECT DEPTNO FROM department WHERE DNAME = "SALES");
      
-- 7. Display employee name, deptname, salary and comm. For those sal in between 2000 to 5000 while location is chicago.

SELECT e.ENAME, d.DNAME, e.SAL, e.COMM
  FROM employee e
  JOIN department d
  ON e.DEPTNO = d.DEPTNO
   WHERE
    e.SAL BETWEEN 2000 AND 5000;
    
-- 8. Display those employees whose salary greater than his manager salary.

SELECT e.ENAME, e.SAL, m.ENAME AS Manager_Name, m.SAL AS Manager_Salary
  FROM employee e
  JOIN employee m
  ON e.MGR = m. EMPNO
  WHERE 
 e.SAL > m.SAL;
 
-- 9. Display those employees who are working in the same dept where his manager is working.

SELECT e.ENAME, m.ENAME AS Manager_Name, d.DNAME AS Department_Name, m.DEPTNO AS Manager_Department,
e.DEPTNO AS Employee_Department_Number
FROM employee e
 JOIN department d
  ON e.DEPTNO = d.DEPTNO
 JOIN employee m
  ON e.MGR = m. EMPNO
 WHERE
    e.DEPTNO = m.DEPTNO;


-- 10. Display grade and employees name for the dept no 10 or 30 but grade is not 4, while joined the company before 31-dec-82

SELECT ENAME
FROM employee
 WHERE
   DEPTNO IN (10, 30)
   AND
   HIREDATE < '1982-12-31';