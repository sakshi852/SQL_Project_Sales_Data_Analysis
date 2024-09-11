This project contains below mentioned sections:
- Introduction
- Background
- Tools used
- Analysis
- Conclusion

# Introduction

### 📊 Sales and Profit Data Analysis Project

This project is a detailed analysis of retail sales data aimed at uncovering key insights to drive business improvement. By exploring sales trends, customer behavior, shipping modes, and profitability across various segments, the project seeks to provide actionable recommendations for boosting sales, improving customer retention, and optimizing operational efficiency. The insights gained from this analysis help drive data-backed decision-making for enhancing business performance.

### 🔍 Key Objectives
The primary objectives of this project are:
- To analyze sales and profit performance across different customer segments and regions.
- To identify top customers and most profitable products.
- To assess the effectiveness of shipping methods and their impact on profit.
- To evaluate discount strategies and their influence on sales.
- To suggest strategies for increasing profitability while enhancing customer satisfaction and retention.

🔗 Check the SQL queries here: 📂[Sales_Data_Analyis](Sql_queries)

# Background

### 🗺️ Navigating the Superstore Data

The dataset used in this project comes from a retail store’s sales records, spanning several years. It contains comprehensive details on orders, products, customers, sales, profits, discounts, and shipping. The dataset includes fields such as sales, profit, discount, shipping mode, customer segment, and regional information, providing a comprehensive view of the store's operations over time.

📊 Data Source: The dataset can be accessed on Kaggle through the following [link.](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final?resource=download) 

The project's objective is to analyze this data to uncover actionable insights that can drive business growth and enhance operational performance.

## Analyzed Questions
These are the questions that I answered through the queries:

1.  📊 **Sales and Profit Analysis:** Which customer segments, products, and regions drive the highest sales and profit?  How can we maximize sales and profit performance?
1. 🛠️ 💡 **Shipping Analysis:** What shipping modes are the most efficient and profitable? How do different shipping modes perform in terms of order volume, total profit, and customer preference across regions and segments?
1. 💼 **Product Analysis:** What are the most profitable products, and how do different categories perform in terms of sales volume and profit margins?
1. 💰 **Discount Analysis:** What impact do discount strategies have on sales and profitability across various segments and regions? How can discounting be optimized to boost profit without compromising too much on revenue?
1. 📊 **Customer Analysis:** Who are the top customers in terms of profit and order volume? How can customer loyalty and retention be improved by focusing on high-value customers?

# Tools Used
- SQL: Executed SQL queries to analyze the dataset.
- PostgreSQL: Managed the database where the dataset was stored.
- Visual Studio Code: Wrote and edited SQL queries and project files.
- Git and GitHub: Version control system used to track changes in project files and hosted the project repository and facilitated collaboration and sharing.

# Analyis

### Sales and Profit Analysis

1. **Analyzing the year wise total sales and profit**

```sql

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
```

📊 Key Insights:

The year-wise sales and profit data reveals a steady upward trend overall, with a slight dip in sales in 2015. Despite this, profit still grew in 2015, suggesting effective cost management. 

Significant growth in both sales (29.5%) and profit (32.7%) in 2016 indicates a year of strong performance, likely driven by strategic decisions or market conditions. 

The momentum continued in 2017 with both sales and profits increasing, although at a slower pace compared to 2016. Optimizing strategies during periods of slower growth could help sustain long-term profitability and sales increases.

2. **Analyzing Quarter wise total sales and profit**

```sql
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
```

📊 Key Insights:

The data reveals a consistent increase in sales and profit throughout the quarters, with Q4 showing the highest performance. Sales surged by 43% and profits by 52.7% in Q4, which suggests strong seasonal effects or effective end-of-year strategies. Q3 also demonstrated significant growth, indicating a robust period, while Q1 lagged behind with the lowest figures.
 
  To optimize sales performance year-round, consider enhancing Q1 results through targeted promotions or introducing new products early in the year to build momentum.

3. **Analyzing segment wise total sales and profit**

```sql
select 
    segment, 
    cast(sum(sales) as decimal(10,1)) as total_sales, 
    cast (sum(profit) as decimal (10,1)) as total_profit,
    cast((sum(Profit)/sum(Sales)) *100 as decimal(10,0)) AS profit_margin_percentage
from superstore
group by segment
order by total_sales;
```
📊 Key Insights:

The Consumer segment leads with the highest sales and profit, despite having the lowest profit margin of 12%. The Corporate segment shows strong sales and a decent profit margin of 13%, while the Home Office segment, though having the smallest sales, exhibits a slightly higher profit margin of 14%. 

To boost overall profitability, consider strategies to enhance the profit margins in the Consumer segment and leverage the higher margin in the Home Office segment for growth.

4. **Analyzing region wise total sales and profit**

```sql
select 
    region, 
    cast(sum(sales) as decimal(10,1)) as total_sales, 
    cast (sum(profit) as decimal (10,1)) as total_profit
from superstore
group by region
order by total_sales desc;
```

📊 Key Insights:

Top-Performing Regions: The West region outperforms others with the highest total sales and profit, indicating a strong market presence and potentially effective sales strategies. The East region also shows robust performance, though it lags behind the West. The Central and South regions have lower sales and profit, with the South showing the lowest figures

Opportunity for Expansion: Focus on enhancing market strategies in the Central and South regions. Leveraging successful tactics from the top-performing West region could help increase sales and profitability in these areas.


5. **Analyzing category wise total sales and profit**


```sql
select 
    category, 
    cast(sum(sales) as decimal(10,1)) as total_sales, 
    cast (sum(profit) as decimal (10,1)) as total_profit,
    cast((sum(Profit)/sum(Sales)) *100 as decimal(10,0)) AS profit_margin_percentage
from superstore
group by category
order by total_sales desc;
```

📊 Key Insights:

The data reveals that the Technology and Office Supplies categories are the most profitable, each achieving high profit margins, with Technology standing out for its exceptional performance. 

In contrast, the Furniture category, despite generating substantial sales, has a significantly lower profit margin. This suggests a need for strategic improvements in pricing or cost management within the Furniture category to enhance overall profitability.

6. **Analyzing sub-category wise total sales and profit**

```sql
select 
    sub_category, 
    cast(sum(sales) as decimal(10,1)) as total_sales, 
    cast (sum(profit) as decimal (10,1)) as total_profit,
    cast((sum(Profit)/sum(Sales)) *100 as decimal(10,0)) AS profit_margin_percentage
from superstore
group by Sub_category
order by profit_margin_percentage desc;
```

📊 Key Insights:

The sub-category analysis shows significant variation in profitability. Labels, Paper, and Envelopes are the top performers with high profit margins, indicating strong profitability and efficient cost management. 

On the other hand, Supplies, Bookcases, and Tables are struggling with negative profit margins, suggesting issues with either pricing or cost structure.Addressing these issues, possibly through price adjustments or cost reductions, could improve profitability in these less successful sub-categories. Additionally, focusing on leveraging the high-margin sub-categories could help boost overall profit margins.