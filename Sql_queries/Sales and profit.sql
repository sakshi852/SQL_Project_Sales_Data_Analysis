select * from superstore
limit 5;

/* year wise total sales and profit*/

with summary as (
select 
    extract (year from order_date) as year, 
    cast(sum(sales) as decimal(10,1)) as total_sales, 
    cast (sum(profit) as decimal (10,1)) as total_profit
from superstore
group by year
order by year asc
)
select *, 
     cast (((total_sales * 1 / lag(total_sales) over (order by year)) - 1) * 100 as decimal (10,1)) as sales_increase,
     cast (((total_profit * 1 / lag(total_profit) over (order by year)) - 1) * 100 as decimal (10,1)) as profit_increase
from summary;

/* quarter wise total sales and profit*/

with summary as (
select 
    extract (quarter from order_date) as quarter, 
    cast(sum(sales) as decimal(10,1)) as total_sales,
    cast (sum(profit) as decimal (10,1)) as total_profit
from superstore
group by quarter
order by quarter asc
)
select *, 
     cast (((total_sales * 1 / lag(total_sales) over (order by quarter)) - 1) * 100 as decimal (10,1)) as sales_increase,
     cast (((total_profit * 1 / lag(total_profit) over (order by quarter)) - 1) * 100 as decimal (10,1)) as profit_increase
from summary;


/* segment wise total sales and profit*/

select 
    segment, 
    cast(sum(sales) as decimal(10,1)) as total_sales, 
    cast (sum(profit) as decimal (10,1)) as total_profit,
    cast((sum(Profit)/sum(Sales)) *100 as decimal(10,0)) AS profit_margin_percentage
from superstore
group by segment
order by total_sales;

/* region wise total sales and profit*/

select 
    region, 
    cast(sum(sales) as decimal(10,1)) as total_sales, 
    cast (sum(profit) as decimal (10,1)) as total_profit
from superstore
group by region
order by total_sales desc;

/* category wise total sales and profit*/

select 
    category, 
    cast(sum(sales) as decimal(10,1)) as total_sales, 
    cast (sum(profit) as decimal (10,1)) as total_profit,
    cast((sum(Profit)/sum(Sales)) *100 as decimal(10,0)) AS profit_margin_percentage
from superstore
group by category
order by total_sales desc;

/* sub-category wise total sales and profit*/

select 
    sub_category, 
    cast(sum(sales) as decimal(10,1)) as total_sales, 
    cast (sum(profit) as decimal (10,1)) as total_profit,
    cast((sum(Profit)/sum(Sales)) *100 as decimal(10,0)) AS profit_margin_percentage
from superstore
group by Sub_category
order by profit_margin_percentage desc;