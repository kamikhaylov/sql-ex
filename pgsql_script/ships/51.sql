WITH allships AS (
	SELECT name, class FROM ships
	UNION
	SELECT ship, ship from outcomes
)

SELECT name FROM allships sh
JOIN classes cl ON sh.class = cl.class
WHERE numguns >= ALL (SELECT cla.numguns FROM classes cla
				   WHERE cla.displacement = cl.displacement
				   AND cla.class IN (SELECT sh.class FROM allships sh))