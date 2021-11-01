SELECT DISTINCT o.battle FROM outcomes o
LEFT JOIN ships s ON o.ship = s.name
WHERE s.class = 'Kongo'
