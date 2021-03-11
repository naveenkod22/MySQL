-- 13.8 order of column in composite indexes

-- most frequently used first
-- columns with higher cardanality(unique values) first; its not a hard rule, take data and quirey speed into account
-- try to understand how mysql executes quires

select name from city 
use index (idx_name) -- explitly state index to be used
where CountryCode = 'ind' and population > 1000000;

-- optimize should be done on perfomance critical quires