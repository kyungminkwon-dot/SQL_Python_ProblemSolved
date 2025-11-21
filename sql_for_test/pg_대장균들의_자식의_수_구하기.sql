
WITH base AS (
    SELECT ed.id, ec.parent_id AS child_id
    FROM ecoli_data ed LEFT JOIN ecoli_data ec ON ed.id = ec.parent_id
)

SELECT id, COALESCE(COUNT(child_id), 0) AS child_count
FROM base 
GROUP BY id
ORDER BY id ASC 
