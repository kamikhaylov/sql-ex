SELECT COALESCE(i.point, o.point) point, 
	   SUM(COALESCE(inc, 0) - COALESCE(out, 0)) remainder
FROM income_o i
FULL JOIN outcome_o o ON i.date = o.date AND i.point = o.point
GROUP BY COALESCE(i.point, o.point)