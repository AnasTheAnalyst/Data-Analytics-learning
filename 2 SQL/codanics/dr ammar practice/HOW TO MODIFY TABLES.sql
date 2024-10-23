show databases;

create database anasDB;

SHOW databases;
use anasdb;

create table students (
stuID int,
stuNAME varchar(45),
stuAGE int,
stuCITY varchar(50));

show tables;
desc students;

insert into students(stuID,stuNAME,stuAGE,stuCITY) VALUES
(1,'hamza',20,'faislabad');                         # TO ADD Records

select * from students;

insert into students(stuID,stuNAME,stuAGE,stuCITY) VALUES(2,'hammad',21,'lahore');
insert into students(stuID,stuNAME,stuAGE,stuCITY) VALUES(3,'anas',24,'khushab');
insert into students(stuID,stuNAME,stuAGE,stuCITY) VALUES(4,'ali',25,'karachi');
SELECT * from students;

select stuNAME FROM students;
select stuAGE from students where stuAGE<23;
select * FROM students where stuAGE <23;

alter table students add column stuCOUNTRY text;        # add coloumn in table

desc students;
select * from students; 

UPDATE students SET stuCOUNTRY = "pakistan" where stuID=1; # UPDATE table fields
select * from students;
 
UPDATE students SET stuCOUNTRY = "pakistan" where stuAGE=24;
delete from students where stuCOUNTRY= "";                # for delete the fields
Alter table students drop stucountry;                         #  DROP A COLOUMN
select * from students; 

ALTER table students                                      # TO MODIFY NAME OF FIELD
change stuAGE
stAGE varchar(100); 

select * from students; 

alter table students add column stuID INT;

insert into students(stuNAME,stAGE,stuCITY,stuID,stuCOUNTRY) VALUES
('abbas','lila,19,',4,'pakistan');
select * from students;

insert into students(stuNAME,stuAGE,stuCITY,stuCOUNTRY,stuID) VALUES
('anas',19,'layyah','pakistan',5);
select * from students;

# use distinct function
select distinct stAGE from students;
