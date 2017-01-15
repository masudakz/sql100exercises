SELECT
  city_name,
  post_code,
  COUNT(*) as corp_count
FROM corporations
GROUP BY GROUPING SETS ((), (city_name), (city_name, post_code))
ORDER BY city_name NULLS FIRST, corp_count DESC 
-- LIMIT 10
;
