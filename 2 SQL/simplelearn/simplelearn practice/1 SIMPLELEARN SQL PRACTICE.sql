create database sqlintro;
show databases;

use sqlintro;
show tables;
drop table emp_details;


create table emp_details (
emp_id int,
Name varchar(25),
Age int,
Sex char(1),
DOJ date,
City varchar(15),
dept varchar(255),
Salary float);


     
desc emp_details;                   # for structure

insert into emp_details values (1,"haris",20,"M","2005-05-30","Chicago","finance",70000),
(2,"tabish",25,"M","2007-04-21","Chicago","It",50000),
(3,"anas",30,"M","2009-03-10","faislabad","HR",30000),
(4,"saqib",26,"M","2005-07-25","khushab","FINANCE",20000),
(5,"abdullah",19,"M","2004-09-18","paris","HR",90000),
(6,"afnan",17,"M","1995-01-14","los angeles","SALES",80000),
(1,"rehan",35,"M","1996-02-29","pindi","MARKETING",40000);
					
select * from emp_details;

select distinct city from emp_details;            # to find unique function

select count(emp_id) as emp_id from emp_details;  # to find total number of employes in table

select sum(salary) from emp_details;             # sum total amount of salaries
select avg(salary) from emp_details;             # avg amount of salarie

# CLAUSES

select age,city
from emp_details
where age> 25;

select * from emp_details
where city ='chicago' or city = 'khushab';   #any condition become successful in OR operator

select * from emp_details
where city in ('chicago','khushab');  # in (which all condition become succesful)

select * from emp_details
where DOJ between '2004-09-18' and '2009-03-10';  # between(this gives the range)

select * from emp_details
where city ='chicago' and sex ='M';   # and(give results when both condition is true)

select city,sum(salary) as total_salary from emp_details
group by city;                # Group by (used with function(count,sum,avg))

select * from emp_details
order by Salary desc;  # order by (asen,desen)

# some basics

select length("pakistan") as total_length;      # total length

-- select repeat('pak', 5) as repeated;      # repeated

select (20-10) as subtract;
select upper('india');
select lower('INDIA');

# TO FIND DATE and time

select curdate();

select year(curdate());

select now();     # to find a current date and time

-- strings functions

select name ,char_length(name) as name_length     
from emp_details;                       # give length of character                   

select concat('india',' is',' in',' asia') as name;     # it merges the strings

select name,concat(name,' ', 'ali') as name_age
from emp_details;                              # merges 2 coloumn

select reverse(name) from emp_details;        # it reverses the words(alpabets)

select replace('orange is vegetable','vegetable','fruit');  # it replaces the word

select name,replace(name,'haris','awan') as names from emp_details;



select length(ltrim('      india       '));
select length(rtrim('      india       '));    
select trim('      india       ');        # it minimize the spaces

select position('fruit'in'orange is fruit') as name; # it gives posti0n length of alphabet in string

select ascii('a');          # give value of specfic chaarcter

# groupby and having function

select year(doj) as year,count(emp_id)
from emp_details
group by year(doj)
order by year(doj) desc;         # how much employee joins previous years that country


select city,age,sum(salary) as total_salary from emp_details
group by city,age;

select city,count(age) as age from emp_details
group by city
order by count(age) desc;     # ages of employee in city is find by group by


select city,count(emp_id) from emp_details
group by city;                # number of employess in the cities

# having clause

select city, dept, avg(salary) as count_avgsalary
from emp_details
group by city,dept
having avg(salary) > 40000;        # cities,dept having avg salary >40000

select city,sum(salary) as total_salary # citites having total salary > 40000 
from emp_details
group by city
having sum(salary) > 40000;   

select city,count(emp_id) as count_empl
from emp_details
group by city
having count(emp_id) > 1;    # cities having empoyee >1

select city,count(emp_id) as count_empl
from emp_details
where city != 'paris'
group by city
having count(emp_id) > 0;     # cities having employee > 0 without that city

select city,count(*) as count_employee
from emp_details
group by city
having avg(salary) > 40000;   # other method to count employee in the city


# substr (extract the substring from the string)

select emp_id,city from emp_details
where substr(city,1,1) = 'p';   


# change data type(typecasting)  string into numeric
desc emp_details;

select 
    salary,cast(emp_id as float) as emp_id
from emp_details
order by 
	cast(emp_id as float)desc;


select 
    cast(DOJ as date),SALARY
from emp_details
WHERE
	cast(DOJ as DATE) BETWEEN '1995-01-14'AND '2009-03-10';
    
## coalesce function (if one col value is null then it show the value by other column value
select 
       coalesce(emp_id,name)
       from emp_details;
       
