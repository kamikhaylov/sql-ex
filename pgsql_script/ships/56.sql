SELECT c.class, COUNT(s.ship)
FROM classes c
  LEFT JOIN (
       SELECT o.ship, sh.class
       FROM outcomes o
       LEFT JOIN ships sh ON sh.name = o.ship
       WHERE o.result = 'sunk'
    ) AS s ON s.class = c.class OR s.ship = c.class
GROUP BY c.class
ORDER BY c.class
