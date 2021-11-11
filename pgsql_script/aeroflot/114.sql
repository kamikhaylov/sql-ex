WITH a1 AS (SELECT id_psg, COUNT(*) c 
		   FROM Pass_In_Trip 
		   GROUP BY ID_psg, place), 
     a2 AS (SELECT DISTINCT ID_psg, c
			FROM a1 
			WHERE c = (SELECT MAX(c) FROM a1))
SELECT name, c FROM a2 
JOIN passenger p ON (a2.ID_psg = p.ID_psg)