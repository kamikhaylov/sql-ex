WITH CTE AS (SELECT 1 n, CAST(0 as varchar(16)) bit_or,
	 	   code, speed, ram FROM PC
		   UNION ALL
		   SELECT n * 2, CAST(convert(bit,(speed|ram)&n) as varchar(1))+cast(bit_or as varchar(15)),
		   code, speed, ram
		   FROM CTE WHERE n < 65536)

SELECT code, speed, ram FROM CTE
WHERE n = 65536 AND CHARINDEX('1111', bit_or )> 0