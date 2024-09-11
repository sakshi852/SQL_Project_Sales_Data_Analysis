COPY Superstore
FROM 'C:\Users\acer\OneDrive\Desktop\developer\SQL_Project_Sales_Data_Analysis\Superstore.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

copy Superstore FROM 'C:\Users\acer\OneDrive\Desktop\developer\SQL_Project_Sales_Data_Analysis\Superstore.csv' 
WITH (FORMAT csv, HEADER true, DELIMITER ',');
