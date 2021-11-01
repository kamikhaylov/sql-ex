SELECT p.maker FROM product p
JOIN PC pc ON p.model = pc.model
WHERE pc.speed >= 750
INTERSECT
SELECT p.maker FROM product p
JOIN laptop l ON p.model = l.model
WHERE l.speed >= 750

