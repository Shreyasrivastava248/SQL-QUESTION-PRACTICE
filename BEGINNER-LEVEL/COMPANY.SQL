-- Given the table schemas below, write a query to print the company_code, founder name, total number of lead managers, total number of senior managers, total number of managers, and total number of employees. Order your output by ascending company_code.

-- Note:

-- The tables may contain duplicate records.
-- The company_code is string, so the sorting should not be numeric. For example, if the company_codes are C_1, C_2, and C_10, then the ascending company_codes will be C_1, C_10, and C_2.
SELECT 
  C.COMPANY_CODE,
  C.FOUNDER,
  COUNT(DISTINCT LM.LEAD_MANAGER_CODE) AS TOTAL_LEAD_MANAGERS,
  COUNT(DISTINCT SM.SENIOR_MANAGER_CODE) AS TOTAL_SENIOR_MANAGERS,
  COUNT(DISTINCT M.MANAGER_CODE) AS TOTAL_MANAGERS,
  COUNT(DISTINCT E.EMPLOYEE_CODE) AS TOTAL_EMPLOYEES
FROM COMPANY C
JOIN LEAD_MANAGER LM
  ON C.COMPANY_CODE = LM.COMPANY_CODE
JOIN SENIOR_MANAGER SM
  ON LM.LEAD_MANAGER_CODE = SM.LEAD_MANAGER_CODE
  AND LM.COMPANY_CODE = SM.COMPANY_CODE
JOIN MANAGER M
  ON SM.SENIOR_MANAGER_CODE = M.SENIOR_MANAGER_CODE 
  AND SM.COMPANY_CODE = M.COMPANY_CODE
JOIN EMPLOYEE E
  ON M.MANAGER_CODE = E.MANAGER_CODE
  AND M.COMPANY_CODE = E.COMPANY_CODE
  GROUP BY C.COMPANY_CODE, C.FOUNDER
ORDER BY C.COMPANY_CODE;