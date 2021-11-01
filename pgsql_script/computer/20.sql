SELECT maker, COUNT(model) FROM product
WHERE type IN ('PC')
GROUP BY maker
HAVING COUNT(model) >= 3