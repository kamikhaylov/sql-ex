SELECT p.maker, AVG(pc.hd) FROM product p
JOIN PC pc ON p.model = pc.model
WHERE p.maker IN (SELECT maker FROM product
				 WHERE type = 'Printer')
GROUP BY p.maker