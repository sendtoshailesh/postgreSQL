SELECT * FROM pg_tables \watch 10


This is possible without reverting to PL/pgSQL:

Insert into employee (id, name)
select 1,'Mike'
from generate_series(1,3);


Or if you want different IDs for each row:

Insert into employee (id, name)
select id,'Mike'
from generate_series(1,3) as t(id);


try using loop:

do
$$
declare 
  i record;
begin
  for i in 1..3 loop
    Insert into employee values(1,'Mike');
  end loop;
end;
$$
;

postgre=# SELECT * FROM TABLE WHERE CONDITION
postgre=# \watch 5
-- now the "SELECT * FROM TABLE WHERE CONDITION" is re-executed every 5 seconds


watch -n1 'psql -h {ip} {db} {user} -c "select count(*) from pg_stat_activity;"'


select count(*) from pg_stat_activity;
\watch 2


export PGPASSWORD=pass1234
watch -n1 'psql -h 10.45.195.5 -U postgres -c "select count(*) from pg_stat_activity;"'

SELECT inet_server_addr();



