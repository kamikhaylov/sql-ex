SELECT p.name, time_in_min.minutes
FROM (SELECT pit.ID_psg,
      SUM((DATEDIFF(minute, time_out, time_in) + 1440)%1440) AS minutes,
      MAX(SUM((DATEDIFF(minute, time_out, time_in) + 1440)%1440)) OVER() AS max_minutes
      FROM Pass_in_trip pit
	  JOIN trip t ON pit.trip_no = t.trip_no
      GROUP BY pit.ID_psg) AS time_in_min
JOIN passenger p ON p.ID_psg = time_in_min.ID_psg
WHERE time_in_min.minutes = time_in_min.max_minutes