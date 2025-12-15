-- https://leetcode.com/problems/consecutive-numbers/description/?envType=study-plan-v2&envId=top-sql-50

WITH base AS(
    SELECT *,
           ROW_NUMBER() OVER(ORDER BY id DESC) AS id_rank
    FROM logs
)
,base1 AS(
    SELECT id,
            CASE
                WHEN id = 1 THEN NULL
                WHEN id > 1 THEN lag(num) OVER(ORDER BY id) 
            END AS num_m1,

            CASE 
                WHEN id_rank = 1 THEN NULL
                ELSE lead(num) OVER(ORDER BY id) 
            END AS num_p1,
            num
    FROM base
    ORDER BY id
)
, base2 AS (
SELECT 
    CASE 
        WHEN num = num_m1 AND num = num_p1 THEN num
        ELSE NULL
    END AS ConsecutiveNums
FROM base1
)
SELECT DISTINCT ConsecutiveNums
FROM base2
WHERE ConsecutiveNums IS NOT NULL 

