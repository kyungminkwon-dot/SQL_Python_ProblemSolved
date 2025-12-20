-- https://leetcode.com/problems/fix-names-in-a-table/description/?envType=study-plan-v2&envId=top-sql-50


WITH base AS(
    SELECT user_id, 
           SUBSTR(name, 1, 1) AS first_word,
           SUBSTR(name, 2) AS other_word
    FROM users
)
SELECT 
    user_id,
    CONCAT(UPPER(first_word), LOWER(other_word)) AS name
FROM base
ORDER BY user_id ASC
