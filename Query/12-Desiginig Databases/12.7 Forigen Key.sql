-- 12.7 Forigen Key
-- fk is pk of other table

-- enrolmelts table may or may not have pk
-- in design we dont have pk for enrolments so we dont add here
-- if we have pk, it will be easy if there is a child for enrolments, so it's pk can act as fk for child


-- if we have composit key(student_id, course_id) we can avoid duplicates of same student enroling same course twice
-- composit key will dificult for a fk

-- any way it is depends on problem, here we dont need pk
-- no need to design what-if senerios
-- if we need pk for enrolments we can create latter through scripts