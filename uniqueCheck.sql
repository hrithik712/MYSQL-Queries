create table account
( id int primary key, 
-- here name is unique, means it can not be duplicated .. 
name varchar(255) unique,
balance int,
-- check constraint will allow to insert only balance greater than 1000
constraint acc_balance_chk check (balance > 1000)
);

insert into account(id, name, balance)
values(1, 'A', 10000);

insert into account(id, name, balance)
values(2, 'B', 20000);
select *from account;


