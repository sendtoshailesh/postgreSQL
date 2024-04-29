sudo dnf install postgresql15-client

sudo yum install postgresql

sudo apt -y install postgresql postgresql-client postgresql-contrib

sudo yum install postgresql-client postgresql-contrib

sudo apt -y install postgresql-client

sudo amazon-linux-extras install postgresql10

brew install libpq
brew link --force libpq ail


Connect Cloud SQL from cloudtop - https://yaqs.corp.google.com/cloud/q/6391292021047296

CREATE TABLE native_test (id SERIAL PRIMARY KEY, data text);

CREATE SUBSCRIPTION sub1 
CONNECTION 'host=azurepg11us.postgres.database.azure.com port=5432 dbname=postgres user=replication_user password=secret'
PUBLICATION pub;





https://remotedesktop.corp.google.com/access/session/ca1cc539-9064-4515-96fc-55096d2a6b82

psql -h azurepg11us.postgres.database.azure.com -U pgadmin -d postgres -W

psql -h 35.200.157.179 -U postgres -d postgres -W


CREATE SUBSCRIPTION sub4 
CONNECTION 'host=azurepg11us.postgres.database.azure.com port=5432 dbname=postgres user=replication_user password=secret'
PUBLICATION pub;


psql -U zero2one -h zero2one-1.cluster-ro-cayf2yabcnxl.ap-southeast-2.rds.amazonaws.com -p 5432 zero2one
\l

psql -U admin -h localhost -p 3308 postgres

create database abc;




SELECT grantor, grantee, table_schema, table_name, privilege_type
FROM information_schema.table_privileges
WHERE grantee = 'myuser'


SELECT grantor, grantee, table_schema, table_name, privilege_type
FROM information_schema.table_privileges
WHERE grantee = 'postgres';



$ export PGPASSWORD='client123'
$ for i in `seq 1 20`; do \
> psql -h HAPROXY_INSTANCE_PRIVATE_IP -U test_client -d postgres -c 'select pg_sleep(30)' & \
> done;






sudo apt-get install pgloader



$ createdb pagila
$ pgloader mysql://user@localhost/sakila postgresql:///pagila
pgloader mysql://mysql_username:password@mysql_server_ip_/source_database_name?option_1=value&option_n=value postgresql://postgresql_role_name:password@postgresql_server_ip/target_database_name?option_1=value&option_n=value

pgloader mysql://mysql_username:password@mysql_server_ip_/source_database_name postgresql://postgresql_role_name:password@postgresql_server_ip/target_database_name



createdb -h 10.45.193.4 -p 5432 -U postgres -W pagila
pgloader mysql://root@10.45.192.4/employees postgresql:///pagila
pgloader mysql://root:Welcome0@10.45.192.4/employees postgresql://postgres:Welcome0@10.45.193.4/pagila

2022-03-01T15:51:31.056000Z LOG Migrating from #<MYSQL-CONNECTION mysql://root@10.45.192.4:3306/employees {1005D8FDD3}>
2022-03-01T15:51:31.056000Z LOG Migrating into #<PGSQL-CONNECTION pgsql://postgres@10.45.193.4:5432/pagila {1005EDB3C3}>
2022-03-01T15:52:04.466000Z LOG report summary reset
             table name     errors       rows      bytes      total time
-----------------------  ---------  ---------  ---------  --------------
        fetch meta data          0         21                     1.963s
         Create Schemas          0          0                     0.003s
       Create SQL Types          0          1                     0.015s
          Create tables          0         12                     0.027s
         Set Table OIDs          0          6                     0.007s
-----------------------  ---------  ---------  ---------  --------------
  employees.departments          0          9     0.1 kB          1.287s
     employees.dept_emp          0     331603    10.7 MB          4.755s
 employees.dept_manager          0         24     0.8 kB          1.261s
     employees.salaries          0    2844047    94.2 MB         23.968s
    employees.employees          0     300024    13.2 MB          8.212s
       employees.titles          0     443308    16.9 MB          8.611s
-----------------------  ---------  ---------  ---------  --------------
COPY Threads Completion          0          4                    26.508s
         Create Indexes          0          9                     5.343s
 Index Build Completion          0          9                     3.555s
        Reset Sequences          0          0                     0.146s
           Primary Keys          0          6                     0.017s
    Create Foreign Keys          0          6                     1.036s
        Create Triggers          0          0                     0.000s
        Set Search Path          0          1                     0.002s
       Install Comments          0          0                     0.000s
-----------------------  ---------  ---------  ---------  --------------
      Total import time          ✓    3919015   134.9 MB         36.607s
admin_shkm_altostrat_com@instance-mumbai:~$ psql -h 10.45.193.4 -p 5432 -U postgres
Password for user postgres:


pg_dumpall --globals-only --file=all_roles_and_users.sql -p postgres -h


pg_dumpall --roles-only --file=all_roles_and_users.sql -h 10.45.193.4 -U postgres


pgdump
===============================================

I want to dump my entire database, including users and credentials to a file.
pg_dumpall -h host -p port -U postgres > savedfile.sql

I want to dump a specific database only.
pg_dump -p port -d dbname > savedfile.sql

I want to dump a specific database and specific table or tables only.
pg_dump -d dname -t table1 -t table2 -t table3 > savedfile.sql

I only want to dump the users and credentials to restore them somewhere else.
From a remote server or client. ( saves file locally )
pg_dumpall -g -h host -p port -U postgres > users.sql

Again, we assume all actions here are executed as user postgres.

Restoring a pg_dumpall to a local server from a saved file.
psql postgres -f savedfile.sql

Restoring a pg_dumpall to a remote server from a saved file.
psql -h host -p port postgres -f savedfile.sql

Restoring a pg_dumpall to a remote server from the source server.
pg_dumpall | psql -h host -p port postgres

Restoring from a pg_dumpall from a remote server to a remote server.
pg_dumpall -h src_host -p src_port | psql -h target_host -p target_port postgres

Restoring a pg_dump of a specific database from a saved file.
psql dbname -f savedfile.sql

Restoring a pg_dump of a specific database to a remote server from a saved file.
psql -h host -p port dbname -f savedfile.sql

Restoring a pg_dump with a different owner on the target.
Sometimes you don’t have access to the users and credentials on a source database or want them to be different on your target/restored database. Follow these steps to achieve this.

Perform your pg_dump command as noted previously but add the –no-owner option.
Perform the restore as noted above but run the commands as the new owner.
pg_dump -d database –no-owner > savedfile.sql

psql -U newowner dbname -f savedfile.sql






General
  \c[onnect] [DBNAME|- [USER]]
                 connect to new database (currently "pizzastore")
  \cd [DIR]      change the current working directory
  \copyright     show PostgreSQL usage and distribution terms
  \encoding [ENCODING]
                 show or set client encoding
  \h [NAME]      help on syntax of SQL commands, * for all commands
  \q             quit psql
  \set [NAME [VALUE]]
                 set internal variable, or list all if no parameters
  \timing        toggle timing of commands (currently off)
  \unset NAME    unset (delete) internal variable
  \! [COMMAND]   execute command in shell or start interactive shell

Query Buffer
  \e [FILE]      edit the query buffer (or file) with external editor
  \g [FILE]      send query buffer to server (and results to file or |pipe)
  \p             show the contents of the query buffer
  \r             reset (clear) the query buffer
  \s [FILE]      display history or save it to file
  \w FILE        write query buffer to file

Input/Output
  \echo [STRING] write string to standard output
  \i FILE        execute commands from file
  \o [FILE]      send all query results to file or |pipe
  \qecho [STRING]
                 write string to query output stream (see \o)

Informational
  \d [NAME]      describe table, index, sequence, or view
  \d{t|i|s|v|S} [PATTERN] (add "+" for more detail)
                 list tables/indexes/sequences/views/system tables
  \da [PATTERN]  list aggregate functions
  \db [PATTERN]  list tablespaces (add "+" for more detail)
  \dc [PATTERN]  list conversions
  \dC            list casts
  \dd [PATTERN]  show comment for object
  \dD [PATTERN]  list domains
  \df [PATTERN]  list functions (add "+" for more detail)
  \dg [PATTERN]  list groups
  \dn [PATTERN]  list schemas (add "+" for more detail)
  \do [NAME]     list operators
  \dl            list large objects, same as \lo_list
  \dp [PATTERN]  list table, view, and sequence access privileges
  \dT [PATTERN]  list data types (add "+" for more detail)
  \du [PATTERN]  list users
  \l             list all databases (add "+" for more detail)
  \z [PATTERN]   list table, view, and sequence access privileges (same as \dp)

Formatting
  \a             toggle between unaligned and aligned output mode
  \C [STRING]    set table title, or unset if none
  \f [STRING]    show or set field separator for unaligned query output
  \H             toggle HTML output mode (currently off)
  \pset NAME [VALUE]
                 set table output option
                 (NAME := {format|border|expanded|fieldsep|footer|null|
                 recordsep|tuples_only|title|tableattr|pager})
  \t             show only rows (currently off)
  \T [STRING]    set HTML <table> tag attributes, or unset if none
  \x             toggle expanded output (currently off)

Copy, Large Object
  \copy ...      perform SQL COPY with data stream to the client host
  \lo_export LOBOID FILE
  \lo_import FILE [COMMENT]
  \lo_list
  \lo_unlink LOBOID    large object operations


  
export USERNAME=$(gcloud config list --format="value(core.account)")
export CLOUDSQL_INSTANCE=postgres-orders
export POSTGRESQL_IP=$(gcloud sql instances describe $CLOUDSQL_INSTANCE --format="value(ipAddresses[0].ipAddress)")
export PGPASSWORD=$(gcloud auth print-access-token)
psql --host=$POSTGRESQL_IP $USERNAME --dbname=orders





https://www.postgresqltutorial.com/psql-commands/



psql -h host -d database -U user -W


psql -h 10.0.1.7 -d postgres -U postgres


admin_shkm_altostrat_com@pg-on-gce:~$ sudo nano /etc/postgresql/12/main/postgresql.conf
admin_shkm_altostrat_com@pg-on-gce:~$ sudo service postgresql restart
admin_shkm_altostrat_com@pg-on-gce:~$



