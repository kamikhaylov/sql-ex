SELECT name FROM passenger
WHERE id_psg IN (SELECT id_psg FROM trip t, pass_in_trip pit
				 WHERE t.trip_no = pit.trip_no
				 GROUP BY id_psg
				 HAVING COUNT(DISTINCT CASE WHEN town_from <= town_to 
							  THEN town_from + town_to 
							  ELSE town_to + town_from END) = 1)
