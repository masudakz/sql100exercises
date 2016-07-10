# 実習に必要なデータ型を錬成

## integer

city_code を integer にする。

```sql
ALTER TABLE public.corporations
  ADD COLUMN city_code_i integer;
UPDATE public.corporations
  SET city_code_i=city_code::integer;
ALTER TABLE public.corporations
  DROP COLUMN city_code;
ALTER TABLE public.corporations
  RENAME city_code_i TO city_code;
```

同様にprefecture_codeもintegerにする。

## timestamp


updatedDate を timestamp にする。

```sql
ALTER TABLE public.corporations
　 ALTER COLUMN update_date TYPE timestamp without time zone;
```

## boolean

correctをbooleanにする。

```sql
ALTER TABLE public.corporations
  ADD COLUMN correct_b boolean;
UPDATE public.corporations
  SET correct_b=true
  WHERE correct = '1';
UPDATE public.corporations
  SET correct_b=false
  WHERE correct <> '1';
ALTER TABLE public.corporations
  DROP COLUMN correct;
ALTER TABLE public.corporations
  RENAME correct_b TO correct;
```
