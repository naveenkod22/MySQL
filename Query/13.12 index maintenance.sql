-- 13.12 index maintenance

-- before creating indexes check existing onces
-- duplicatig indexes : same set of columns in same order
-- redundant indexes : (a, b) -- (a):no; (b, a):ok; (b):ok

-- drop duplicate, redudant, unused indexes