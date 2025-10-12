-- https://leetcode.com/problems/the-number-of-employees-which-report-to-each-employee/

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
