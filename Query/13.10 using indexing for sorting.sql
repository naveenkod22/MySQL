-- 13.10 using indexing for sorting

show indexes in city; 

explain select id from city order by Population, CountryCode; -- high cost beacuse of order
show status like 'last_query_cost'; 

explain select id from city order by  CountryCode, Population; -- low cost
show status like 'last_query_cost'; 

explain select id from city order by CountryCode, district; -- high cost as indexing is not used
show status like 'last_query_cost'; 

explain select id from city order by  CountryCode desc, Population; -- high cost
show status like 'last_query_cost'; 

explain select id from city order by  CountryCode desc, Population desc; -- low cost
show status like 'last_query_cost';

-- composit index on columns (a, b) 
-- low cost : a; a,b; a desc, b desc
-- high cost : b; a, c, b, a desc, b, a

explain select id from city 
where CountryCode = 'ind' -- due to this very low cost
order by  Population desc; -- and no need to use countrycode for sorting bcz of indexing
show status like 'last_query_cost';