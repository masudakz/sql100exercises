{
  for(i=2; i <= NF; i++) {
    n=$i % 16 +1;
    cmd="./execsql.sh " n;
    system(cmd)
  }
}
