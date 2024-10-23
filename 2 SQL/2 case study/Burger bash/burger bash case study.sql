use c3;

select * from burger_names; 
select * from burger_runner; 
select * from customer_orders;                                # customer ordered or present
select * from runner_orders ;                                # burgers delivered or ordered

-- 1.  how many burgers were ordered

select count(*) as burger_ordered 
from runner_orders;

-- 2.	How many unique customer orders were made?
 
 select count(distinct order_id) as unique_ordered from customer_orders;
 
 -- How many unique customers are present?-- 
 
select  count(distinct(customer_id)) as unique_customer
from customer_orders;


-- 3.	How many successful orders were delivered by each runner?  

select runner_id,count(distinct order_id) as succesful_order from runner_orders
where cancellation is null
group by  runner_id
order by succesful_order desc ;


-- 4.	How many of each type of burger was delivered? 

select * from burger_names;  
select * from runner_orders; 
select * from customer_orders;  
 
select p.burger_name,
	   count(c.burger_id) as delivered_burger_count
from 
    customer_orders as c
join 
    runner_orders as r on c.order_id = r.order_id 
join
    burger_names as p on c.burger_id = p.burger_id 
where r.distance != 0
group by p.burger_name;
 
 
-- 5.	How many Vegetarian and Meatlovers were ordered by each customer?
 
select c.customer_id, p.burger_name, count(p.burger_name) as ordered_count 
from customer_orders as c join burger_names as p on c.burger_id = p.burger_id
group by  c.customer_id,p.burger_name
order by  c.customer_id;
        
 
 -- 6.	What was the maximum number of burgers delivered in a single order?
 
 with burger_count_cte as 
    (select c.order_id,count(burger_id) as burger_per_order
 from customer_orders as c join runner_orders as r on
 c.order_id = r.order_id
 where distance != 0
 group by c.order_id)
 
 select max(burger_per_order) as burger_count
 from burger_count_cte;
 
 
--  7.	For each customer, how many delivered burgers had at least 1 change and how many had no changes?
 
 select * from customer_orders;
 
 select 
	c.customer_id ,
      sum(case when c.exclusions != " " or c.extras != " " then 1 else 0 end) as 1_change_ordered,
      sum(case when c.exclusions = " " and c.extras = " " then 1 else 0 end) as no_change_ordered
 from customer_orders as c join runner_orders as r on c.order_id=r.order_id 
 where distance != 0
 group by c.customer_id
 order by c.customer_id;	
 
 -- 8.	What was the total volume of burgers ordered for each hour of the day?
 
select extract(hour from order_time),count(order_id) as total_burger
from customer_orders
group by extract(hour from order_time); 

-- 9.	How many runners signed up for each 1 week period?  
 
 select extract(week from registration_date) as registration_week,
	    count(runner_id) as runner_signed_up
 from burger_runner
 group by  extract(week from registration_date);
 
 
 -- 10.	What was the average distance travelled for each customer?
 
 select c.customer_id,avg(r.distance) as avg_distance_travelled
 from customer_orders as c join runner_orders as r on
 c.order_id = r.order_id 
 where r.duration != 0
 group by c.customer_id;
 
 