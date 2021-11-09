WITH numb AS (SELECT COUNT(*) c FROM trip
GROUP BY CASE WHEN town_from > town_to
		 THEN town_from ELSE town_to
		 END,
		 CASE WHEN town_from < town_to
		 THEN town_from ELSE town_to
		 END)

SELECT COUNT(c) FROM numb
WHERE c IN (SELECT MAX(c) FROM numb)