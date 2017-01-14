-- SELECT ~ WHERE 文字列型
SELECT
  city_name,
  city_code,
  corporate_number, 
  name 
FROM corporations 
WHERE
  city_name = '米子市'
--　LIMIT 10
;
