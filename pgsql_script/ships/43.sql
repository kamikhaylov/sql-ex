SELECT name
FROM battles
WHERE EXTRACT(YEAR FROM date) 
	  NOT IN (SELECT launched
			  FROM ships
			  WHERE launched IS NOT NULL)
