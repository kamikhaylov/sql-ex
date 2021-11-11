SELECT c.name, sum(timeAir.timeAir)
FROM (SELECT DISTINCT t.id_comp, pit.trip_no, pit.date, t.time_out, t.time_in,
      CASE
      WHEN DATEDIFF(mi, t.time_out, t.time_in) > 0 then DATEDIFF(mi, t.time_out, t.time_in)
      WHEN DATEDIFF(mi, t.time_out, t.time_in) <= 0 then DATEDIFF(mi, t.time_out, t.time_in + 1)
      END timeAir
      FROM pass_in_trip pit 
	  LEFT JOIN trip t ON pit.trip_no = t.trip_no) timeAir 
LEFT JOIN company c ON timeAir.id_comp = c.id_comp
GROUP BY c.name