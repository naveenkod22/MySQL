-- 10.5 Transaction isolation levels

-- repeatable reads is default in mysql

-- read uncommited, read commited are used to increase perfomance
-- are used when there is less frequent changes with tables

show variables like 'transaction_isolation';
set transaction isolation level serializable; 
-- this sets for upcomming transcation

set session transaction isolation level serializable; 
-- this sets for all new transcations, in this session

set global transaction isolation level serializable; 
-- this sets for all new transcations, in all sessions
