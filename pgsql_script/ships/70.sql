WITH s AS (SELECT o.battle, c.country FROM outcomes o
		   JOIN classes c ON o.ship = c.class
		   WHERE o.ship NOT IN (SELECT name FROM ships)
		   UNION ALL
		   SELECT o.battle, c.country FROM outcomes o
		   JOIN ships s ON o.ship = s.name
		   JOIN classes c ON s.class = c.class)
SELECT DISTINCT battle FROM s
GROUP BY battle, country
HAVING COUNT(*) >= 3