WITH pricePC_Laptop
	AS 
	(SELECT p.maker, p.type, pc.price FROM product p
	LEFT JOIN PC pc ON pc.model = p.model
	WHERE p.maker = 'A' AND type = 'PC'
	UNION ALL
	SELECT p.maker, p.type, l.price FROM product p
	LEFT JOIN laptop l ON l.model = p.model
	WHERE p.maker = 'A' AND type = 'Laptop')

SELECT AVG(price) FROM pricePC_Laptop;