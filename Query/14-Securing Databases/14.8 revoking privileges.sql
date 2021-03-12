-- 14.8 revoking privilages

grant create view on sql_store.* to moon_app; -- granting previlage

revoke create view on sql_store.* from moon_app; -- revoking previlage