# LIMIT 1

## 問題

名前だけわかっているTABLEの全ての列名を知る。できれば各列のサンプルデータも。

## SQL

```sql
SELECT * FROM corporations LIMIT 1;
```

## 結果

```
sql100=# SELECT * FROM corporations LIMIT 1;
 sequence_number | corporate_number | process | correct | update_date | change_date |      name      | name_image_id | kind | prefecture_name |        city_name        |  street_number   | address_image_id | prefecture_code | city_code | post_code | address_outside | address_outside_image_id | close_date | close_cause | successor_corporate_number | change_cause | assignment_date 
-----------------+------------------+---------+---------+-------------+-------------+----------------+---------------+------+-----------------+-------------------------+------------------+------------------+-----------------+-----------+-----------+-----------------+--------------------------+------------+-------------+----------------------------+--------------+-----------------
               1 | 1000013050238    | 01      | 0       | 2015-10-26  | 2015-10-05  | 鳥取簡易裁判所 |               | 101  | 鳥取県          | 鳥取市                  | 東町２丁目
２２３ |                  | 31              | 201       | 6800011   |                 |                          |            |             |                            |              | 2015-10-05
```

## 解説

「いきなり`LIMIT`ですか。標準SQLの範囲でやるってはなしだったんじゃ」  
「いいの。カラム名一覧出すのに一番簡単なんだからいいの。これ避けたらカタログ・テーブル参照とか、もっと実装依存になっちゃうでしょうが。そんなことより、そっちのSQL初心者って設定を忘れたツッコミもたいがいやぞ。」
