# JOINS
# sql joins statment is used to combine rows of data from two or more tables based on
# a common coloumn(field) between them.

create database sql_joins;
show databases;
use sql_joins;

create table cricket(
cricket_id int auto_increment,
name varchar(30),
primary key(cricket_id));

desc cricket;

create table football(
football_id int auto_increment,
name varchar(30),
primary key(football_id));

insert into cricket(name) values(
'michael'),('stuart'),('ali'),('anas'),('afnan');

select * from cricket;

insert into football(name) values(
'michael'),('ali'),('anas'),('langer'),('astle');

select * from football;

select * from                               # students that are part of both cricket and football team
cricket as c inner join football as f
on c.name =f.name;      



use classicmodels;


show tables;
select * from products;
select * from productlines;

select productcode,productname ,textDescription      # get specfic column 
from products inner join productlines
using (productline); 



# want to find revenue generated from each product, order and status of product

select * from orders ;
select * from orderdetails ;

select o.ordernumber,o.status,p.productname,sum(quantityordered * priceeach) as revenue
from orders as o 
inner join orderdetails as od on o.ordernumber = od.ordernumber 
inner join products as p on p.productcode = od.productcode
group by ordernumber,productname;
 
# Left join
# return all the rows from the left table and match rows from the right table

select * from customers;
select * from orders;

select c.customerNumber,c.customerName ,o.orderNumber,o.status
from customers as c left join orders as o
on c.customernumber=o.customernumber;



select c.customerNumber,c.customerName ,orderNumber,status
from customers as c left join orders as o
on c.customernumber=o.customernumber
where ordernumber is null;             # to find null values

# right join
# return all the rows from the right table and match rows from the left table

select * from customers;
select * from employees;

select c.customername,c.phone,e.employeenumber,e.email  from 
customers as c right join employees as e  on e.employeenumber= c.salesRepEmployeeNumber
order by employeenumber;

#  CELL JOINS USED TO JOIN a table to itself
  
select * from employees;              

select concat(m.lastname,' ',m.firstname) as managerreportsto,		# who is the manger reporting to the employee
concat(e.lastname,' ',e.firstname) as employee
from employees as e inner join employees as m on
m.employeenumber =e.reportsTo;

select concat(lastname,' ',firstname) as employee,
(select concat(lastname,' ',firstname)  from employees m where e.reportsTo = m.employeeNumber ) as managerreportsto
    from employees e;

# full outer joins (return all the rows when there is a match in either both table)
#( gives matched column on both sides)

select * from customers;
select * from orders;

select c.customernumber,c.customername , o.ordernumber from customers as c
left join orders as o on c.customernumber = o.customernumber
union
select c.customernumber,c.customername , o.ordernumber from customers as c
right join orders as o on c.customernumber = o.customernumber;








