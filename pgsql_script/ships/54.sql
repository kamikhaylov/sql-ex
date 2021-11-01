SELECT CAST(AVG(numguns * 1.0) AS NUMERIC(6,2))
FROM (
	  SELECT numguns, name FROM classes c
	  LEFT JOIN ships s ON c.class = s.class
	  WHERE type = 'bb' AND name != 'NULL' AND c.class != 'NULL'
	  UNION ALL
	  SELECT DISTINCT numguns, ship FROM classes c
	  LEFT JOIN outcomes o ON c.class = o.ship
	  WHERE ship NOT IN (SELECT name FROM ships)
	  	    AND type = 'bb' AND c.class != 'NULL') allships