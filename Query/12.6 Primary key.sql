-- 12.6 Primary key

-- for students table 
-- we cant have composit key (combination of 2 columns) for first and last name as pk; there may be duplication
-- email cant be pk : long, can be changed in future by user(pk should be constant)

-- so we introduce new coloumn called id column and use as primary key