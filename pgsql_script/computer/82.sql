WITH CTE(code, price, number) AS (SELECT PC.code, PC.price, 
								  number = ROW_NUMBER() OVER (ORDER BY PC.code)
                                  FROM PC)
SELECT CTE.code, AVG(C.price) FROM CTE
JOIN CTE C ON (C.number-CTE.number) < 6 AND (C.number-CTE.number) >= 0
GROUP BY CTE.number,CTE.code
HAVING COUNT(CTE.number) = 6