SELECT c.class, SUM(sh.sunked) FROM classes c
LEFT JOIN (SELECT t.name AS name, t.class AS class, CASE WHEN o.result = 'sunk' THEN 1 ELSE 0 END AS sunked
     FROM (SELECT name, class FROM ships
       	   UNION
      	   SELECT ship, ship FROM outcomes) AS t
     LEFT JOIN outcomes o ON t.name = o.ship) sh ON sh.class = c.class
GROUP BY c.class
HAVING COUNT(DISTINCT sh.name) >= 3 AND SUM(sh.sunked) > 0