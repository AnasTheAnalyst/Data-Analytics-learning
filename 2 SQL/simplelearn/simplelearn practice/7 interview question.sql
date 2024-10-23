use sqlintro;

select * from emp_details;

# find the lowest salary of employees in each dept

select name,dept,min(salary) as lowest_salary from emp_details
group by name,dept
order by lowest_salary;

# which query will help you fetch unique values from a column in a table

select distinct (dept) from emp_details;

SELECT emp_id
FROM emp_details
GROUP BY emp_id
HAVING COUNT(emp_id) = 1 
LIMIT 0, 1000 ;



select city from emp_details
group by city
having count(city)=1;

# write query to fetch unique dept from table

select distinct dept from emp_details;

# unique dept and length of dept from table

select distinct(dept),char_length(dept) as length_dept from emp_details;
 
# what is the use of the DATEDIFF Function in sql;
# (datediff returns the number of days between two date,datetime,or timestamp values)

select datediff('2021-04-10','2021-03-10') as total_days;

select datediff(now(),'2022-04-20');

# write sql query of dept that have more than 1 employees;
  
 select dept,count(emp_id) from emp_details
 group by dept 
 having count(emp_id) > 1;
 
 
select * from emp_details;

# Display the details of employees of all the department except one dept(IT)

select * from emp_details 
where dept != 'it';      # <> means not equal to

# write sql query to display the details of emp that join before 2005-05-30 and after 2007-04-21

select * from emp_details 
where doj <'2005-05-30' or doj > '2007-04-21';


# find the employee with 3 highest salary from the table
select * from emp_details 
order by salary desc limit 3 ;
 
select * from (select * from emp_details order by salary desc limit 3) as t
order by salary desc limit 2 ;                    # we use limit 3 so we get only 3 max salary employee in table

select * from emp_details ;


###  print all the alternate or even record in the table


select * from emp_details where emp_id % 2 =0 ;         # emp whose emp_id are even

select * from emp_details where emp_id % 2 = 1;        # emp whose  emp_id are odd

with CTE as
 ( 
   select *,row_number() over(order by emp_id) as rn
   from emp_details)

select * from CTE where rn % 2 = 0  ;

 

## SQL QUERY TO FIND DUPLICATE ROW IN THE TABLE

select emp_id,name,dept,city,count(*) as dup_row FROM emp_details
group by emp_id,name,dept,city
having count(emp_id)>0 and count(name)>0 and count(dept)>0 and count(city)>0; 

select count(*) as dup_row FROM emp_details
group by emp_id,salary
having count(*) > 0;

## display the emp name having 2 A in their name

select length(replace( upper(name) , 'A' , '' )) from emp_details;

select * from emp_details
where length(name) - length(replace(upper(name),'A',''))=2;


## given a string ,how will you extract four character starting from the 2nd position
# extract strings

select substr("Michael Ballack",2,4);        # 2 position,4 is length characters
select substring("anas awan",1,2);



### how does self joins work
#(self joins join table to itself.table must contain the column(x)that acts as the primary key and
# different column(y) that stores value that can be matched up with the values in column x.
use classicmodels;
select * from employees;

select e.employeeNumber,e.lastname,e.reportsTo,m.lastname as manager_name from 
employees as e join employees as m 
on e.reportsTo = m.employeeNumber;



## which of the following is the virtual table in sql;

# a ) self join 
# b) view
# c) empty table
# d) common table expression

# answer   ) view is the virtual table




### write sql query to fetch the list of employees with the same salARY


select distinct e.emp_id,e.name,e.salary 
from emp_details as e , emp_details as e1 
where e.salary = e1.salary and e.emp_id != e1.emp_id;

select * from emp_details;



### WRITE SQL QUERY TO DISPLAY a row twice in result from table
# union
      -- The UNION command combines the result set of two or more SELECT statements (only distinct values)
# union all
      --  The UNION ALL command combines the result set of two or more SELECT statements (allows duplicate values)(null values also)
      
  # print employee name , dept who are from finance dept
  
select name,dept from emp_details as e           
where e.dept ='finance'
union all
select name,dept from emp_details as e1
where e1.dept='hr';

select * from emp_details;


###  (using a num table,write a query to add 10 where number is 0,
#        20 when number is 1,else print the number itself)

create table num(n_id int);
insert into num values(0),(8),(1),(2),(5),(1),(2),(3),(3),(5),(8),(9),(20),(0);


select n_id ,
case 
    when n_id =0 then n_id+10
    when n_id =1 then n_id +20
else n_id
end as num_add
from num;


## given a num1 table ,write a query to find sum of all positive and negative values 

create table num1(num_iNT int);
insert into num1 values(0),(-8),(1),(-2),(-5),(1),(-2),(3),(-3),(5),(8),(9),(-20),(0);

select 
      sum(case when num_int > 0 then num_int else 0 end) as sum_positive,
      sum(case when num_int < 0 then num_int else 0 end) as sum_neg
from num1;


## CHECK CONSTRAINTS
# CHECK constraint is used to limit the values that is inserted into columns

create table dummy_sql(
emp_id int primary key,
city varchar(50) check (city='mumbai'),
age int check (age > 0));

insert into dummy_sql values
(102,'mumbai',40);

insert into dummy_sql values
(102,'mumbai',-40);

SELECT * FROM dummy_sql;



## from 2 tables ,fetch values from table B that are not present in table A(kayu kay a sab match ho jahay gay join say)
# (USING LEFT JOIN) it returns all the values from the left table and match rows from the right table

create table A(id int);
insert into A values(0),(8),(1),(2),(5),(1),(2),(0);

create table B(id int);
insert into B values(0),(1),(1),(2),(3),(4),(2),(5);

select id from B               # b is left table
left join  A using(id)         # a is right table
where A.id IS NULL; 



###################      Customers with no order
# for this we use distinct and not in function

use classicmodels;
show tables;

select * from customers;
select * from orders;

select distinct customerNumber from orders;   

# we first use the distinct to find difference in customernumber in customers and orders table  

select customernumber from customers
where customernumber not in(select customernumber from orders);




################   # find all the month end orders using orders table
# using built in function  EOMONTH  Function

select * from orders;

select customerNumber,ordernumber,orderdate from orders
where orderDate = EOMONTH(orderdate)
order by customerNumber,ordernumber;            # THIS function is used in mysql server

select customerNumber,ordernumber,orderdate from orders
WHERE orderdate < now() - INTERVAL 5 DAY
order by customerNumber,ordernumber;




###### top 5 countries with highest freight charges in 1997
# freight charge is calculated on mode of transpotation,pick place and destination.

use northwind;

select * from orders;

select shipcountry,avg(freight) as average_freight
from orders where year(orderdate)=1997
group by shipcountry
order by average_freight desc;




########## display the total number of products in each category

select * from  products;
select * from  categories;

select categoryname,count(*) as total_products
from products as p inner join categories as c
on p.categoryid = c.categoryid
group by categoryname
order by count(*) desc;



######## find the list of late orders of all the employees
select * from  orders;
select * from  employees;

select e.employeeid,e.firstname,count(*) as late_orders
from orders as o inner join employees as e
on o.employeeid = e.employeeid
where requireddate <= shippeddate
group by e.employeeid,e.firstname
order by late_orders desc;



-- For example, if you are looking for a specific customer with the last name Chavez, the WHERE clause would be: 

-- WHERE field1 = 'Chavez'

-- However, if you are looking for all customers with a last name that begins with the letters “Ch," the WHERE clause would be:

-- WHERE field1 LIKE 'Ch%'