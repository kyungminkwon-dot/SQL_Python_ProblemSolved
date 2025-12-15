-- https://leetcode.com/problems/last-person-to-fit-in-the-bus/?envType=study-plan-v2&envId=top-sql-50

WITH base AS (
    SELECT *
    FROM queue
    ORDER BY turn ASC
)
, base1 AS (
    SELECT *,
           SUM(weight) OVER( ORDER BY turn ASC) AS cum_weight
    FROM base
)
, base2 AS(
    SELECT *,
           CASE 
                WHEN cum_weight > 1000 THEN FALSE
                ELSE TRUE 
           END AS has_boarded
    FROM base1
)
SELECT person_name
FROM base2 
WHERE has_boarded IS TRUE
ORDER BY turn DESC 
LIMIT 1
