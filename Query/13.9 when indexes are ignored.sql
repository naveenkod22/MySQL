-- 13.9 when indexes are ignored

explain select name from city where CountryCode = 'ind' or population > 1000000;
-- here index is ignored

explain select name from city where CountryCode = 'ind' 
union
select name from city where population > 1000000;

explain select name from city where population + 10000 > 1000000;
-- quirey don't use index bcz of expression

explain select name from city where population > 1010000;
-- insted of population + 10000 > 1000000 do population > 1010000

-- always isolate columns to use indexing