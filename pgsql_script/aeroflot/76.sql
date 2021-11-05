WITH c AS
(SELECT ROW_NUMBER() OVER (PARTITION BY ps.ID_psg, pit.place ORDER BY pit.date) AS rowNumber, 
DATEDIFF (minute, time_out, DATEADD(DAY,IIF(time_in<time_out, 1, 0), time_in)) AS timeFlight, ps.Id_psg, ps.name
FROM Pass_in_trip pit LEFT JOIN trip tr ON pit.trip_no = tr.trip_no
LEFT JOIN Passenger ps ON ps.ID_psg = pit.ID_psg
)
SELECT MAX(c.name), SUM(timeFlight) FROM c
GROUP BY c.ID_psg
HAVING MAX(rowNumber) = 1
