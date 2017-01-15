#!/bin/bash
# 16個のsqlをランダムではなく偏りをつけて連続実行する負荷テスト
# 引数で与えるファイルの英文テキスト和文テキストの文字頻度の偏りを使う
# od のダンプ結果のmod で16個から選ぶのでバイナリファイルを与えてもよい
od $1 | awk -f ./execsql.awk
