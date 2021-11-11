SELECT maker, CASE COUNT(DISTINCT type) 
			  WHEN 1 THEN MIN(type) 
			  WHEN 2 THEN MIN(type) + '/' + MAX(type) 
			  WHEN 3 THEN 'Laptop/PC/Printer' END 
FROM product 
GROUP BY maker