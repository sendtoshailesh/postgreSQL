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



