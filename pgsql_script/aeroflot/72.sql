WITH c AS (
SELECT p.id_psg id_psg_p, COUNT(t.id_comp) trip_qty FROM pass_in_trip p
	  JOIN trip t ON p.trip_no = t.trip_no
      GROUP BY p.id_psg
	  HAVING MAX(t.id_comp) = MIN(t.id_comp))
SELECT p.name, trip_qty FROM passenger p
JOIN c ON p.id_psg = c.id_psg_p
WHERE trip_qty = (SELECT MAX(trip_qty) FROM c)