SELECT maker 
FROM Product 
GROUP BY maker 
HAVING count(distinct type) = 1 AND (
	min(type) = 'printer' OR (min(type) = 'pc' AND count(model) >= 3)
)