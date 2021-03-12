-- 11.8 blobs
-- to store any binary data

-- TINYBLOB		255B
-- BLOB			64KB
-- MEDIUMBLOB	16MB
-- LONGBLOB		4GB

-- Relational databases are designed to work with structred relational data, not binary data
-- so try to keep this binary data out of database

-- problems with storing files in a database are:
-- increase database size
-- slower backups
-- perfomance problems(slower than reading from file system)
-- more code to read/write files to a database