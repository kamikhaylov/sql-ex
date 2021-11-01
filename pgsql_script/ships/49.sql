SELECT DISTINCT sh.name FROM ships sh
JOIN classes cl ON sh.class = cl.class
WHERE cl.bore = 16
UNION
SELECT DISTINCT o.ship FROM classes cl, outcomes o
WHERE o.ship = cl.class AND cl.bore = 16
UNION
SELECT DISTINCT sh.name FROM ships sh
JOIN outcomes o ON sh.name = o.ship
JOIN classes cl ON sh.class = cl.class
WHERE cl.bore = 16

