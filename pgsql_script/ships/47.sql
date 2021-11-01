WHIS sh AS (SELECT c.country, s.name FROM classes c 
			JOIN ships s ON c.class=s.class
  			UNION
  			SELECT c.country, o.ship FROM outcomes o 
			JOIN classes c ON c.class=o.ship), 
	 a AS  (SELECT country, name, 
		   		   CASE WHEN result='sunk' THEN 1 ELSE 0 END AS sunk
            FROM sh LEFT JOIN outcomes o ON o.ship=sh.name)
			
SELECT country FROM a
GROUP BY country
HAVING COUNT(DISTINCT name) = SUM(sunk)
