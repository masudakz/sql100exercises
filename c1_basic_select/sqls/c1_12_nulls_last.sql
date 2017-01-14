SELECT
  name,
  corporate_number, 
  city_name,
  close_date
FROM corporations 
ORDER BY close_date DESC NULLS LAST;
