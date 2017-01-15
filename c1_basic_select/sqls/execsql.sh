#!/bin/bash
sql=`ls -1 *.sql | awk "NR==$1"`
echo $sql
psql -a -U postgres -d sql100 -p 5432 -f $sql
