-- 10.4 concurrency problems

-- lost updates
-- two transcatons try to update same record in diffrent fields, 
-- last commited record over-rides changes made by previous transcation(these must be un-commited)
-- locks are used to run this transcations in sequence, to solve the problem

-- dirty Reads
-- reads done on uncommited changes
-- we need to provide level of isolation(like: read commited) to solve this problem

-- non-repeating reads
-- if we read some thing twice and get diffrennt records
-- we need to provide isolation(repetable reads)

-- phantom reads
-- data that suddenly appers(due to other query), after running a query
-- this problem is solved based on importance
-- isolation level serializable(this results in more weight, hurt perfomance, system slow down),
-- used only when it's critical