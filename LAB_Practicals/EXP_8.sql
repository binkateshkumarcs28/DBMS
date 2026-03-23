-- Experiment - 8

 -- 1. Display all employees with their dept name.
 
 SELECT e.ename, d.dname
      FROM employee e
		JOIN department d ON e.deptno = d.deptno;

-- 2. Display those employees whose manager names is jones, and also display their manager name.

SELECT e.ename AS employee, m.ename AS manager
          FROM employee e
              JOIN employee m ON e.mgr = m.empno
                    WHERE UPPER(m.ename) = 'JONES';

-- 3. Display employee name, his job, his dept name, his manager name, his grade and make out of an under department wise.

SELECT E.ENAME, E.JOB, M.ENAME AS MANAGER_NAME, D.DNAME
FROM EMPLOYEE E
LEFT JOIN EMPLOYEE M
ON E.MGR = M.EMPNO
JOIN DEPARTMENT D
ON D.DEPTNO = E.DEPTNO
ORDER BY D.DEPTNO;

-- 4. List out all the employees name, job, and salary grade and department name for everyone in the company except ‘clerk’. Sort on salary display the highest salary.
-- 5. Display employee name, his job and his manager. Display also employees who are without manager.
-- 6. List the employee name, job, annual salary, deptno, dept name and grade who earn 36000 a year or who are not clerks.
-- 7. List ename, job, annual sal, deptno, dname and grade who earn 30000 per year and who are not clerks.
-- 8. List out all employees by name and number along with their manager’s name and number also display ‘no manager’ who has no manager.

SELECT E.EMPNO, E.ENAME,
COALESCE(M.ENAME, 'NO MANAGER') AS MANAGER_NAME,
M.EMPNO AS MANAGER_NUMBER
FROM EMPLOYEE E
LEFT JOIN EMPLOYEE M ON E.MGR = M.EMPNO;

-- 9. Select dept name, dept no and sum of sal.

 SELECT d.dname, d.deptno,
 SUM(sal)  as total_salary
      FROM department d
		JOIN employee e ON e.deptno = d.deptno
        group by d.deptno;
        
-- 10. Display employee number, name and location of the department in which he is working

 SELECT e.ename, d.dname, e.empno
      FROM employee e
		JOIN department d ON e.deptno = d.deptno;
        
-- 11. Display employee name and department name for each employee. 

 SELECT e.ename, d.dname
      FROM employee e
		JOIN department d ON e.deptno = d.deptno;