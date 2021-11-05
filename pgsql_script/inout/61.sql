SELECT sum(i) 
FROM (SELECT sum(inc) as i 
	  FROM income_o
	  UNION
	  SELECT -sum(out) as i
	  FROM outcome_o
) as remain