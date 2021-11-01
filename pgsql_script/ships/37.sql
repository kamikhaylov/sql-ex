SELECT cl.class
FROM classes cl
LEFT JOIN (SELECT class, name FROM ships
		  UNION
		  SELECT ship, ship FROM outcomes) AS s
ON cl.class = s.class
GROUP BY cl.class
HAVING COUNT(s.name) = 1
ORDER BY cl.class
