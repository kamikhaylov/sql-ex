SELECT o.ship, displacement, numGuns 
FROM (SELECT name, displacement, numGuns FROM Ships s 
	  JOIN Classes c ON c.class = s.class
      UNION
      SELECT class AS ship, displacement, numGuns
      FROM Classes c) AS a
RIGHT JOIN Outcomes o
ON o.ship = a.name
WHERE battle = 'Guadalcanal'