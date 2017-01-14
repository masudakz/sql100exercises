SELECT
  city_name,
  city_code,
  corporate_number, 
  name, 
  update_date,
  correct 
FROM corporations 
WHERE
  city_code = 202
  AND update_date >= '2016-04-01'
  AND correct = true;
