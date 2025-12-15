-- https://leetcode.com/problems/employees-whose-manager-left-the-company/description/?envType=study-plan-v2&envId=top-sql-50

WITH base AS(
    SELECT *,
           CASE 
                WHEN manager_id IS NOT NULL AND manager_id NOT IN (SELECT employee_id FROM employees) THEN TRUE
                ELSE FALSE
           END AS has_left
    FROM employees
)

SELECT employee_id
FROM base
WHERE has_left IS TRUE
AND salary < 30000
ORDER BY employee_id ASC 
