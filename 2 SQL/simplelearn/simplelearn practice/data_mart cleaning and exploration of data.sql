drop database case1;
CREATE DATABASE IF NOT EXISTS case1;

use case1;
show tables;

-- data cleaning 

select * from weekly_sales limit 10;
drop table clean_weekly_sales;

create table clean_weekly_sales as 
  select week_date,
week(week_date) as week_number,
month(week_date) as month,
year(week_date) as calendar_year,
region,platform,
case
   when segment=null then 'unknown'
   else segment
   end as segment,
case
   when right(segment,1)='1' then 'young_age'
   when right(segment,1)='2' then 'middle_aged'
   when right(segment,1) in ('3','4') then 'Retirees'
   else 'unknown'
   end as age_band,
case 
    when left(segment,1)='c' then 'couples'
    when left(segment,1)='f' then 'families'
    else 'unknown'
    end as demographics,
    customer_type,transactions,sales,
    round(sales/transactions,2) as 'average_trans' 
    from weekly_sales ;
    
select * from clean_weekly_sales limit 10;


-- data exploration 

-- which week number are missing from the table
drop table seq100;

create table seq100(x int auto_increment primary key);

insert into seq100 values(),(),(),(),(),(),(),(),(),();
insert into seq100 values(),(),(),(),(),(),(),(),(),();
insert into seq100 values(),(),(),(),(),(),(),(),(),();
insert into seq100 values(),(),(),(),(),(),(),(),(),();
insert into seq100 values(),(),(),(),(),(),(),(),(),();
insert into seq100
		    select x+50 from seq100;

select * from seq100;

create table seq52 as
        select x from seq100 limit 52 ;
        
select * from seq52;

select distinct X as week_day from seq52
where x not in (select distinct week_number from clean_weekly_sales);       # missing week number in clean_weekly_sales table

select distinct week_number from clean_weekly_sales;

# how many total transaction  per years 

select calendar_year ,sum(transactions) from clean_weekly_sales
group by calendar_year;

# what are the total sales for each each region in each month?
select * from clean_weekly_sales;

select month,region,sum(sales) as Total_sales from clean_weekly_sales
group by region,month;

# what is the totalcount of transaction for each platform

select platform , sum(transactions)  from clean_weekly_sales
group by platform;

# what is percentage of sales for shopify vs retail for each month

with cte_monthly_platform_sales as 
(select month,calendar_year,platform,sum(sales) as monthly_sales
from clean_weekly_sales
group by month,calendar_year,platform)

select month,calendar_year,
round(100*max(case when platform ='Retail' then monthly_sales
else null end)/sum(monthly_sales),2) as retail_percentage,

round(100*max(case when platform ='Shopify' then monthly_sales
else null end)/sum(monthly_sales),2) as shopify_percentage 
from cte_monthly_platform_sales
group by month,calendar_year;
 
 
 # what is the percentage of sales by demographic by each year
 
select calendar_year,demographics,sum(sales) as yearly_sales,
round(100*sum(sales)/sum(sum(sales))over(partition by demographics),2) as percentage
from clean_weekly_sales
group by calendar_year,demographics;
 

select month,calendar_year,platform,sum(sales) as yearly_sales,
round(100*sum(sales)/sum(sum(sales)) over (partition by platform),2)
as percentage from clean_weekly_sales
group by calendar_year,month,platform;


# Query 1 calculates individual percentages for 'Retail' and 'Shopify' platforms based on their monthly sales within each month 
# and calendar year  Query 2 provides an overall percentage of sales for each platform across all months, while

select * from clean_weekly_sales;

-- which age_band and demographic values contribute to the retail sales?

select age_band,demographics,sum(sales) as total_sales
from clean_weekly_sales
where platform = "Retail"
group by age_band,demographics
order by total_sales desc; 










 
