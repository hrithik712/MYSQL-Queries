CREATE DATABASE temp;
USE temp;
CREATE TABLE customer(
id INT PRIMARY KEY,
cname VARCHAR(255), 
Address varchar(255), 
Gender varchar(225), 
Pincode integer
);

-- add new customer .. 
insert into customer(id, cname, Address, Gender, Pincode)
values(001, 'Ram Kumar', 'Rampur', 'Male', 131310),
(002, 'Raja Kumar', 'Rajapur', 'Male', 993310),
(004, 'Kashi Kumar', 'Kashipur', 'Male', 221310),
(005, 'Bhanu Kumar', 'Bhanpur', 'Male', 661310);

-- another way to insert .. 
insert into customer values(6, 'Code Help', 'Delhi', 'Male', 341210);
select *from customer;

-- update table data
update customer set Address='Mumbai', Pincode= 321211 where id=005;

-- now to update multiple rows .. 
-- saare customer ka specific value daalna ho ..
set sql_safe_updates = 0; 
update customer set Pincode=00000;

-- delete command -- 
delete from customer where id=1241;
 select *from customer;
 
 -- we can delete whole table , without using where command ......alter
 
 -- replace command,, primary key is must in command .. 
 replace into customer(id, cname, Gender, Pincode)
 values(006, 'Love Babbar', 'Male', '111111');
 
select *from customer; 

-- another way .. 
-- here it will pick id, name and other things will be replaced by null values.. 
replace into customer(id, cname)
select id, cname
from customer where id = 005;
 select *from customer;
 
 -- ...........................JOINS .........................................


 
create table order_details( 
order_id integer primary key,
delivery_data date,
cust_id int, 
foreign key(cust_id) references customer(id)
);