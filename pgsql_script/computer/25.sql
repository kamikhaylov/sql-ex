SELECT DISTINCT maker
FROM product
WHERE type = 'Printer'
		AND maker IN (SELECT DISTINCT maker
		FROM product
		WHERE model IN (SELECT DISTINCT model
						FROM PC						
						WHERE speed IN (SELECT MAX(speed)
										FROM PC
									   	WHERE ram IN (SELECT MIN(ram)
										FROM PC)
									   ) AND ram IN (SELECT MIN(ram)
										FROM PC)
					   )
		)