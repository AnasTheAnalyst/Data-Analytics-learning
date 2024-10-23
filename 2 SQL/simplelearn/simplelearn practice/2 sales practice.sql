create table sales(
product_id int,
sell_price float,
quantity int,
state varchar(25));

insert into sales values
(121, 320.0 , 3,'california'),
(121, 320.0 , 6,'texas'),
(121, 320.0 , 4,'alaska'),
(123, 290.0 , 2,'texas'),
(123, 290.0 , 7,'california'),
(123, 290.0 , 4,'washington'),
(121, 320.0 , 7,'ohio'),
(121, 320.0 , 2,'Arizona'),
(123, 290.0 , 8,'colorado');

desc sales;

select * from sales;

select product_id,sum(sell_price*quantity) as revenue
from sales
group by product_id;

create table cost_product(
product_id int,
cost_price float);

insert into cost_product values
(121,270),
(123,250);

select * from cost_product;

select c.product_id , sum(s.sell_price - c.cost_price)*sum(s.quantity) as profit
from sales as s inner join cost_product as c
on s.product_id = c.product_id
group by c.product_id;


