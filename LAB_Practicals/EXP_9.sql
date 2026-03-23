      -- Experiment - 9

USE company2cse2;

-- 1. Display the name of emp name who earns highest salary.

SELECT ENAME, SAL
     FROM employee
     WHERE 
       SAL = (SELECT MAX(SAL) FROM employee);

-- 2. Display the employee number and name of employee working as clerk and earning highest salary among clerks.

SELECT EMPNO, ENAME, SAL, JOB
      FROM employee
      WHERE 
         SAL = (SELECT MAX(SAL) FROM employee WHERE JOB = 'CLERK')
         AND 
         JOB = 'CLERK';

-- 3. Display the names of the salesman who earns a salary more than the highest salary of any clerk.

SELECT ENAME, SAL, JOB
      FROM employee
      WHERE 
         SAL > (SELECT MAX(SAL) FROM employee WHERE JOB = 'CLERK')
         AND 
         JOB = 'SALESMAN';

-- 4. Display the names of clerks who earn salary more than that of james of that of sal lesser than that of scott

SELECT ENAME, SAL, JOB
      FROM employee
      WHERE 
         SAL > (SELECT MAX(SAL) FROM employee WHERE ENAME = 'JAMES')
         AND 
         SAL < (SELECT MAX(SAL) FROM employee WHERE ENAME = 'SCOTT')
         AND
         JOB = 'CLERK';

-- 5. Display the names of employees who earn a sal more than that of james or that of salary greater than that of scott.

SELECT ENAME, SAL, JOB
      FROM employee
      WHERE 
         SAL > (SELECT MAX(SAL) FROM employee WHERE ENAME = 'JAMES')
         OR  
         SAL > (SELECT MAX(SAL) FROM employee WHERE ENAME = 'SCOTT');

-- 6. Display the names of the employees who earn highest salary in their respective departments.

SELECT e.ENAME, e.SAL, e.DEPTNO, d.DNAME
      FROM employee e
      JOIN department d
      ON e.DEPTNO = d.DEPTNO
      WHERE 
         SAL = (SELECT MAX(SAL) FROM employee WHERE DEPTNO = e.DEPTNO);

-- 7. Display the names of employees who earn highest salaries in their respective job groups.

-- 1st method

SELECT e.ENAME, e.SAL, e.JOB, e.DEPTNO, d.DNAME
      FROM employee e
      JOIN department d
      ON e.DEPTNO = d.DEPTNO
      WHERE 
         SAL = (SELECT MAX(SAL) FROM employee WHERE JOB = e.JOB);

-- 2nd method

SELECT ENAME, JOB, MAX(SAL)
     FROM employee
     GROUP BY JOB;

-- 8. Display the employee names who are working in accounting dept.

SELECT e.ENAME, e.JOB
     FROM employee e
     JOIN department d
     ON e.DEPTNO = d.DEPTNO
     WHERE 
         DNAME = 'ACCOUNTING';

-- 9. Display the employee names who are working in chicago.



-- 10. Display the job groups having total salary greater than the maximum salary for managers.

SELECT JOB, 
   SUM(SAL) AS Total_Salary
   FROM employee 
   GROUP BY JOB 
   HAVING
      SUM(SAL) > (SELECT MAX(SAL) FROM employee WHERE JOB = 'MANAGER');