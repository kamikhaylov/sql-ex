SELECT COALESCE(i.point,o.point) point,
  	   COALESCE(i.date,o.date) date,
  	   CASE WHEN sum(inc) is not null
  	         THEN 'inc' ELSE 'out' END operation,
  	   CASE WHEN sum(inc) IS NOT null
  	         THEN sum(inc) ELSE sum(out) END money
  	   FROM income i
  	   FULL JOIN outcome o ON i.date = o.date AND i.point = o.point
  	   GROUP BY COALESCE(i.point, o.point), COALESCE(i.date, o.date)
  	   HAVING SUM(inc) IS NULL OR SUM(out) IS NULL
ORDER BY 1, 2