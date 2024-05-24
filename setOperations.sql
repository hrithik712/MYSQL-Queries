create database setOp;
use setOp;

create table dept1(
empId int primary key,
cname varchar(255),
crole varchar(255));

insert into dept1 (empId, cname, crole)
values(1, 'A', 'Engineer'),
(2, 'B', 'Salesman'),
(3, 'C', 'Manager'),
(4, 'D', 'Salesman'),
(5, 'E', 'Enginer'); 

create table dept2(
empId int primary key,
cname varchar(255),
crole varchar(255));

insert into dept2(empId, cname, crole)
values(3, 'C', 'Manager'),
(6, 'F', 'Marketing'),
(7, 'G', 'Salesman');

-- .............SET Operations .....................
-- List out all the employees in the company ..
select *from dept1
union 
select *from dept2;

-- list out all the employees in all departments who works as salesman...
select *from dept1 where crole = 'Salesman'
union
select *from dept2 where crole = 'Salesman';

-- list out all the employees who work for both the departments .. 
-- select *from dept1 inner join dept2 using(empId);
select dept1.* from dept1 inner join dept2 using(empId);

-- list out alll the employees working in dept1 but not in dept2 ... 
select dept1.* from dept1 left join dept2 using(empId)
where dept2.empId is null;