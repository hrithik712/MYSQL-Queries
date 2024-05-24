CREATE DATABASE temp;
USE temp;
CREATE TABLE customer1(
id INT PRIMARY KEY,
cname VARCHAR(255), 
Address varchar(255), 
Gender varchar(225), 
Pincode integer
);

insert into customer1(id, cname, Address, Gender, Pincode)
values(001, 'Ram Kumar', 'Rampur', 'Male', 131310);
select *from customer1;

create table order_details(
order_id integer primary key,
delivery_date date,
cust_id int,
foreign key(cust_id) references customer1(id)
);

insert into order_details(order_id, delivery_date, cust_id)
values(311, '12-12-12', 1);
insert into order_details(order_id, delivery_date, cust_id)
values(411, '20-12-20', 1);

select *from order_details;

-- integrity constraint is maintained by mysql ... 
delete from order_details where id=1;

 -- We want to replace data from existing data .... 
 -- if data not present, then command will behave like a insert command ... 

 
select *from order_details;