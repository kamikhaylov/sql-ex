SELECT c.name, dec.dec1, dec.dec2, dec.dec3 
FROM (SELECT t.ID_comp, 
	  SUM(CASE WHEN DAY(pit.date) < 11 THEN 1 ELSE 0 END) AS dec1, 
	  SUM(CASE WHEN (DAY(pit.date) > 10 AND DAY(pit.date) < 21) THEN 1 ELSE 0 END) AS dec2, 
	  SUM(CASE WHEN DAY(pit.date) > 20 THEN 1 ELSE 0 END) AS dec3 
	  FROM trip t
	  INNER JOIN pass_in_trip pit ON t.trip_no = pit.trip_no AND CONVERT(char(6), pit.date, 112) = '200304' 
      GROUP BY t.ID_comp) AS dec
INNER JOIN company c ON dec.ID_comp = c.ID_comp