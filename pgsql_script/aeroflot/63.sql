SELECT name FROM passenger
WHERE id_psg IN (SELECT id_psg FROM pass_in_trip
				 GROUP BY id_psg, place
				 HAVING COUNT(place) > 1)