-- 12.31 storage engines
-- it determines how data is stored, features available to us
-- they are used at table levels, same db can have different storage engines
-- it's expensive, bcz table need be rebuilt 

show engines;
alter table customers
engine = InnoDB;
