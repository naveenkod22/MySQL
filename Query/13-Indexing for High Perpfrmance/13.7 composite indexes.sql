-- 13.7 composite indexes

use world;
show indexes in city;
explain select name from city where CountryCode = 'ind' and population > 1000000;
-- my sql pics only one index, so use composit indexes

create index idx_CountryCode_population on city(CountryCode, population);
explain select name from city where CountryCode = 'ind' and population > 1000000;

-- max of 16 columns is used, order matters

-- beter to use composit index if needed, bcz indexig is costly, insted of two indexes try to use composit
drop index idx_countrycode on city;
drop index idx_population on city;