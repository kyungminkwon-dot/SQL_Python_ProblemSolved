-- https://leetcode.com/problems/the-number-of-employees-which-report-to-each-employee/

-- 1. CTE 쓴 2단계 버전
WITH base AS(
    SELECT e1.employee_id,
       e1.name,
       e2.reports_to,
       e2.age
    FROM employees e1 
    LEFT JOIN employees e2 
    ON e1.employee_id = e2.reports_to
)
SELECT employee_id,
       name,
       COUNT(reports_to) AS reports_count,
       ROUND(SUM(age)/COUNT(age), 0) AS average_age
FROM base
GROUP BY employee_id, name
HAVING reports_count >= 1
ORDER BY employee_id

    
-- 2. CTE 없이 최대한 단순화한 버전
SELECT e1.employee_id,
       e1.name,
       COUNT(e2.reports_to) AS reports_count,
       ROUND(SUM(e2.age)/COUNT(e2.age),0) AS average_age
FROM employees e1 LEFT JOIN employees e2 
ON e1.employee_id = e2.reports_to
GROUP BY employee_id, name
HAVING reports_count >= 1
ORDER BY employee_id
