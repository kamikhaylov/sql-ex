SELECT MIN(t1.trip_no), MIN(t2.trip_no), MIN(t3.trip_no),
	   MAX(t1.trip_no), MAX(t2.trip_no), MAX(t3.trip_no)
FROM trip t1, trip t2, trip t3
WHERE t2.trip_no > t1.trip_no AND t3.trip_no > t2.trip_no