
# SUBQUERY

# A subquery is select query that is enclosed inside the another query
# the inner select query usually used to determine the results of outer select query.

create database sqlintro;
use sqlintro;
show tables;
select * from emp_details;

-- Three types of subquery 
-- Scalar subquery
-- Multiple row subquery
-- Correlated subquery

-- Scalar subquery
-- it returns one row and one coloumn

select e.* from emp_details e
join (select avg(Salary) sal from emp_details) avg_sal
 on e.salary > avg_sal.sal;
 
 

 -- find the employee with the highest salary in each dept 

select dept,max(salary) from emp_details
group by dept;

select * from emp_details
where (dept,Salary) in (select dept,max(salary) from emp_details
group by dept);

select dept,max(Salary) from emp_details
group by dept;


# dept with max salary in employees table??

SELECT dept,salary from emp_details
where salary=(select max(salary) from emp_details); # it has a mx salary


# employee name with max salary in employees table??

SELECT name from emp_details
where salary=(select max(salary) from emp_details);

# types of subquries(select,udate,delete,insert)

-- subquery after where statment
 
select name,DEPT,salary from emp_details
where salary > (select avg(salary) from emp_details);

# SALARY WHICH IS > THAN THE EMP_name = ANAS 

select emp_id,name,dept,salary from emp_details
where salary > (select salary from emp_details where name = 'anas'); 

select * from emp_details;


use classicmodels;
show tables;

select * from products;
select * from orderdetails;

select productcode ,productname ,MSRP  from products
where productcode in (select productcode from orderdetails where priceeach < 100);


# insert statment
# insert statment uses the data returned from the subquery to insert into another table


use sqlintro; 

create table products (                          # new table products
product_id int,
item varchar(30),
sell_price float,
product_type varchar(30));

insert into products values(101,'jewellrey',1800,'luxury'),
(102,'shirt',100,'no_luxury'),
(103,'laptop',1500,'no_luxury'),
(104,'mobile',1200,'luxury');

select * from products;

create table orders(                       # new table orders
order_id int,
product_sold varchar(30),
selling_price float);

insert into orders 
       select product_id, item, sell_price from products
           where product_id in (select product_id from products where sell_price>1000);

select * from orders;


# update subquery

select * from emp_details;

update emp_details
set salary =salary*0.35
# where age in(select age from emp_details_b where age>20)   # emp_details_b is same table as emp_details
where age >20;


# delete subquery

delete from emp_details
where age <20;

select * from emp_details;



# stored procedure ( if you want to use a query over and over again then save it in a store procedure and call it over and over again

create database sql_iq;
use sql_iq;

create table players(
player_id int,
name varchar(30),
country varchar(28),
goals int);

insert into players values(101,'anas','usa',6),
(102,'ali','africa',7),
(103,'afnan','england',10),
(104,'saqib','pak',6),
(105,'tabish','india',5),
(106,'abdullah','afghan',3);

select * from players;

delimiter &&
create procedure top_players()
begin
select name,country,goals from players
where goals > 6;
end &&
delimiter ;

call top_players();

# store procedure using IN parameters

use sqlintro;
                     # we see top salary of top 3 emp name
delimiter //
create procedure sp_sortbysalary(in var int)
begin
select name,dept,salary from emp_details
order by salary desc limit var ;
end //
delimiter ;

call sp_sortbysalary(2);

# update in stored procedures

delimiter //
create procedure update_salary(in temp_name varchar(30),in new_salary float)
begin
update emp_details 
set salary=new_salary
where name = temp_name;
end //
delimiter ;

call update_salary('tabish',53000);

select * from emp_details;

# sp using out procedure
	# how many male employees in the table.
    
delimiter //
create procedure sp_countemployees(out total_emps int)
begin
select count(name) into total_emps from emp_details
where sex = 'm' ;
end //
delimiter ;

call sp_countemployees(@m_emp);
select @m_emp as male_emp;



 



