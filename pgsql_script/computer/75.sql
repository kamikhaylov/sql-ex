SELECT maker, MAX(l.price) laptop, MAX(pc.price) pc, MAX(pr.price) printer
FROM laptop l 
RIGHT JOIN product p ON l.model = p.model 
LEFT JOIN pc ON pc.model = p.model 
LEFT JOIN printer pr ON p.model = pr.model
WHERE maker IN (SELECT maker FROM product 
				WHERE model IN (SELECT model FROM pc 
					            WHERE price IS NOT NULL
							    UNION ALL
							    SELECT model FROM printer 
							    WHERE price IS NOT NULL
								UNION ALL
								SELECT model FROM laptop
								WHERE price IS NOT NULL)) 
GROUP BY maker 
ORDER BY maker;