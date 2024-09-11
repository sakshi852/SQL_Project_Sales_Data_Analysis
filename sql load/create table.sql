create table public.Superstore
(
    Row_ID int primary key,
    Order_ID varchar(200),
    Order_Date date,
    Ship_Date date,
    Ship_Mode text,
    Customer_ID varchar(200),
    Customer_Name text,
    Segment text,
    Country text,
    City text,
    State text,
    Postal_Code int,
    Region text,
    Product_ID varchar(200),
    Category text,
    Sub_Category text,
    Product_Name varchar(300),
    Sales float,
    Quantity float,
    Discount float,
    Profit float
);

SELECT * from superstore