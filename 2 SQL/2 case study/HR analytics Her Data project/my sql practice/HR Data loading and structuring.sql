CREATE DATABASE projecthr;

USE projecthr;

create table hr(
ï»¿id text,
first_name text, 
last_name text,
birthdate text,
gender	text,
race	text,
department	text,
jobtitle	text,
location	text,
hire_date	text,
termdate	text,
location_city	text,
location_state text
);

 
SELECT * FROM hr  ;
drop table hr;

# Load data local infile ( first create the table with same datatype as in the loading file then write below query)

load data local infile "C:/ProgramData/MySQL/MySQL Server 8.0/Data/projecthr/Human Resources.csv " 
into table hr
fields terminated by ','
ENCLOSED BY '"'  LINES TERMINATED BY '\r\n'
ignore 1 lines;

SHOW VARIABLES LIKE "secure_file_priv";          # FOR ERROR CODE 1290. sql server is running with the "secure_file_priv" option it cannot execute this statement
												-- (open the my.ini.text file --mysql server --then secure_file_priv="")and start sql in services
SHOW GLOBAL VARIABLES LIKE 'local_infile';         # FOR ERROR CODE 3948. Loading local data is disabled;this must be enabled
SET GLOBAL local_infile = true;                   # FOR ERROR CODE 2068 LOAD DATA LOCAL INFILE file requesT
						--  rejected due to restrictions on access.(IN this edit the connection -click advanced --other -- add "OPT_LOCAL_INFILE=1'  


SET sql_notes = 0;     
SHOW WARNINGS;                                       # to show warnings
SET GLOBAL log_error_verbosity = 3;                   # to off log errors
SHOW GRANTS FOR current_user();

# data cleaning and structuring

SELECT * FROM hr  ;

ALTER TABLE hr
CHANGE COLUMN ï»¿id emp_id VARCHAR(20) NULL;          # change column name

DESCRIBE hr;

SELECT birthdate FROM hr;

SET sql_safe_updates = 0;

UPDATE hr
SET birthdate = CASE
	WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
END;

ALTER TABLE hr
MODIFY COLUMN birthdate DATE;                         # change datatype

UPDATE hr
SET hire_date = CASE
	WHEN hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN hire_date LIKE '%-%' THEN date_format(str_to_date(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
END;

ALTER TABLE hr
MODIFY COLUMN hire_date DATE;

UPDATE hr
SET termdate = date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC'))
WHERE termdate IS NOT NULL AND termdate != '';

select termdate from hr;

ALTER TABLE hr
MODIFY COLUMN termdate DATE;

ALTER TABLE hr 
ADD COLUMN age INT;              # add new column

UPDATE hr
SET age = timestampdiff(YEAR, birthdate, CURDATE());

SELECT 
	min(age) AS youngest,
    max(age) AS oldest
FROM hr;

SELECT count(*) FROM hr WHERE age < 20;

SELECT COUNT(*) FROM hr WHERE termdate > CURDATE();

SELECT COUNT(*)
FROM hr
WHERE termdate = '0000-00-00';

SELECT location FROM hr;