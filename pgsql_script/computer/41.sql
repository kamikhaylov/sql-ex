WITH allModelPrice AS (SELECT model, price FROM pc
UNION
SELECT model, price FROM laptop
UNION
SELECT model, price FROM printer)

SELECT DISTINCT p.maker, 
CASE WHEN MAX(CASE WHEN a.price IS NULL THEN 1 ELSE 0 END) = 0 THEN
MAX(a.price) END 
FROM allModelPrice a
LEFT JOIN product p ON p.model = a.model
GROUP BY p.maker