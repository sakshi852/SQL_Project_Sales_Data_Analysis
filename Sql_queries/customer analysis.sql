select count(DISTINCT(customer_id)) from superstore;

/*Top 10 Customers Driving Highest Profit*/

select customer_id,
    cast(sum(sales) as decimal(10,1)) as total_sales, 
    cast (sum(profit) as decimal (10,1)) as total_profit
from superstore
group by customer_id
order by total_profit desc
limit 10;

/*Top 10 Customers by Highest Average Order Value*/

select customer_id,
    cast(avg(sales) as decimal(10,1)) as avg_sales
from superstore
group by customer_id
order by avg_sales desc
limit 10;

/*identifying customers by segment*/
select segment, count(distinct(customer_id)) as distinct_customer,
    cast (sum(quantity) as decimal (10,1)) as quantity_sold,
    cast(sum(sales) as decimal(10,1)) as total_sales, 
    cast (sum(profit) as decimal (10,1)) as total_profit
from superstore
group by segment
order by total_profit desc;

/*identifying customers by region and state*/
select region, state, 
    count(distinct(customer_id)) as distinct_customer,
    cast (sum(quantity) as decimal (10,1)) as quantity_sold,
    cast(sum(sales) as decimal(10,1)) as total_sales, 
    cast (sum(profit) as decimal (10,1)) as total_profit
from superstore
group by region, state
order by distinct_customer desc
limit 10;

/*total orders per customer*/
select distinct(customer_id),
    count(DISTINCT(order_id)) as order_count,
    sum(quantity) as total_quantity
from superstore
group by customer_id
having count(DISTINCT(order_id))>1
order by count(DISTINCT(order_id)) desc
limit 10;
