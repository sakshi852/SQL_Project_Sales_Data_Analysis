select 
    discount,
    sum((sales/(1-discount))-sales) as sum_discount,
    cast (sum(quantity) as decimal (10,1)) as quantity_sold,
    cast(avg(sales) as decimal(10,1)) as avg_sales, 
    cast(sum(sales) as decimal(10,1)) as total_sales, 
    cast (sum(profit) as decimal (10,1)) as total_profit,
    cast((sum(Profit)/sum(Sales)) *100 as decimal(10,0)) AS profit_margin_percentage
from superstore
group by discount
order by discount desc


/*total discount amount given per quarter*/
select 
    extract(quarter from order_date) as quarter,
    avg(discount) as avg_discount,
    sum((sales/(1-discount))-sales) as sum_discount,
    cast (sum(quantity) as decimal (10,1)) as quantity_sold,
    cast(avg(sales) as decimal(10,1)) as avg_sales, 
    cast(sum(sales) as decimal(10,1)) as total_sales, 
    cast (sum(profit) as decimal (10,1)) as total_profit,
    cast((sum(Profit)/sum(Sales)) *100 as decimal(10,0)) AS profit_margin_percentage
from superstore
group by quarter
order by quarter asc

/*total discount amount given region wise*/
select 
    region,
    avg(discount) as avg_discount,
    sum((sales/(1-discount))-sales) as sum_discount,
    cast (sum(quantity) as decimal (10,1)) as quantity_sold,
    cast(avg(sales) as decimal(10,1)) as avg_sales, 
    cast(sum(sales) as decimal(10,1)) as total_sales, 
    cast (sum(profit) as decimal (10,1)) as total_profit,
    cast((sum(Profit)/sum(Sales)) *100 as decimal(10,0)) AS profit_margin_percentage
from superstore
group by region
order by sum_discount desc

/*total discount amount given category wise*/
select 
    category,
    avg(discount) as avg_discount,
    sum((sales/(1-discount))-sales) as sum_discount,
    cast (sum(quantity) as decimal (10,1)) as quantity_sold,
    cast(avg(sales) as decimal(10,1)) as avg_sales, 
    cast(sum(sales) as decimal(10,1)) as total_sales, 
    cast (sum(profit) as decimal (10,1)) as total_profit,
    cast((sum(Profit)/sum(Sales)) *100 as decimal(10,0)) AS profit_margin_percentage
from superstore
group by category
order by sum_discount desc