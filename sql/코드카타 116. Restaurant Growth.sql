-- https://leetcode.com/problems/restaurant-growth/description/?envType=study-plan-v2&envId=top-sql-50

WITH base1 AS (
    SELECT 
            visited_on,
            SUM(amount) AS daily_amount,
            COUNT(*) AS visited_count,
            ROW_NUMBER() OVER(ORDER BY visited_on ASC) AS visit_rank
    FROM customer
    GROUP BY visited_on
)

, base2 AS (
    SELECT 
            visited_on,
            CASE 
                WHEN visit_rank >= 7 THEN SUM(daily_amount) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) 
                ELSE NULL
            END As cum_amount,
            visited_count
    FROM base1
)
SELECT 
      visited_on,
      cum_amount AS amount,
      ROUND(cum_amount / 7, 2) AS average_amount
 FROM base2
 WHERE cum_amount IS NOT NULL 
 ORDER BY visited_on ASC 
