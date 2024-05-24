SELECT SALARY FROM WORKER;
SELECT FIRST_NAME, SALARY FROM WORKER;

SELECT 44 + 11;
SELECT NOW();
SELECT lcase('AMANDEEP');
select ucase('amandeep mishra');

select *from worker;
select *from worker where salary > 100000;

select *from worker;
select *from worker where department = 'HR';

select *from worker;
select *from worker where salary between 80000 and 100000;

select *from worker;
-- reduce OR Statement .. 
-- HR, ADMIN department only  ... 
-- usefull for small set of data 
select *from worker where department = 'HR' or department = 'Admin';

-- better way use IN keyword ... 
select *from worker where department in('HR', 'Admin', 'Account'); 

-- use of NOT  -> NEGATE
-- print karega jo jo hr aur admin department m nhi hai ... 
select *from worker where department not in('HR', 'Admin');

-- IS NULL -> to check entry in data is null for not ... 
select *from worker where joining_data is null;

-- pattern searching / wildcard .. 
-- % -> any number of character .. 
-- _ 0 -> onlt one number of character ... 
-- like keyword -> eske jaisa keyword search karke retunr karna hai .. 
-- jinke firstname m i aata hai vhi values print hongi ... 
select *from worker where first_name like '%i%';

-- by using _ before i will print only that first namese in which i comes at second spot .. 
select *from worker where first_name like '_i%';

-- sorting of data .. 
-- command used is -> order by .. 
-- fetch the salary data in increasing order .. 
select *from worker order by salary asc;
select *from worker order by salary;
-- by default it is in ascending order .. 
-- now in descending order .. 
select *from worker order by salary desc;

select *from worker;
-- use of distinct values .. 
select distinct department from worker;

-- DATA Grouping
-- grouping of data ... 
-- find no. of elempoyees working in hr, admin etc .. 
-- use keyword GROUP BY  known as aggregation function - COUNT, SUM, AVG, MIN etc.. 
select department from worker group by department; -- aggregation is not done here ... 
-- now with aggregation .. 
-- prints no. of person in that department  .. 
select department , count(*) from worker group by department;
-- find avg salary per department .. 
select department, avg(salary) from worker group by department;
-- min salary per department .. 
select department, min(salary) from worker group by department;
-- max salary in each department .. 
select department, max(salary) from worker group by department;
-- sum of each department .. 
select department, sum(salary) from worker group by department;

-- HAVING keyword .. 
-- agr group by k andr filtering apply karni hai t ham having ka use karnege .. .
select department, count(department) from worker group by department having count(department) > 2;

select department, count(department) from worker group by department having count(department) > 1;

-- 