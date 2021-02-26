-- 6.2 String Functions

select length('sky');
select upper('sky');
select lower('Slip');
select trim('             Slip         ');
select rtrim('Slip         ');
select ltrim('          Slip');
select left('kindergatden', 4);
select right('kindergatden', 6);
select substring('kindergatden', 5, 4);
select substring('kindergatden', 5);
select locate('q', 'kIndergarden');
select locate('garden', 'kIndergarden');
select replace('kIndergarden', 'garden', ' Garden.');
select concat('firsr', ' last');
-- for more functions; google for mysql string functions