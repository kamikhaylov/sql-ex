SELECT country, class FROM classes
WHERE (country = 'russia' AND ('russia' = ANY(select country from classes))
	   OR (country != 'russia' AND NOT ('russia' = ANY(select country from classes))))