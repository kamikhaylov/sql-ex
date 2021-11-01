WITH t2 AS (SELECT count(*) c, date 
	  FROM trip, (SELECT DISTINCT trip_no, date 
				  FROM pass_in_trip 
				  GROUP BY trip_no, date) AS t1
	  WHERE trip.trip_no = t1.trip_no AND town_from = 'Rostov'
	  GROUP BY date)

SELECT c, date FROM t2
WHERE c IN (SELECT MAX(c) FROM t2)
