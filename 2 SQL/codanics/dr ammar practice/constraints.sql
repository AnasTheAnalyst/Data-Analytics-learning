DROP TABLE CHILD;

# USE OF NOT NULL AND UNIQUE CONSTRAINTS (PRIMARY KEY)
 
create table child(
stuID int not null,
stuNAME varchar(100),
stuAGE int,
unique (stuID));

DESC CHILD;

ALTER table child modify stuAGE int not null;       # not null constraints
desc child;

ALTER table child modify stuAGE int unique;          # unique constraints
desc child;

ALTER table child modify stuAGE int not null unique;
desc child;

ALTER table child drop index stuID;             # TO DROP A CONSTRAINT
desc child;

drop table child;

create table child(                      # use primary key(unique id ho gi layken not null ho gi)
stuID int not null,
stuNAME varchar(100),
stuAGE int,
primary key (stuID));

desc child;
drop table child;

create table child(                       # USE PRIMARY KEY FOR MULTIPLE COLUMNS
stuID int not null,
stuNAME varchar(5) NOT NULL,
stuAGE int,
constraint child primary key(stuID,stuNAME)
);

desc child;

# USE CONSTRAINT FOREIGN KEY

CREATE table orders(                                  # foreign key used for merge 2 column
orderID int not null,
orderNUM int not null,
customerID int,
primary key(orderID),
foreign key(customerID) references orders(orderID));

desc orders;

# use check constraint ( THIS IS FOR SPECFIC CONDITIONS IN TABLE)

drop table student;

create table student(
stuID int not null,
stuNAME varchar(50),
stuAGE int,
check(stuAGE>=18)
);

DESC student;
insert into student(stuID,stuNAME,stuAGE) VALUES(1,'hamza',20);
insert into student(stuID,stuNAME,stuAGE) VALUES(2,'aLI', 8);

SELECT * FROM student;

create table student(
stuID int not null,
stuNAME varchar(255),
stuAGE int,
stuCITY varchar(255),
constraint chk_student check (stuAGE>=18 and stuCITY='faislabad')
);



desc STUDENT;

insert into student(stuID,stuNAME,stuAGE,stuCITY) VALUES(1,'hamza',20,'faislabad');

insert into student(stuID,stuNAME,stuAGE,stuCITY) VALUES(1,'hamza',10,'faislabad');

SELECT * FROM STUDENT;

# use default constraint 
drop table student;

create table student(
stuID int not null,
stuNAME varchar(255),
stuAGE int,
stuCITY varchar(255) default'faislabad'
);

desc student;
insert into student(stuID,stuNAME,stuAGE) VALUES(1,'hamza',10);
select * from student;

# constraint index(quickly retrieve data)

create index index_name on student(stuID,stuAGE,stuNAME,stuCITY);

select * from student;

desc student;








