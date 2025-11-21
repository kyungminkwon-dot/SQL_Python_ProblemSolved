# WITH rares AS (
#     SELECT *
#     FROM item_info
#     WHERE rarity = 'RARE'
# )
    
#  ,  joined AS (
#     SELECT 
#         t.item_id
#     FROM item_tree t LEFT JOIN item_info i  ON t.parent_item_id = i.item_id 
#     WHERE t.parent_item_id IS NOT NULL
# )

# SELECT i.item_id, i.item_name, i.rarity 
# FROM joined j JOIN item_info i ON j.item_id = i.item_id
# ORDER BY i.item_id DESC 



SELECT i.item_id, i.item_name, i.rarity
FROM item_info i JOIN item_tree t ON i.item_id = t.item_id
WHERE t.parent_item_id IS NOT NULL
AND t.parent_item_id IN (SELECT item_id FROM item_info WHERE rarity = 'RARE')
ORDER BY i.item_id DESC 

-- 희귀도가 rare인 아이템
-- 자식 아이템 아이디 있어야함
