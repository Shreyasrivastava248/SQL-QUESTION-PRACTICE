-- Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, but did not realize her keyboard's  key was broken until after completing the calculation. She wants your help finding the difference between her miscalculation (using salaries with any zeros removed), and the actual average salary
SELECT
CEIL(
AVG(SALARY)- AVG(CAST (REPLACE(TO_CHAR(SALARY),'0','')AS NUMBER))
    )
FROM EMPLOYEES;

-- CEIL() (or CEILING() in some SQL versions) is a mathematical function that:

-- Rounds a number up to the nearest whole integer.


-- We define an employee's total earnings to be their monthly  worked, and the maximum total earnings to be the maximum total earnings for any employee in the Employee table. Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. Then print these values as  space-separated integers.

-- Input Format


SELECT
MAX(SALARY * MONTHS) AS TOTAL_EARNNING,
COUNT(*) AS EMPLOYEES
FROM EMPLOYEE
WHERE SALARY*MONTHS =(SELECT MAX(SALARY * MONTHS) FROM EMPLOYEE);