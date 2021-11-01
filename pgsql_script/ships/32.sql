SELECT country, CAST(AVG(POWER(allships.bore, 3)/2) AS NUMERIC(6,2))
FROM (SELECT country, cl.class, bore, name FROM classes cl
	  LEFT JOIN ships sh ON cl.class = sh.class
	  UNION
	  SELECT country, class, bore, ship AS name FROM classes cl
	  LEFT JOIN outcomes o ON cl.class = o.ship
	  WHERE ship = class 
	  	    AND ship NOT IN (SELECT name FROM ships)) AS allships
WHERE name IS NOT NULL
GROUP BY country