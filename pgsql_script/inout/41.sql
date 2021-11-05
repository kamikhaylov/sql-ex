SELECT i.point, i.date, inc, out 
FROM income_o i
LEFT JOIN outcome_o o ON i.point = o.point 
AND i.date = o.date
UNION
SELECT o.point, o.date, inc, out 
FROM income_o i
RIGHT JOIN outcome_o o ON i.point = o.point 
AND i.date = o.date