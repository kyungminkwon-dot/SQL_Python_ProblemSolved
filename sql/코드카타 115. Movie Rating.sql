-- https://leetcode.com/problems/movie-rating/description/?envType=study-plan-v2&envId=top-sql-50

WITH review_count AS (
    SELECT user_id,
           COUNT(*) AS review_count
    FROM movierating
    GROUP BY user_id
)

, top_user AS (
    SELECT 
           u.name AS results
    FROM review_count rc JOIN users u ON rc.user_id = u.user_id
    ORDER BY rc.review_count DESC, u.name ASC 
    LIMIT 1
)

, avg_movie AS (
    SELECT 
            movie_id,
            SUM(rating) / COUNT(movie_id) AS avg_rating
    FROM movierating
    WHERE created_at >= '2020-02-01' AND created_at < '2020-03-01'
    GROUP BY movie_id
)

, top_movie AS (
    SELECT 
           m.title AS results
    FROM avg_movie am JOIN movies m ON am.movie_id = m.movie_id
    ORDER BY avg_rating DESC, m.title ASC 
    LIMIT 1
)

SELECT * FROM top_user
UNION ALL 
SELECT * FROM top_movie
