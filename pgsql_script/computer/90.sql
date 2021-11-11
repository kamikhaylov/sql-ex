SELECT maker, model, type 
FROM (SELECT maker, model, type,
	  		 row_number() over (ORDER BY model) s1,
			 row_number() over (ORDER BY model DESC) s2
	  FROM product) t1
WHERE s1 > 3 AND s2 > 3