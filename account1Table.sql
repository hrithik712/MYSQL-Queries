create table account1(
id int primary key, 
name varchar(255) unique,
-- here instead of storing default value as null, it will store 
-- default value as 0 ... 
balance int not null default 0
);
insert into account1(id, name)
values(1, 'A');

select *from account1;