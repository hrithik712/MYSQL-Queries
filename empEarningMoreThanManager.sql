# Employees earning more than their managers ... 
select e2.name as employee 
from employee e1 
inner join employee e2 on e1.id = e2.managerID
where 
e1.salary < e2.salary