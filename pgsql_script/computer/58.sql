SELECT DISTINCT maker, type,
	   CAST((
	   COUNT(model) OVER(PARTITION BY maker, type)) * 100.0 /
	   COUNT(model) OVER(PARTITION BY maker) AS NUMERIC(5,2)) AS mods
FROM (SELECT pt.maker, pt.type, p.model
	  FROM (SELECT DISTINCT p1.maker, p2.type
	  		FROM product p1, product p2) pt
	  LEFT JOIN product p ON pt.maker = p.maker AND pt.type = p.type) allP