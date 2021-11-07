SELECT row_number() over(order BY maker) AS num,
       CASE WHEN marker_num = 1 THEN maker
	   ELSE ''
	   END AS maker,
	   type
FROM (SELECT row_number() over(partition BY maker order BY maker, order_type) AS marker_num,
	         maker, type
	  FROM (SELECT DISTINCT maker, type,
	  	    CASE WHEN type = 'PC' then 1
	  	   	     WHEN type = 'Laptop' then 2
	  	   	     ELSE 3 
	  	    END AS order_type
	  	    FROM product) AS maker_type_order
	 ) AS maker_type_num



