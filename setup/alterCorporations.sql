-- alterCorporations.sql
-- 実習に必要なデータ型を錬成
--
BEGIN;
ALTER TABLE public.corporations
  ADD COLUMN city_code_i integer;
UPDATE public.corporations
  SET city_code_i=city_code::integer;
ALTER TABLE public.corporations
  DROP COLUMN city_code;
ALTER TABLE public.corporations
  RENAME city_code_i TO city_code;
END TRANSACTION;

BEGIN;
ALTER TABLE public.corporations
  ADD COLUMN prefecture_code_i integer;
UPDATE public.corporations
  SET prefecture_code_i=prefecture_code::integer;
ALTER TABLE public.corporations
  DROP COLUMN prefecture_code;
ALTER TABLE public.corporations
  RENAME prefecture_code_i TO prefecture_code;
END TRANSACTION;

BEGIN;
ALTER TABLE public.corporations
  ALTER COLUMN update_date TYPE timestamp without time zone;
END TRANSACTION;

BEGIN;
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
END TRANSACTION;
