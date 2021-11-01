SELECT DISTINCT name FROM classes, ships
WHERE displacement > 35000 AND launched >= '1922' AND type = 'bb'
	  AND ships.class = classes.class