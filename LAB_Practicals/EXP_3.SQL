-- EXP_3
-- 1. List all employees and jobs in Department 30 in descending order by salary
SELECT ENAME, JOB, SAL from EMPLOYEE WHERE DEPTNO = 30 ORDER BY SAL DESC;

-- 2. List job and Department Number of employees whose name are five letters long begin with “A” and end with “N”.
SELECT ENAME, JOB, DEPTNO from EMPLOYEE WHERE ENAME LIKE 'A___N';

-- 3. Display the name of employees whose name start with alphabet S.
SELECT ENAME from EMPLOYEE WHERE ENAME LIKE'S%' ; 

-- 4. Display the names of employees whose name ends with alphabet S.
SELECT ENAME from EMPLOYEE WHERE ENAME LIKE'%S' ; 

-- 5. Display the names of employees working in department number 10 or 20 or 40 or employees working as clerks, salesman or analyst.
SELECT ENAME from EMPLOYEE WHERE DEPTNO IN(10,20,30) AND JOB IN ('CLERK','SALESMAN','ANALYST');

-- 6. Display employee number and names for employees who earn commission.
SELECT ENAME, EMPNO FROM EMPLOYEE WHERE COMM > 0;

-- 7. Display employee number and total salary for each employee.
SELECT EMPNO, SAL + IFNULL('COMM',0 ) AS TOTAL_SALARY FROM  employee ; 

-- 8. Display employee number and annual salary for each employee

SELECT
    EMPNO,
    (SAL + IFNULL(COMM, 0))*12 AS ANNUAL_SALARY
    FROM employee;
    
-- 9. Display the names of all employees working as clerks and drawing a salary more than 3,000.

SELECT
    ENAME, 
    JOB, 
    SAL
    FROM employee
    WHERE
	    JOB = 'CLERK'
        AND 
        SAL >= 3000;

-- 10. Display the names of employees who are working as clerk, salesman or analyst and drawing a salary more than 3,000.

SELECT
    ENAME, 
    JOB, 
    SAL
    FROM employee
    WHERE
	    JOB IN ('CLERK', 'SALESMAN', 'ANALYST')
        AND 
        SAL >= 3000;


