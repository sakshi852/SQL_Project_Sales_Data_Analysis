/* Overall Shipping mode preferences*/

select ship_mode,
    count(order_id) as order_count,
    cast(sum(sales) as decimal(10,1)) as total_sales, 
    cast (sum(profit) as decimal (10,1)) as total_profit,
    cast((sum(Profit)/sum(Sales)) *100 as decimal(10,0)) AS profit_margin_percentage,
    cast(avg(ship_Date- Order_date)as decimal(10,1)) as shipping_days
from superstore
group by ship_mode
order by count(order_id) desc;

/* shipping days vs profitability*/
select ship_mode,
    cast((ship_Date- Order_date)as decimal(10,1)) as shipping_days,
    count(order_id) as order_count, 
    cast (avg(profit) as decimal (10,1)) as avg_profit
from superstore
group by ship_mode,shipping_days
order by ship_mode, shipping_days;


/* Segment-wise Shipping Mode Preferences and Profitability*/
select segment, ship_mode,
    count(order_id) as order_count, 
    cast (sum(profit) as decimal (10,1)) as total_profit
from superstore
group by segment, ship_mode
order by segment,avg(ship_Date- Order_date);