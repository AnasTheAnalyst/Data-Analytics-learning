# views in sql ( virtual table that display data or by joining two tables

use classicmodels;

select * from customers;

create view cust_details
as
select customername,phone,city from customers;

select * from cust_details;

#####  CREATE views using joins 

select * from products;
select * from productlines;

create view product_description
as
select productname,quantityinstock,msrp,textdescription from 
products as p inner join productlines as pl
on p.productline = pl.productline ;

select * from product_descriptioN;
SELECT * FROM  vehicle_description;

## rename view table name

rename table product_description to vehicle_description;

# display the view

show full tables
where table_type = 'VIEW';

# DELETE VIEW

drop view vehicle_description;

####### WINDOWSs function(solve analytical problems)

-- over()       window function
-- It is the replacement of the groupby.it creates the windows with multiple rows 

-- partition by
-- partition by clause is used to divide the result set from the query into subset 

use sqlintro;
select * from emp_details;

select name,age,dept,sum(salary)over (partition by dept ) as total_salary
from emp_details ;

select name,age,dept,sum(salary) as total_salary 
from emp_details 
group by name,age,dept
order by sum(salary) desc;


### Row number(  used to find the duplicate values)
# we use row number () sql rank function to get a unique sequential number for each row in specfied data.


select name,salary,row_number() over(order by salary) as row_num from emp_details 
order by salary;

create table demoo(
stu_id int,
stu_name varchar(20));

drop table demoo;

insert into demoo values
(101,'shane'),
(101,'shane'),
(103,'anas'),
(103,'afnan'),
(104,'ali'),
(104,'ali'),
(104,'ali');

# to find duplicate number

select stu_name,stu_id,
row_number()over(partition by stu_id order by stu_id) as stude_num
from demoo; 


### Rank function(ranks are given to particular column)
### rank window function 
-- A rank () ranking window function returns a unique rank number for each dinstinct row within the partition according to the 
-- specfied coloumn value.Rank function always work on over() function with ORDERBY.  

## Dense rank 
-- dense rank() is similar to the rank() except for one differ,it does not skip any rows while ranking 


create table demoo1 (
var_a int);

insert into demoo1 values
(101),(103),(104),(104),(105),(106),(106);

select var_a,
rank()over(order by var_a) as test_rank
from demoo1;

select var_a,
dense_rank()over(order by var_a) as test_rank
from demoo1;

## first values ( return value of specfied function with respect to 1st row in window frame)


select name,age,dept,salary,first_value(dept)
over(order by salary desc) as highest_salary from emp_details;

# emp_name who has highest salary in each dept by (partition) function

select name,dept,salary,first_value(name)         
over(partition by dept order by salary desc)as highest_salary
from emp_details;


drop database mysql_python









