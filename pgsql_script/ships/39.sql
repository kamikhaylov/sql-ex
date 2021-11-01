SELECT DISTINCT ship FROM Outcomes os
JOIN battles bs ON os.battle = bs.name
WHERE EXISTS (SELECT ship FROM Outcomes oa
			  JOIN battles ba ON oa.battle = ba.name
   			  WHERE oa.ship = os.ship 
			  AND result = 'damaged'
			  AND bs.date > ba.date) 
AND EXISTS   (SELECT ship FROM Outcomes ou
 			  WHERE ou.ship = os.ship
 			  GROUP BY ship 
 			  HAVING COUNT(battle) > 1
);