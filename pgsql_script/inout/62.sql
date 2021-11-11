SELECT sum(i) 
FROM (SELECT sum(inc) as i 
	  FROM income_o
	  WHERE date < '2001-04-15'
	  UNION
	  SELECT -sum(out) as i
	  FROM outcome_o
	  WHERE date < '2001-04-15'
) as remain