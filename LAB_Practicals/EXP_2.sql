#Exp2
-- Perform Following Query using Employee Table. (Retrieving Data)

-- 1.  List all distinct job in Employee

SELECT distinct job from employee;

-- 2. List all information about employee in Department Number 30
SELECT * from employee where DEPTno=30;
-- 3. Find all department number with department names greater than 20
SELECT * from employee where DEPTno > 20;

-- 4. Find all information about all the managers as well as the clerks in department 30.
SELECT job from employee WHERE job in ('manager' , 'clerk') AND DEPTno = 30;

-- 5. List the Employee name, Employee numbers and department of all clerks.
SELECT ENAME, EMPNO, DEPTNO from employee WHERE job = 'clerk';

-- 6. Find all managers not in department 30.
SELECT * FROM employee WHERE job = 'MANAGER' AND DEPTNO <>30;

-- 7. List information about all Employees in department 10 whoare not manager or clerks.
SELECT * from employee  WHERE JOB not in ('MANAGER','CLERK') AND DEPTNO = 10;

-- 8. Find Employees and jobs earning between 1200 and 1400.

-- 9. List Name and Department Number of employee who are clerks, analyst or salesman
SELECT ENAME, DEPTNO from employee WHERE JOB IN ('CLERK','SALESMAN','ANALYST');

-- 10. List Name and Department Number of employee whose names began with M.
SELECT ENAME, DEPTNO from EMPLOYEE WHERE ENAME LIKE 'M%';





