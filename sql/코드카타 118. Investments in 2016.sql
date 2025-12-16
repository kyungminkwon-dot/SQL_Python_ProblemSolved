-- https://leetcode.com/problems/investments-in-2016/description/?envType=study-plan-v2&envId=top-sql-50

-- 2015년 투자값이 같은 pid 2명 이상
-- 위도 및 경도값이 달라야함
-- 투자값은 카운트를 계산해서 원래 테이블에 붙이고, 1개인 경우를 제외하기 
-- 위도 및 경도값 -> concat을 해서 단일 문자로 만들고서 다른 경우만?


WITH tiv_2015_cnt AS (
    SELECT 
        tiv_2015,
        COUNT(*) AS tiv2015_cnt
    FROM insurance
    GROUP BY tiv_2015
    HAVING tiv2015_cnt >= 2
)

, own_city AS (
    SELECT 
          lat,
          lon,
          COUNT(*) AS city_cnt
    FROM insurance
    GROUP BY lat, lon
    HAVING city_cnt = 1
)

SELECT 
      ROUND(SUM(i.tiv_2016), 2) AS tiv_2016
FROM insurance i 
JOIN tiv_2015_cnt tc ON i.tiv_2015 = tc.tiv_2015
JOIN own_city oc ON i.lat = oc.lat AND i.lon = oc.lon
