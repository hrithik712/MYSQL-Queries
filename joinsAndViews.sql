create database pro;
use pro;
create table project(
id int primary key,
emp_Id int,
cname varchar(255),
startDate date,
client_ID int);

insert into project(id, emp_Id, cname, startDate, client_ID)
values(1, 1, 'A', '2021-04-21', 3),
(2, 2, 'B', '2021-03-12', 1),
(3, 3, 'C', '2021-01-16', 5),
(4, 3, 'D', '2021-04-27', 2),
(5, 5, 'E', '2021-05-01', 4); 

create table employee(
id int primary key,
fname varchar(255),
lname varchar(255),
age int,
e_Mail varchar(100),
phone_No integer,
city varchar(255)
);

insert into employee(id, fname, lname, age, e_Mail, phone_No, city)
values(1, 'Aman', 'Proto', 32, 'aman@gmail.com', 898, 'Delhi'),
(2, 'Yagya', 'Narayan', 44, 'yagya@gmail.com', 222, 'Palam'), 
(3, 'Rahul', 'BD', 22, 'rahul@gmail.com', 444, 'Kolkata'), 
(4, 'Jatin', 'Hermit', 31, 'jatin@gmail.com', 666, 'Raipur'),
(5, 'PK', 'Pandey', 21, 'pk@gmail.com', 555, 'Jaipur');

create table client(
id int primary key,
first_name varchar(255),
last_name varchar(255), 
age integer,
e_Mail varchar(100),
phone_No integer, 
city varchar(255), 
emp_Id int);

insert into client(id, first_name, last_name, age, e_Mail, phone_No, city, emp_Id)
values(1, 'Mac', 'Roger', 37, 'mac@gmail.com', 333, 'Kolkata', 3),
(2, 'Max', 'Poirier', 27, 'max@gmail.com', 22, 'Kolkata', 3),
(3, 'Peter', 'Jain', 24, 'peter@gmail.com', 111, 'Delhi', 1),
(4, 'Sushant', 'Aggarwal', 23, 'sushant@gmail.com', 45454, 'Hyderbad', 5),
(5, 'Pratap', 'Singh', 36, 'pratap@gmail.com', 77767, 'Mumbai', 2);
select *from employee;
select *from project;

-- INNER JOIN ...............
-- Enlist all the employee id's names along with the project allocated to them.
select e.id, e.fname, e.lname, p.id, p.cname from employee as e
inner join project as p on e.id = p.emp_Id;

-- if we list all the details of project and employee using join command.. 
select * from employee as e
inner join project as p on e.id  = p.emp_Id;

-- Fetch out all the employee id's and their contact details who have been 
-- working from jaipur with the clients name working in hyderabad .. 
select e.id, e.e_Mail, e.phone_No, e.fname, e.lname from employee as e
inner join project as c on e.id = c.emp_Id;
select e.id, e.e_Mail, e.phone_No, c.first_name, c.last_name from employee as e
inner join client as c on e.id = c.emp_Id where e.city = 'Jaipur' and c.city='Hyberabad';

-- ..............Left Join ..........................
-- fetch out each project allocated to each employee....
select *from employee as e 
left join project as p on e.id = p.emp_Id;

-- ...............................Right Join ........
-- list out all the projects  along with the employee's name and their respective 
-- allocated email Id's ..........
select p.id, p.cname, e.fname, e.lname, e.e_Mail from employee as e
right join project as p
on e.id = p.emp_Id;

-- ..................Cross Join ......
-- List out all the combinations possible for the employee's name and projects that can exist.
select e.fname, e.lname, p.id, p.cname from employee as e
cross join project as p;

-- Can we join without using JOIN Command ......
select e.id, e.fname, e.lname, p.id, p.cname from employee as e,
project as p where e.id = p.emp_Id;


--  ......................SUB QUERIES.....................................
-- WHERE clause same table ...............................
-- employee with age > 30 ...................................
select *from employee where age in (select age from employee where age > 30);

-- employees details working in more than 1 project ......
select *from employee where id in(
select emp_Id from project group by emp_Id having count(emp_Id) >1);

-- single value subquerry ...........................
-- emp details having  age > age(age) ...........
select *from employee where age > (select avg(age) from employee);

-- FROM Clause ...... Derived Tables.............................
-- select max age person whose first name contains 'a' ..............
select max(age) from (select *from employee where fname like '%a%') as temp;

-- .......................Corelated Queries .....................................
-- Find 3rd oldest query ..........
select *
from employee as e1
where 3 = (
select count(e2.age)
from employee e2
where e2.age >= e1.age
);

-- ......................VIEW in mqsql .........................
select *from employee;
-- creating a view  ......
create view custom_view as select fname, age from employee;
-- vewing from view .....
-- all the relevant info will be showed means it will hide unwanted things in the table ... 
select *from custom_view;
-- altering the view ....... 
alter view custom_view as select fname, lname, age from employee;
select *from custom_view;
-- dropping a view 
-- drop view if exists custom_view;