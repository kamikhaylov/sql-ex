SELECT p.maker, MAX(pc.price) FROM product p
JOIN PC pc ON p.model = pc.model
GROUP BY maker