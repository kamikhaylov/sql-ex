SELECT DISTINCT a.date , a.r, b.point, b.inc, c.point, c.out
FROM (SELECT DISTINCT date,
	  ROW_Number() OVER(PARTITION BY date ORDER BY code asc) AS r 
	  FROM income
      UNION
      SELECT DISTINCT date, 
	  ROW_Number() OVER(PARTITION BY date ORDER BY code asc) FROM outcome) a
LEFT JOIN (SELECT date, point, inc,
		   ROW_Number() OVER(PARTITION BY date ORDER BY code asc) AS ri 
		   FROM income) b on b.date=a.date AND b.ri=a.r
LEFT JOIN (SELECT date, point, out,
		   ROW_Number() OVER(PARTITION BY date ORDER BY code asc) AS ro 
		   FROM outcome) c ON c.date=a.date AND c.ro = a.r