WITH t (maker, type) as (
SELECT maker, type FROM product
WHERE maker IN (SELECT maker FROM product
				WHERE maker IN (
					SELECT maker FROM product
					GROUP BY maker
					HAVING COUNT(model) > 1)
				)
GROUP BY maker, type)

SELECT DISTINCT maker, type FROM product
WHERE maker IN (SELECT maker FROM t
				GROUP BY maker
				HAVING COUNT(maker) = 1)


-- Альтернативное решение 1
SELECT maker, type
FROM Product AS Actual_product
GROUP BY maker, type
HAVING COUNT(model) >  1 AND (
    SELECT COUNT(DISTINCT type) FROM Product
    WHERE Actual_product.maker = maker
) = 1

-- Альтернативное решение 2
SELECT maker, MAX(type) FROM product
GROUP BY maker
HAVING COUNT(DISTINCT type) = 1 AND COUNT(model) > 1
