use classicmodels;

-- select customerName ,city, state

select *
from customers
-- where city ='paris'
where customerNumber = 406
order by customerName;

# query 2

select *
from products;

select productName,productCode,buyPrice,
          MSRP,
          MSRP*2 as MSRP_NEW         # ADD NEW COLUMN
from products;

# query 3    And clause    
 
select *
from customers
where city = 'london' and creditLimit >5000;   # (in "and" operators both sides condition become fullfil) 

# OR CLAUSE

select *
from products
where not productLine ='Motorcycles' OR buyPrice > 65 and MSRP>100; # KOHI AIK side wali bhi condition puri ho tho result ajata hay

# IN CLAUSE

select *
from products
-- where productLine in ("Classic Cars","Motorcycles","Trucks and Buses"); # teno may say kohi bhi conditon pury hn tho result ajahay ga
where productLine not in ("Classic Cars","Motorcycles","Trucks and Buses");

# BETWEEN CLAUSE

select * 
from products
-- where quantityInStock >=100 AND quantityInStock <=1000;
where quantityInStock between 100 and 600;

# likE_wild characters (USE TO FIND SPECFIC WORDS)

select *
from products
where productLine like 'm%';

select *
from products
where productLine like 'c%';










