SELECT Maker, COUNT(DISTINCT model) Qty FROM Product
GROUP BY maker
HAVING COUNT(DISTINCT model) >= ALL(SELECT COUNT(DISTINCT model) FROM Product
									GROUP BY maker)
	   OR
	   COUNT(DISTINCT model) <= ALL(SELECT COUNT(DISTINCT model) FROM Product
	   								GROUP BY maker)