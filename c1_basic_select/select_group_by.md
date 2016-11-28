# COUNT / GROUP BY / GROUPING SETS

合計中計小計 

- 集計についての基本操作

## 問題

1. 登記法人数が何件あるか
2. 市町村別に何件あるか、数の多い市町村順に出力する。
3. 市町村別の中計と、郵便番号まで一致する範囲での小計を出力する。
4. 上記にさらに総計も同時に出力する。

## SQL

```sql
SELECT
  COUNT(*)
FROM corporations; 
```

```sql
SELECT
  city_name,
  COUNT(*) as corp_count
FROM corporations 
GROUP BY city_name
ORDER BY corp_count DESC
LIMIT 10;
```

```sql
SELECT
  city_name,
  post_code,
  COUNT(*) as corp_count
FROM corporations
GROUP BY GROUPING SETS ((city_name), (city_name, post_code))
ORDER BY city_name, corp_count DESC;
```

```sql
SELECT
  city_name,
  post_code,
  COUNT(*) as corp_count
FROM corporations
GROUP BY GROUPING SETS ((), (city_name), (city_name, post_code))
ORDER BY city_name NULLS FIRST, corp_count
DESC LIMIT 10;
```

## 結果

|count| 
|-----|
|16738|

|          city_name          | corp_count| 
|-----------------------------|----------:|
| 鳥取市                      |       5919|
| 米子市                      |       4600|
| 倉吉市                      |       1550|
| 境港市                      |        980|
| 東伯郡琴浦町                |        438|
| 西伯郡大山町                |        403|
| 八頭郡八頭町                |        397|
| 東伯郡北栄町                |        357|
| 東伯郡湯梨浜町              |        315|
| 岩美郡岩美町                |        304|
 
|         city_name          | post_code | corp_count |
|----------------------------|-----------|-----------:|
|…|…|…|
| 岩美郡岩美町               |           |        304|
| 岩美郡岩美町               | 6810003   |         78|
| 岩美郡岩美町               | 6810073   |         44|
| 岩美郡岩美町               | 6810024   |         23|
| 岩美郡岩美町               | 6810071   |         22|
|…|…|…|
 
|        city_name       | post_code | corp_count|
|------------------------|-----------|----------:|
|                        |           |      16738|
| 倉吉市                  |           |       1550|
| 倉吉市                  | 6820023   |         77|
| 倉吉市                  | 6820022   |         73|
| 倉吉市                  | 6820021   |         56|
| 倉吉市                  | 6820025   |         44|
| 倉吉市                  | 6820018   |         43|
| 倉吉市                  | 6820925   |         41|
| 倉吉市                  | 6820806   |         37|
| 倉吉市                  | 6820802   |         36|


## 解説

1. ここまでは、表corporationsに格納済みの値を出力するばかりでした。SELECT の後に列挙する出力には、関数・式を指定することもできます。まずは集約関数`COUNT(*)`、入力行の数の例です。表corporationsには数値型の列がほとんどないので、その他の関数については、別の章で扱います。
2. 法人数を市町村名`city_name`毎の小計で出力するには、`GROUP BY`句を指定します。出力は、`GROUP BY`で1行に集約されるので、`SELECT`に列挙できるものは、グループで共通になる、`GROUP BY`で指定した列と、グループ内を集約した集約関数の値だけとなります。
3. グループ化を2階層にした中計・小計をするには、`GROUP BY`句に`GROUPING SETS`を指定します。`(city_name)`が中計の設定、`(city_name, post_code)`で小計部分の設定となっています。中計行の`post_code`はひとつの値に決まるわけではないので、不定の意味で`NULL`で出力されます。
4. 同時に全体集約の出力行を入れたいときは、`GROUPING SETS`に列指定無しの`()`を追加してください。
