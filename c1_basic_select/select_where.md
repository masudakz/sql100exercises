# SELECT 〜 WHERE

## 問題

1. 特定の市町村についての法人だけの一覧
2. 上記のうちさらに特定の更新日付範囲の一覧
3. 上記のうちさらに訂正区分が`true`の一覧

## SQL

```sql
SELECT
  city_name,
  city_code,
  corporate_number, 
  name 
FROM corporations 
WHERE
  city_name = '米子市'
LIMIT 10;
```
```sql
SELECT
  city_name,
  city_code,
  corporate_number, 
  name 
FROM corporations 
WHERE
  city_code = 202
LIMIT 10;
```
```sql
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
```

追加した条件をコメントにして一つ前に戻した例。　

```sql
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
  -- AND update_date >= '2016-04-01'
  -- AND correct = true
  ;
```

## 結果

```
TBF
```

## 解説

TBF
