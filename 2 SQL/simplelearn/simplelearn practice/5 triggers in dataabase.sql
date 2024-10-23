# Triggers in DBMS

# creating a trigger
-- create a trigger trigger_name,trigger_time,trigger_event
-- on table name
-- for each row
-- begin
-- ..
-- end


-- trigger time --> before,after
-- trigger event --> insert<update,delete


# after insert trigger

use sql_iq;

create table emp(
id int auto_increment primary key,
name varchar(30),age int);

create table emp_audit(id int auto_increment primary key,
audit_description varchar(500));

drop table emp_audit;

delimiter //
create trigger tr_afterinsertemp
after insert on emp
for each row
begin
insert into emp_audit values(null,concat('a new row is inserted at',now(),', %d-%m-%y %H;%i;%s %p'
));
end //
delimiter ;

insert into emp values(null,'ali',22);

select * from emp_audit;

# old and new tables terms in triggers(data inserted is goes to new table and 
# data delete is goes to old table)

delimiter //
create trigger tr_afterinsertemp1
after insert on emp
for each row
begin
declare emp_id int;
set emp_id = new.id ;
insert into emp_audit values(null,concat('a new row is inserted with id',emp_id,' at ',date_format(now(),
', %d-%m-%y %H;%i;%s %p')));
end //
delimiter ;

insert into emp values(null,'osama',27);

select * from emp_audit;

                             # after delete trigger with old 

delimiter //
create trigger tr_afterdeleteemp
after delete on emp
for each row
begin
declare emp_id int;
set emp_id = old.id ;
insert into emp_audit values(null,concat('a new row is deleted with id',emp_id,' at ',date_format(now(),
', %d-%m-%y %H;%i;%s %p')));
end //
delimiter ;

select * from emp;

delete from emp where id = 3;
select * from emp_audit;

# AFTER UPDATE TRIGGER

drop trigger tr_afterupdateemp;

delimiter //
create trigger tr_afterUPDATEemp
after update on emp
for each row
begin
declare inserted_emp_name varchar(50);
declare deleted_emp_name varchar(50);
set inserted_emp_name = new.name ;
set deleted_emp_name = old.name ;
insert into emp_audit values(null,concat('a name ',deleted_emp_name,'is replaced with ',
 inserted_emp_name,'at',date_format(now(),', %d-%m-%y %H;%i;%s %p')));
end //
delimiter ;

select * from emp_audit;
update emp set name = 'jawad' where id =1;

# before trigger(it satisfy a condition if it is true then insert,update and delete trigger works 

delimiter //
create trigger tr_beforeinsertemp
before insert on emp
for each row
begin
declare emp_age int;
set emp_age = new.age ;
if emp_age < 18 
then signal sqlstate '56000' set message_text ='you are not eligible';
end if;
end //
delimiter ;

insert into emp values (null,'asif',19);
select * from emp;


# drop trigger

drop trigger tr_beforeinsertemp;




# SIMPLELEARN

create database triggers;
use triggers;

show tables;

# before insert triggers

drop table customers;
create table customers(
cust_id int, age int , name varchar(30));

delimiter //
create trigger age_verify
before insert on customers
for each row
if new.age< 0 then set new.age = 0;
end if; // 

insert into customers values(101,20,'awais'),
(102,-10,'afnan'),
(103,24,'awan'),
(104,-19,'tabish');

select * from customers;

# after insert trigger works


create table customers1(
id int auto_increment primary key,
name varchar(40) not null,
email varchar(30), birthdate date);

create table message(
id int auto_increment,
messageid int,
message varchar(300) not null,
primary key(id,messageid));


Delimiter //
create trigger check_null_dob
after insert on customers1
for each row 
begin
if new.birthdate is null then
insert into message(messageid,message)
values(new.id, concat('Hi',new.name,', please update your date of birth.'));
end if;
end //
delimiter ;

insert into customers1(name,email,birthdate)values
('nancy','nancy@gmail.com', null),
('alexi','alexi@gmail.com','1998-11-16'),
('fancy','fancy@gmail.com', '1999-12-19'),
('yancy','yancy@gmail.com', null);

select * from message;

# before update works
drop table employees;
create table employees(
emp_id int primary key,
emp_name varchar(30),
age int, salary float);

insert into employees values
(101,'jimmy',35,70000),
(102,'ali',34,55000),
(103,'anas',40,62000),
(104,'afnan',32,57000),
(105,'yasir',42,72000),
(106,'awan',39,80000),
(107,'saqib',29,100000);

 select * from employees;
 
delimiter //
create trigger upd_trigger
before update on employees
for each row
begin
if new.salary = 10000 then
set new.salary = 85000;
elseif new.salary<10000 then
set new.salary=72000;
end if;
end //
delimiter ;

update employees 
set salary =8000;

select * from employees;

# before trigger

drop table salary;
create table salary(
eid int not null,
validfrom date not null,
amount float not null);

insert into salary(eid,validfrom,amount) values
(101,'2005-05-04',50000),
(102,'2006-06-09',80000),
(103,'2007-07-08',30000);

select * from salary;

create table salarydel(
 id int primary key auto_increment   ,  eid int   ,validfrom date not null,
 amount float not null,   deletedat timestamp default now());
 
 delimiter $$
 create trigger salary_delete
 before delete on salary
 for each row 
 begin
 insert into salarydel(eid,validfrom,amount) value
 (old.eid,old.validfrom,old.amount);
 end$$
 delimiter ;
 
delete from salary
where eid =103;
 select * from salary;
 select * from salarydel;
 
 
 
 
 
 
 
 