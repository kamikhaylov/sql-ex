SELECT cl.class, MIN(sh.launched) FROM classes cl
LEFT JOIN ships sh ON cl.class = sh.class
GROUP BY cl.class
ORDER BY cl.class