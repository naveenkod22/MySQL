-- 10.9 serializable isolation

set transaction isolation level serializable;
start transaction;
select * from customers where state = 'VA';
commit;

-- transcation are executed only in sequence, 