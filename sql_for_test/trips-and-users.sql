-- https://leetcode.com/problems/trips-and-users/

WITH base1 AS (
    SELECT 
        t.*
    FROM trips t JOIN (SELECT users_id FROM users WHERE banned = 'NO' AND role = 'client') c ON t.client_id = c.users_id
    JOIN (SELECT users_id FROM users WHERE banned = 'NO' AND role = 'driver') d ON t.driver_id = d.users_id
    WHERE request_at BETWEEN '2013-10-01' AND '2013-10-03'
)

SELECT
    request_at AS day,
    ROUND(COUNT(CASE WHEN status <> 'completed' THEN 1 END) / COUNT(*), 2) AS 'Cancellation Rate'
FROM base1
GROUP BY request_at
