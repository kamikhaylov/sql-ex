SELECT name FROM ships
WHERE name = class
UNION
SELECT ship FROM outcomes, classes
WHERE outcomes.ship = classes.class