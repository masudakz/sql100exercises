SELECT
  name,
  corporate_number, 
  city_name,
  close_date
FROM corporations 
WHERE close_date IS NOT NULL
ORDER BY corporate_number
-- LIMIT 10
;
