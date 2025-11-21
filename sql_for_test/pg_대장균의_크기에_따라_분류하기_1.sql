-- 코드를 작성해주세요

SELECT
    id,
    CASE 
        WHEN size_of_colony > 1000 THEN 'HIGH'
        WHEN size_of_colony > 100 AND size_of_colony <= 1000 THEN 'MEDIUM'
        ELSE 'LOW'
    END AS size
FROM ecoli_data
ORDER BY id ASC 
