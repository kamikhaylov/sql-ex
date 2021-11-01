SELECT DISTINCT sh.class FROM ships sh
JOIN outcomes o ON sh.name = o.ship
WHERE o.result = 'sunk'
UNION
SELECT DISTINCT cl.class FROM classes cl, outcomes o
WHERE cl.class = o.ship AND result = 'sunk'