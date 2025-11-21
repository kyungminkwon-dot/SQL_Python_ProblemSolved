SELECT id, email, first_name, last_name
FROM developer_infos
WHERE 1=1 
AND (skill_1 = 'Python' OR skill_2 = 'Python' OR skill_3 = 'Python')
ORDER BY id ASC 
