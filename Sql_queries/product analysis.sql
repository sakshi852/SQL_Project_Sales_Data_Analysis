/*Determining the Best-Selling Products*/

select product_name,
    cast (sum(quantity) as decimal (10,1)) as quantity_sold,
    cast(sum(sales) as decimal(10,1)) as total_sales, 
    cast (sum(profit) as decimal (10,1)) as total_profit
from superstore
group by product_name
order by quantity_sold descs;

/*analysing the least profit margin products*/

select product_name,
    cast(sum(sales) as decimal(10,1)) as total_sales, 
    cast (sum(profit) as decimal (10,1)) as total_profit,
    cast((sum(Profit)/sum(Sales)) *100 as decimal(10,0)) AS profit_margin_percentage
from superstore
group by product_name
order by profit_margin_percentage asc
limit 20;

/*Identifying low performing products*/

select product_name,
    cast(sum(sales) as decimal(10,1)) as total_sales, 
    cast (sum(profit) as decimal (10,1)) as total_profit
from superstore
group by product_name
having 
    sum(sales) < 100
    and sum(profit)<100
order by total_profit asc
limit 10;