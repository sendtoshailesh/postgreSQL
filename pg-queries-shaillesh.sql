View connection information

SELECT datname,usename,client_addr,client_port,query FROM pg_stat_activity ;


Query the SQL execution information
You can execute the following SQL statements to view current queries executed by users who connect to the database:




bench=# \x
bench=# SELECT query, calls, total_exec_time, rows, 100.0 * shared_blks_hit /
               nullif(shared_blks_hit + shared_blks_read, 0) AS hit_percent
          FROM pg_stat_statements ORDER BY total_exec_time DESC LIMIT 5;
          
          

blocking another session.

select pid, 
       usename, 
       pg_blocking_pids(pid) as blocked_by, 
       query as blocked_query
from pg_stat_activity
where cardinality(pg_blocking_pids(pid)) > 0;



