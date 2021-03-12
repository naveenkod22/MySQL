-- 13.6 full-text index

-- used to build fast and flexible search engines

-- use sql_blog;
-- select * from post where title like '%react reduex%' or body like '%react reduex%';
-- quirey will be slow due to no index; if indexing is done , search is done on  string 'react reduex' in exact order and sequence

-- indexing is done on list of words to list of documents for full-text index
-- create fulltext index idx_title_body on posts(title, body);

-- select * from posts where match(title, body) aganist('react redux');
-- string can be in any order, can be seperated by any no of words

-- select * from posts where match(title, body) aganist('" hello world" react -redux +form' in boolean mode);
-- -:must not have, +: optinal, "" : for exat phrase
