SELECT code, model, color, type, price,
MAX(model )OVER(PARTITION BY g) max_model,
MAX(CASE type WHEN 'Laser' THEN 1 ELSE 0 END) OVER(PARTITION BY g) +
MAX(CASE type WHEN 'Matrix' THEN 1 ELSE 0 END) OVER(PARTITION BY g) +
MAX(CASE type WHEN 'Jet' THEN 1 ELSE 0 END) OVER(PARTITION BY g) distinct_types,
AVG(price) OVER(PARTITION BY g)
FROM(SELECT *,
     CASE color WHEN 'n' THEN 0 ELSE ROW_NUMBER()OVER(ORDER BY code)END  +
     CASE color WHEN 'n'  THEN 1 ELSE-1 END*ROW_NUMBER()OVER(PARTITION BY color ORDER BY code) g
     FROM Printer) t