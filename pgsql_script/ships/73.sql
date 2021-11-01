SELECT country, name battle  
FROM classes, battles
EXCEPT
SELECT country, battle 
FROM (SELECT class, name AS ship_name FROM ships
      UNION
      SELECT ship, ship FROM outcomes) AS s
JOIN classes c on s.class = c.class
JOIN outcomes o on o.ship = s.ship_name