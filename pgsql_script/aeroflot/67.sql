WITH numb AS (SELECT COUNT(*) c FROM trip
GROUP BY town_from, town_to)

SELECT COUNT(c) FROM numb
WHERE c IN (SELECT MAX(c) FROM numb)