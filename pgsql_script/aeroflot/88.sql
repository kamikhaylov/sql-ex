SELECT (SELECT name FROM Passenger WHERE ID_psg = B.ID_psg) AS name,
       B.trip_Qty,
       (SELECT name FROM Company WHERE ID_comp = B.ID_comp) AS Company
FROM (SELECT P.ID_psg, MIN(T.ID_comp) AS ID_comp, COUNT(*) AS trip_Qty, MAX(COUNT(*)) OVER() AS Max_Qty
      FROM Pass_in_trip AS P
	  JOIN Trip AS T ON P.trip_no = T.trip_no
      GROUP BY P.ID_psg
      HAVING MIN(T.ID_comp) = MAX(T.ID_comp)) AS B
WHERE B.trip_Qty = B.Max_Qty