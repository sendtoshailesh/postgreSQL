
DVD Rental ER Model
https://www.postgresqltutorial.com/postgresql-getting-started/postgresql-sample-database/

Sample Databases
https://wiki.postgresql.org/wiki/Sample_Databases

git clone https://github.com/devrimgunduz/pagila.git

connect to pg db

create database pagila

\c pagila

\i /home/ec2-user/environment/pagila/pagila-schema.sql

\i /home/ec2-user/environment/pagila/pagila-data.sql

```
pagila=# \ds+
 public | actor_actor_id_seq         | sequence | postgres | 8192 bytes | 
 public | address_address_id_seq     | sequence | postgres | 8192 bytes | 
 public | category_category_id_seq   | sequence | postgres | 8192 bytes | 
 public | city_city_id_seq           | sequence | postgres | 8192 bytes | 
 public | country_country_id_seq     | sequence | postgres | 8192 bytes | 
 public | customer_customer_id_seq   | sequence | postgres | 8192 bytes | 
 public | film_film_id_seq           | sequence | postgres | 8192 bytes | 
 public | inventory_inventory_id_seq | sequence | postgres | 8192 bytes | 
 public | language_language_id_seq   | sequence | postgres | 8192 bytes | 
 public | payment_payment_id_seq     | sequence | postgres | 8192 bytes | 
 public | rental_rental_id_seq       | sequence | postgres | 8192 bytes | 
 public | staff_staff_id_seq         | sequence | postgres | 8192 bytes | 
 public | store_store_id_seq         | sequence | postgres | 8192 bytes | 

pagila=# \l+
 pagila    | postgres | UTF8     | C.UTF-8 | C.UTF-8 |                       | 16 MB   | pg_default | 
 postgres  | postgres | UTF8     | C.UTF-8 | C.UTF-8 |                       | 7669 kB | pg_default | default administrative connection database
 template0 | postgres | UTF8     | C.UTF-8 | C.UTF-8 | =c/postgres          +| 7513 kB | pg_default | unmodifiable empty database
           |          |          |         |         | postgres=CTc/postgres |         |            | 
 template1 | postgres | UTF8     | C.UTF-8 | C.UTF-8 | =c/postgres          +| 7765 kB | pg_default | default template for new databases
           |          |          |         |         | postgres=CTc/postgres |         |            | 

pagila=# \t
Tuples only is off.
pagila=# \l+
                                                                List of databases
   Name    |  Owner   | Encoding | Collate |  Ctype  |   Access privileges   |  Size   | Tablespace |                Description                 
-----------+----------+----------+---------+---------+-----------------------+---------+------------+--------------------------------------------
 pagila    | postgres | UTF8     | C.UTF-8 | C.UTF-8 |                       | 16 MB   | pg_default | 
 postgres  | postgres | UTF8     | C.UTF-8 | C.UTF-8 |                       | 7669 kB | pg_default | default administrative connection database
 template0 | postgres | UTF8     | C.UTF-8 | C.UTF-8 | =c/postgres          +| 7513 kB | pg_default | unmodifiable empty database
           |          |          |         |         | postgres=CTc/postgres |         |            | 
 template1 | postgres | UTF8     | C.UTF-8 | C.UTF-8 | =c/postgres          +| 7765 kB | pg_default | default template for new databases
           |          |          |         |         | postgres=CTc/postgres |         |            | 
(4 rows)

pagila=# 



pagila=# 
```


```
admin_shkm_altostrat_com@instance-mumbai:~/cloud-sql-pg$ psql -h 10.45.192.3 -U postgres < demo-big-en-20170815.sql

```


```

CREATE TABLE accounts (
	user_id serial PRIMARY KEY,
	username VARCHAR ( 50 ) UNIQUE NOT NULL,
	password VARCHAR ( 50 ) NOT NULL,
	email VARCHAR ( 255 ) UNIQUE NOT NULL,
	created_on TIMESTAMP NOT NULL,
        last_login TIMESTAMP
);



CREATE TABLE accounts (
	user_id serial PRIMARY KEY,
	username VARCHAR ( 50 ) UNIQUE NOT NULL,
	password VARCHAR ( 50 ) NOT NULL
);


insert into accounts (username,password) values('User1','Password1');
insert into accounts (username,password) values('User2','Password2');
insert into accounts (username,password) values('User3','Password3');
insert into accounts (username,password) values('User4','Password4');

select * from accounts;

