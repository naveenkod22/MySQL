-- 13.5 prefix indexes

drop index  idx_name on city;
create index idx_name on city(name(5));
-- no 4 is to data depedent, to find optimal number we should look at given data 

select
	count(distinct left(name, 1)),
    count(distinct left(name, 2)),
    count(distinct left(name, 3)),
    count(distinct left(name, 5)),
	count(distinct left(name, 10))
from city;