SELECT name
FROM passenger
WHERE id_psg IN (SELECT id_psg
  				 FROM pass_in_trip pit
				 JOIN trip t ON pit.trip_no = t.trip_no
  			     WHERE time_in < time_out AND datepart(dw, date) = 7)