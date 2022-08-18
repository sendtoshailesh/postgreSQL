CREATE ROLE alice 
LOGIN 
PASSWORD 'securePass1';


CREATE ROLE myuser 
LOGIN 
PASSWORD 'Welcome0';

alter role myuser login;

postgres=> grant myuser to postgres;
GRANT ROLE
postgres=> create database mydb owner myuser;
CREATE DATABASE
postgres=>

SELECT grantor, grantee, table_schema, table_name, privilege_type
FROM information_schema.table_privileges
WHERE grantee = 'myuser'

==============================================================================
admin_shkm_altostrat_com@instance-mumbai:~$ psql -h 10.45.193.4 -U postgres
Password for user postgres:
psql (14.4 (Debian 14.4-1.pgdg100+1), server 10.21)
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
Type "help" for help.

postgres=>
postgres=>
postgres=>
postgres=>
postgres=> \l+
                                                                                  List of databases
     Name      |       Owner       | Encoding |  Collate   |   Ctype    |            Access privileges            |  Size   | Tablespace |                Description
---------------+-------------------+----------+------------+------------+-----------------------------------------+---------+------------+--------------------------------------------
 airlines      | postgres          | UTF8     | en_US.UTF8 | en_US.UTF8 |                                         | 7863 kB | pg_default |
 cloudsqladmin | cloudsqladmin     | UTF8     | en_US.UTF8 | en_US.UTF8 |                                         | 9127 kB | pg_default |
 demo          | postgres          | UTF8     | en_US.UTF8 | en_US.UTF8 |                                         | 2640 MB | pg_default |
 example       | postgres          | UTF8     | en_US.UTF8 | en_US.UTF8 |                                         | 765 MB  | pg_default |
 pagila        | postgres          | UTF8     | en_US.UTF8 | en_US.UTF8 |                                         | 339 MB  | pg_default |
 postgres      | cloudsqlsuperuser | UTF8     | en_US.UTF8 | en_US.UTF8 |                                         | 14 MB   | pg_default | default administrative connection database
 template0     | cloudsqladmin     | UTF8     | en_US.UTF8 | en_US.UTF8 | =c/cloudsqladmin                       +| 7729 kB | pg_default | unmodifiable empty database
               |                   |          |            |            | cloudsqladmin=CTc/cloudsqladmin         |         |            |
 template1     | cloudsqlsuperuser | UTF8     | en_US.UTF8 | en_US.UTF8 | =c/cloudsqlsuperuser                   +| 7863 kB | pg_default | default template for new databases
               |                   |          |            |            | cloudsqlsuperuser=CTc/cloudsqlsuperuser |         |            |
(8 rows)

postgres=>
postgres=> CREATE ROLE myuser
postgres-> LOGIN
postgres-> PASSWORD 'Welcome0';
CREATE ROLE
postgres=>
postgres=>
postgres=> \du+
                                                             List of roles
         Role name         |                         Attributes                         |           Member of            | Description
---------------------------+------------------------------------------------------------+--------------------------------+-------------
 admin@shkm.altostrat.com  |                                                            | {cloudsqliamuser}              |
 cloudsqladmin             | Superuser, Create role, Create DB, Replication, Bypass RLS | {}                             |
 cloudsqlagent             | Create role, Create DB                                     | {cloudsqlsuperuser}            |
 cloudsqliamserviceaccount | Cannot login                                               | {}                             |
 cloudsqliamuser           | Cannot login                                               | {}                             |
 cloudsqlimportexport      | Create role, Create DB                                     | {cloudsqlsuperuser}            |
 cloudsqlreplica           | Replication                                                | {pg_monitor}                   |
 cloudsqlsuperuser         | Create role, Create DB                                     | {pg_monitor,pg_signal_backend} |
 myuser                    |                                                            | {}                             |
 postgres                  | Create role, Create DB, Replication                        | {cloudsqlsuperuser}            |

postgres=>
postgres=> alter role myuser login;
ALTER ROLE
postgres=>
postgres=> grant myuser to postgres;
GRANT ROLE
postgres=> create database mydb owner myuser;
CREATE DATABASE
postgres=>
postgres=> \c mydb myuser
Password for user myuser:
psql (14.4 (Debian 14.4-1.pgdg100+1), server 10.21)
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
You are now connected to database "mydb" as user "myuser".
mydb=>
mydb=>
mydb=>
mydb=> create schema myschema;
CREATE SCHEMA
mydb=> \du
                                                      List of roles
         Role name         |                         Attributes                         |           Member of
---------------------------+------------------------------------------------------------+--------------------------------
 admin@shkm.altostrat.com  |                                                            | {cloudsqliamuser}
 cloudsqladmin             | Superuser, Create role, Create DB, Replication, Bypass RLS | {}
 cloudsqlagent             | Create role, Create DB                                     | {cloudsqlsuperuser}
 cloudsqliamserviceaccount | Cannot login                                               | {}
 cloudsqliamuser           | Cannot login                                               | {}
 cloudsqlimportexport      | Create role, Create DB                                     | {cloudsqlsuperuser}
 cloudsqlreplica           | Replication                                                | {pg_monitor}
 cloudsqlsuperuser         | Create role, Create DB                                     | {pg_monitor,pg_signal_backend}
 myuser                    |                                                            | {}
 postgres                  | Create role, Create DB, Replication                        | {cloudsqlsuperuser,myuser}

mydb=>

\du+

CREATE ROLE schema1 
LOGIN 
PASSWORD 'Welcome0';

alter role schema1 login;
\du+
\dn+

grant schema1 to postgres;
create schema AUTHORIZATION schema1;

\dn+

\c mydb schema1

\dt+

create table schema1.s1 (name varchar(10));
insert into s1 values ('ABC');
select * from s1;
select * from schema1.s1;


\dt+

\c mydb postgres

\du+

CREATE ROLE schema2 
LOGIN 
PASSWORD 'Welcome0';

alter role schema2 login;
\du+
\dn+

grant schema2 to postgres;
create schema AUTHORIZATION schema2;

\dn+

\c mydb schema2

\dt+

create table schema2.s2 (name varchar(10));
insert into s2 values ('XYZ');

\dt+

select * from s2;
select * from schema2.s2;

select * from s1;
select * from schema1.s1;

\c mydb schema1

select * from s2;
select * from schema1.s2;

create table schema1.respective_t1 (name varchar(20));
insert into respective_t1 values('I m at schema1');
\dt+
select * from respective_t1;

\c mydb schema2
                                 
create table schema2.respective_t1 (name varchar(20));
create table respective_t2 (name varchar(20));
insert into respective_t1 values('Im at schema2');
insert into respective_t2 values('schema2 2nd table');
\dt+
select * from respective_t1;
select * from respective_t2;




mydb=> \l+
                                                                                  List of databases
     Name      |       Owner       | Encoding |  Collate   |   Ctype    |            Access privileges            |  Size   | Tablespace |                Description
---------------+-------------------+----------+------------+------------+-----------------------------------------+---------+------------+--------------------------------------------
 airlines      | postgres          | UTF8     | en_US.UTF8 | en_US.UTF8 |                                         | 7863 kB | pg_default |
 cloudsqladmin | cloudsqladmin     | UTF8     | en_US.UTF8 | en_US.UTF8 |                                         | 9127 kB | pg_default |
 demo          | postgres          | UTF8     | en_US.UTF8 | en_US.UTF8 |                                         | 2640 MB | pg_default |
 example       | postgres          | UTF8     | en_US.UTF8 | en_US.UTF8 |                                         | 765 MB  | pg_default |
 mydb          | myuser            | UTF8     | en_US.UTF8 | en_US.UTF8 |                                         | 7863 kB | pg_default |
 pagila        | postgres          | UTF8     | en_US.UTF8 | en_US.UTF8 |                                         | 339 MB  | pg_default |
 postgres      | cloudsqlsuperuser | UTF8     | en_US.UTF8 | en_US.UTF8 |                                         | 14 MB   | pg_default | default administrative connection database
 template0     | cloudsqladmin     | UTF8     | en_US.UTF8 | en_US.UTF8 | =c/cloudsqladmin                       +| 7729 kB | pg_default | unmodifiable empty database
               |                   |          |            |            | cloudsqladmin=CTc/cloudsqladmin         |         |            |
 template1     | cloudsqlsuperuser | UTF8     | en_US.UTF8 | en_US.UTF8 | =c/cloudsqlsuperuser                   +| 7863 kB | pg_default | default template for new databases
               |                   |          |            |            | cloudsqlsuperuser=CTc/cloudsqlsuperuser |         |            |
(9 rows)

mydb=> \du+
                                                             List of roles
         Role name         |                         Attributes                         |           Member of            | Description
---------------------------+------------------------------------------------------------+--------------------------------+-------------
 admin@shkm.altostrat.com  |                                                            | {cloudsqliamuser}              |
 cloudsqladmin             | Superuser, Create role, Create DB, Replication, Bypass RLS | {}                             |
 cloudsqlagent             | Create role, Create DB                                     | {cloudsqlsuperuser}            |
 cloudsqliamserviceaccount | Cannot login                                               | {}                             |
 cloudsqliamuser           | Cannot login                                               | {}                             |
 cloudsqlimportexport      | Create role, Create DB                                     | {cloudsqlsuperuser}            |
 cloudsqlreplica           | Replication                                                | {pg_monitor}                   |
 cloudsqlsuperuser         | Create role, Create DB                                     | {pg_monitor,pg_signal_backend} |
 myuser                    |                                                            | {}                             |
 postgres                  | Create role, Create DB, Replication                        | {cloudsqlsuperuser,myuser}     |

mydb=> \dn+
                                        List of schemas
   Name   |       Owner       |           Access privileges            |      Description
----------+-------------------+----------------------------------------+------------------------
 myschema | myuser            |                                        |
 public   | cloudsqlsuperuser | cloudsqlsuperuser=UC/cloudsqlsuperuser+| standard public schema
          |                   | =UC/cloudsqlsuperuser                  |
(2 rows)

mydb=> \du+
                                                             List of roles
         Role name         |                         Attributes                         |           Member of            | Description
---------------------------+------------------------------------------------------------+--------------------------------+-------------
 admin@shkm.altostrat.com  |                                                            | {cloudsqliamuser}              |
 cloudsqladmin             | Superuser, Create role, Create DB, Replication, Bypass RLS | {}                             |
 cloudsqlagent             | Create role, Create DB                                     | {cloudsqlsuperuser}            |
 cloudsqliamserviceaccount | Cannot login                                               | {}                             |
 cloudsqliamuser           | Cannot login                                               | {}                             |
 cloudsqlimportexport      | Create role, Create DB                                     | {cloudsqlsuperuser}            |
 cloudsqlreplica           | Replication                                                | {pg_monitor}                   |
 cloudsqlsuperuser         | Create role, Create DB                                     | {pg_monitor,pg_signal_backend} |
 myuser                    |                                                            | {}                             |
 postgres                  | Create role, Create DB, Replication                        | {cloudsqlsuperuser,myuser}     |

mydb=> CREATE ROLE schema1
mydb-> LOGIN
mydb-> PASSWORD 'Welcome0';
ERROR:  permission denied to create role
mydb=> \conninfo
You are connected to database "mydb" as user "myuser" on host "10.45.193.4" at port "5432".
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
mydb=> CREATE ROLE schema1
LOGIN
PASSWORD 'Welcome0';^C
mydb=>
mydb=>
mydb=>
mydb=> \mydb postgres
invalid command \mydb
Try \? for help.
mydb=>
mydb=>
mydb=>
mydb=>
mydb=>
mydb=> \c mydb postgres
Password for user postgres:
psql (14.4 (Debian 14.4-1.pgdg100+1), server 10.21)
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
You are now connected to database "mydb" as user "postgres".
mydb=>
mydb=>
mydb=>
mydb=> \conninfo
You are connected to database "mydb" as user "postgres" on host "10.45.193.4" at port "5432".
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
mydb=>
mydb=>
mydb=> CREATE ROLE schema1
mydb-> LOGIN
mydb-> PASSWORD 'Welcome0';
CREATE ROLE
mydb=>
mydb=>
mydb=> alter role schema1 login;
ALTER ROLE
mydb=>
mydb=>
mydb=> \du+
                                                             List of roles
         Role name         |                         Attributes                         |           Member of            | Description
---------------------------+------------------------------------------------------------+--------------------------------+-------------
 admin@shkm.altostrat.com  |                                                            | {cloudsqliamuser}              |
 cloudsqladmin             | Superuser, Create role, Create DB, Replication, Bypass RLS | {}                             |
 cloudsqlagent             | Create role, Create DB                                     | {cloudsqlsuperuser}            |
 cloudsqliamserviceaccount | Cannot login                                               | {}                             |
 cloudsqliamuser           | Cannot login                                               | {}                             |
 cloudsqlimportexport      | Create role, Create DB                                     | {cloudsqlsuperuser}            |
 cloudsqlreplica           | Replication                                                | {pg_monitor}                   |
 cloudsqlsuperuser         | Create role, Create DB                                     | {pg_monitor,pg_signal_backend} |
 myuser                    |                                                            | {}                             |
 postgres                  | Create role, Create DB, Replication                        | {cloudsqlsuperuser,myuser}     |
 schema1                   |                                                            | {}                             |

mydb=> \dn+
                                        List of schemas
   Name   |       Owner       |           Access privileges            |      Description
----------+-------------------+----------------------------------------+------------------------
 myschema | myuser            |                                        |
 public   | cloudsqlsuperuser | cloudsqlsuperuser=UC/cloudsqlsuperuser+| standard public schema
          |                   | =UC/cloudsqlsuperuser                  |
(2 rows)

mydb=> create schema AUTHORIZATION schema1;
ERROR:  must be member of role "schema1"
mydb=> \conninfo
You are connected to database "mydb" as user "postgres" on host "10.45.193.4" at port "5432".
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
mydb=> grant schema1 to postgres;
GRANT ROLE
mydb=> create schema AUTHORIZATION schema1;
CREATE SCHEMA
mydb=> \dn+
                                        List of schemas
   Name   |       Owner       |           Access privileges            |      Description
----------+-------------------+----------------------------------------+------------------------
 myschema | myuser            |                                        |
 public   | cloudsqlsuperuser | cloudsqlsuperuser=UC/cloudsqlsuperuser+| standard public schema
          |                   | =UC/cloudsqlsuperuser                  |
 schema1  | schema1           |                                        |
(3 rows)

mydb=> \c mydb schema1
Password for user schema1:
psql (14.4 (Debian 14.4-1.pgdg100+1), server 10.21)
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
You are now connected to database "mydb" as user "schema1".
mydb=> \dt+
Did not find any relations.
mydb=> create table schema1.s1 (name varchar(10));
CREATE TABLE
mydb=> insert into s1 values ('ABC');
INSERT 0 1
mydb=> select * from s1;
 name
------
 ABC
(1 row)

mydb=> select * from schema1.s1;
 name
------
 ABC
(1 row)

mydb=> \dt+
                             List of relations
 Schema  | Name | Type  |  Owner  | Persistence |    Size    | Description
---------+------+-------+---------+-------------+------------+-------------
 schema1 | s1   | table | schema1 | permanent   | 8192 bytes |
(1 row)

mydb=>
mydb=>
mydb=> \c mydb postgres
Password for user postgres:
psql (14.4 (Debian 14.4-1.pgdg100+1), server 10.21)
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
You are now connected to database "mydb" as user "postgres".
mydb=> \du+
                                                               List of roles
         Role name         |                         Attributes                         |             Member of              | Description
---------------------------+------------------------------------------------------------+------------------------------------+-------------
 admin@shkm.altostrat.com  |                                                            | {cloudsqliamuser}                  |
 cloudsqladmin             | Superuser, Create role, Create DB, Replication, Bypass RLS | {}                                 |
 cloudsqlagent             | Create role, Create DB                                     | {cloudsqlsuperuser}                |
 cloudsqliamserviceaccount | Cannot login                                               | {}                                 |
 cloudsqliamuser           | Cannot login                                               | {}                                 |
 cloudsqlimportexport      | Create role, Create DB                                     | {cloudsqlsuperuser}                |
 cloudsqlreplica           | Replication                                                | {pg_monitor}                       |
 cloudsqlsuperuser         | Create role, Create DB                                     | {pg_monitor,pg_signal_backend}     |
 myuser                    |                                                            | {}                                 |
 postgres                  | Create role, Create DB, Replication                        | {cloudsqlsuperuser,myuser,schema1} |
 schema1                   |                                                            | {}                                 |

mydb=> CREATE ROLE schema2
mydb-> LOGIN
mydb-> PASSWORD 'Welcome0';
CREATE ROLE
mydb=>
mydb=>
mydb=> alter role schema2 login;
ALTER ROLE
mydb=>
mydb=>
mydb=> \du+
                                                               List of roles
         Role name         |                         Attributes                         |             Member of              | Description
---------------------------+------------------------------------------------------------+------------------------------------+-------------
 admin@shkm.altostrat.com  |                                                            | {cloudsqliamuser}                  |
 cloudsqladmin             | Superuser, Create role, Create DB, Replication, Bypass RLS | {}                                 |
 cloudsqlagent             | Create role, Create DB                                     | {cloudsqlsuperuser}                |
 cloudsqliamserviceaccount | Cannot login                                               | {}                                 |
 cloudsqliamuser           | Cannot login                                               | {}                                 |
 cloudsqlimportexport      | Create role, Create DB                                     | {cloudsqlsuperuser}                |
 cloudsqlreplica           | Replication                                                | {pg_monitor}                       |
 cloudsqlsuperuser         | Create role, Create DB                                     | {pg_monitor,pg_signal_backend}     |
 myuser                    |                                                            | {}                                 |
 postgres                  | Create role, Create DB, Replication                        | {cloudsqlsuperuser,myuser,schema1} |
 schema1                   |                                                            | {}                                 |
 schema2                   |                                                            | {}                                 |

mydb=>
mydb=>
mydb=> \dn+
                                        List of schemas
   Name   |       Owner       |           Access privileges            |      Description
----------+-------------------+----------------------------------------+------------------------
 myschema | myuser            |                                        |
 public   | cloudsqlsuperuser | cloudsqlsuperuser=UC/cloudsqlsuperuser+| standard public schema
          |                   | =UC/cloudsqlsuperuser                  |
 schema1  | schema1           |                                        |
(3 rows)

mydb=>
mydb=>
mydb=>
mydb=> grant schema2 to postgres;
GRANT ROLE
mydb=> create schema AUTHORIZATION schema2;
CREATE SCHEMA
mydb=> \dn+
                                        List of schemas
   Name   |       Owner       |           Access privileges            |      Description
----------+-------------------+----------------------------------------+------------------------
 myschema | myuser            |                                        |
 public   | cloudsqlsuperuser | cloudsqlsuperuser=UC/cloudsqlsuperuser+| standard public schema
          |                   | =UC/cloudsqlsuperuser                  |
 schema1  | schema1           |                                        |
 schema2  | schema2           |                                        |
(4 rows)

mydb=> \c mydb schema2
Password for user schema2:
psql (14.4 (Debian 14.4-1.pgdg100+1), server 10.21)
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
You are now connected to database "mydb" as user "schema2".
mydb=>
mydb=>
mydb=> \dt+
Did not find any relations.
mydb=> create table schema2.s2 (name varchar(10));
CREATE TABLE
mydb=> insert into s2 values ('XYZ');
INSERT 0 1
mydb=>
mydb=>
mydb=> \dt+
                             List of relations
 Schema  | Name | Type  |  Owner  | Persistence |    Size    | Description
---------+------+-------+---------+-------------+------------+-------------
 schema2 | s2   | table | schema2 | permanent   | 8192 bytes |
(1 row)

mydb=> select * from s2;
 name
------
 XYZ
(1 row)

mydb=> select * from schema2.s2;
 name
------
 XYZ
(1 row)

mydb=> select * from s1;
ERROR:  relation "s1" does not exist
LINE 1: select * from s1;
                      ^
mydb=> select * from schema1.s1;
ERROR:  permission denied for schema schema1
LINE 1: select * from schema1.s1;
                      ^
mydb=> \c mydb schema1
Password for user schema1:
psql (14.4 (Debian 14.4-1.pgdg100+1), server 10.21)
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
You are now connected to database "mydb" as user "schema1".
mydb=> select * from s2;
ERROR:  relation "s2" does not exist
LINE 1: select * from s2;
                      ^
mydb=> select * from schema1.s2;
ERROR:  relation "schema1.s2" does not exist
LINE 1: select * from schema1.s2;
                      ^
mydb=> \c mydb schema1
psql (14.4 (Debian 14.4-1.pgdg100+1), server 10.21)
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
You are now connected to database "mydb" as user "schema1".
mydb=>
mydb=>
mydb=>
mydb=> select * from s2;
ERROR:  relation "s2" does not exist
LINE 1: select * from s2;
                      ^
mydb=> select * from schema1.s2;
ERROR:  relation "schema1.s2" does not exist
LINE 1: select * from schema1.s2;
                      ^
mydb=>
mydb=>
mydb=> create table schema1.respective_t1 (name varchar(20));
CREATE TABLE
mydb=> insert into respective_t1 values('I'm at schema1');
mydb'> ^C
mydb=>
mydb=>
mydb=> insert into respective_t1 values('I m at schema1');
INSERT 0 1
mydb=> \dt+
                                 List of relations
 Schema  |     Name      | Type  |  Owner  | Persistence |    Size    | Description
---------+---------------+-------+---------+-------------+------------+-------------
 schema1 | respective_t1 | table | schema1 | permanent   | 8192 bytes |
 schema1 | s1            | table | schema1 | permanent   | 8192 bytes |
(2 rows)

mydb=> select * from respective_t1;
      name
----------------
 I m at schema1
(1 row)

mydb=> \c mydb schema2
Password for user schema2:
psql (14.4 (Debian 14.4-1.pgdg100+1), server 10.21)
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
You are now connected to database "mydb" as user "schema2".
mydb=>
mydb=>
mydb=> create table schema1.respective_t1 (name varchar(20));
ERROR:  permission denied for schema schema1
LINE 1: create table schema1.respective_t1 (name varchar(20));
                     ^
mydb=> create table schema2.respective_t1 (name varchar(20));
CREATE TABLE
mydb=> create table respective_t2 (name varchar(20));
CREATE TABLE
mydb=> insert into respective_t1 values('Im at schema2');
INSERT 0 1
mydb=> insert into respective_t2 values('Im at schema2 2nd table');
ERROR:  value too long for type character varying(20)
mydb=> insert into respective_t2 values('schema2 2nd table');
INSERT 0 1
mydb=> \dt+
                                 List of relations
 Schema  |     Name      | Type  |  Owner  | Persistence |    Size    | Description
---------+---------------+-------+---------+-------------+------------+-------------
 schema2 | respective_t1 | table | schema2 | permanent   | 8192 bytes |
 schema2 | respective_t2 | table | schema2 | permanent   | 8192 bytes |
 schema2 | s2            | table | schema2 | permanent   | 8192 bytes |
(3 rows)

mydb=> select * from respective_t1;
     name
---------------
 Im at schema2
(1 row)

mydb=> select * from respective_t2;
       name
-------------------
 schema2 2nd table
(1 row)

mydb=>
mydb=>
mydb=>
mydb=>
                                        
                                        
                                        
                                        
                                 
                                 
                                 
                                 
                                 
                                 

                      
                      
                      
                       


