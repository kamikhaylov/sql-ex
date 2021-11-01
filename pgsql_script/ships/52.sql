SELECT s.name FROM ships s
JOIN classes c ON s.class = c.class
WHERE c.country = 'Japan'
	  AND c.type = 'bb'
	  AND (c.numguns >= 9 OR c.numguns IS NULL)
	  AND (c.bore < 19 OR c.bore IS NULL)
	  AND (c.displacement <= 65000 OR c.displacement IS NULL)