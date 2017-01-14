SELECT
  city_name,
  COUNT(*) as corp_count
FROM corporations 
GROUP BY city_name
ORDER BY corp_count DESC
-- LIMIT 10
;
