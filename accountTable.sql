use temp;
create table account2(
id int primary key,
name varchar(255) unique,
balance int not null default 0
);

select *from account2;

-- add new column .. 
alter table account2 add interest float not null default 0;

-- modify datatype .. 
alter table account2 modify interest double not null default 0;
-- describe account... 
desc account2;

-- rename the column .. 
alter table account2 change column interest saving_interest float not null default 0;

-- drop columns .. 
alter table account2 drop column saving_interest;

desc account2;

-- rename the table .. 
alter table account2 rename to account_details;

desc account_details; 

