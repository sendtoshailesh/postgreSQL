
DVD Rental ER Model
https://www.postgresqltutorial.com/postgresql-getting-started/postgresql-sample-database/

Sample Databases
https://wiki.postgresql.org/wiki/Sample_Databases

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

