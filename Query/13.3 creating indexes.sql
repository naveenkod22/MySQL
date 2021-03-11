-- 13.3 creating indexes

select name from city where countrycode = 'ind';

explain select name from city where countrycode = 'ind';

create index idx_countrycode on city (countrycode);
explain select name from city where countrycode = 'ind'; 

-- exercise

select * from city where population > 2000000;
explain select * from city where population > 2000000;

create index idx_population on city(population);
explain select * from city where population > 2000000;
