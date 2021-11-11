WITH q AS (
  SELECT
    ISNULL(i.point, o.point) point,
	ISNULL(i.date, o.date) date,
	COALESCE(SUM(i.inc), 0) - COALESCE(SUM(o.out), 0) balance
    FROM income i
    FULL JOIN outcome o ON i.point=o.point AND i.date=o.date AND i.code=o.code
    GROUP BY ISNULL(i.point, o.point), ISNULL(i.date, o.date)
)
SELECT
  point, convert(varchar, date, 103) day,
  SUM(balance) over(partition by point order by date RANGE UNBOUNDED PRECEDING) AS rem
  FROM q
ORDER BY point, date
;

SELECT DISTINCT
  point,
  CONVERT(varchar, date, 103) day,
  SUM(inc) over(partition by point order by date RANGE UNBOUNDED PRECEDING) AS rem
  FROM (
    SELECT point, date, inc FROM income
    UNION ALL
    SELECT point, date, -out from outcome
  ) q
ORDER BY point, date
;