SELECT COALESCE(i.point, o.point) point,
	SUM(COALESCE(inc, 0)) - SUM(COALESCE(out, 0)) AS remainder
FROM income_o i
FULL JOIN outcome_o o ON i.date = o.date AND i.point=o.point
WHERE COALESCE(i.date, o.date) < '2001-04-15'
GROUP BY COALESCE(i.point, o.point)