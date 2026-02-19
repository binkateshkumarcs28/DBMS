-- Experiment - 6
use company2cse2;

-- 1. Display empno, ename, deptno from employee table. Insteadof display department numbers display the related department name 
                     --  (Use decode function).
                     
  SELECT EMPNO, ENAME,
        CASE DEPTNO
           WHEN 10 THEN 'RESCHARCH'
            WHEN 20 THEN 'ACCOUNTING'
             WHEN 30 THEN 'SELAS'
              WHEN 40 THEN 'OPERATIONS'
              ELSE 'UNKNOWN'
              END  AS department_name FROM employee;
           
    
-- 2 Display your age in days.

SELECT DATEDIFF(CURRENT_DATE(), '2007-02-04')AS age_in_days; 

-- 3. Display your age in months

SELECT TIMESTAMPDIFF(MONTH, '2007-02-04', CURRENT_DATE()) AS age_in_months;

-- 7.Find the date for nearest Saturday after current date.

SELECT DATE_ADD(CURDATE(), INTERVAL 7-DAYOFWEEK(CURDATE()) + (CASE WHEN DAYOFWEEK(CURDATE()) = 7 THEN 7 
  ELSE 0 END) DAY) AS NEXT_staurday;

-- 8. Display current time.

SELECT CURRENT_TIME() AS right_now_time;

-- 9. Display the date three months Before the current date.

SELECT DATE_SUB(CURDATE(), INTERVAL 3 MONTH)AS past_date;

-- 10. Display those employees who joined in the company in the month of Dec.

SELECT * FROM employee WHERE MONTH(HIREDATE) = 12;

-- 11. Display those employees whose first 2 characters from hire date -last 2 characters of salary.

-- 12. Display those employees whose 10% of salary is equal to the year of joining.

SELECT * FROM employee WHERE SAL* 0.10 = YEAR(HIREDATE);

-- 13. Display those employees who joined the company before 15 of the months. 




             