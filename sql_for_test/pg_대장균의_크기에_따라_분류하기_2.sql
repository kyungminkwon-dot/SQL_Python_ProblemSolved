-- 코드를 작성해주세요


WITH ranked AS(
    SELECT 
        *,
       ROW_NUMBER() OVER(ORDER BY size_of_colony DESC) as fish_rank
    FROM ecoli_data
)

, total_count AS(
    SELECT 
        COUNT(*) AS total
    FROM ecoli_data
)

, joined AS(
    SELECT 
        id,
        fish_rank,
        total
    FROM ranked    
    CROSS JOIN total_count
)

SELECT 
    id,
    CASE 
        WHEN ROUND(((fish_rank / total) * 100),2) > 75 THEN 'LOW'
        WHEN (ROUND(((fish_rank / total) * 100),2) > 50 AND ROUND(((fish_rank / total) * 100),2) <= 75) THEN 'MEDIUM'
        WHEN (ROUND(((fish_rank / total) * 100),2) > 25 AND ROUND(((fish_rank / total) * 100),2)  <= 50) THEN 'HIGH'
        ELSE 'CRITICAL'
    END AS colony_name
FROM joined
ORDER BY id ASC 
