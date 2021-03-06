-- 12.8 Foreinkey constraints

-- constraints availibe for fk are  ON UPDATE, ON DELETE 

-- Restrict - regect update from happening
-- cascade - automatically update in child table when pk changes
-- set null - if pk changes it will set to null(child receord ends to be orphan record) 
-- no action - same as RESTRICT