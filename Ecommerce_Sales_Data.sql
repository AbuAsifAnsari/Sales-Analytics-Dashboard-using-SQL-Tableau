create database Ecommerce
select * from Ecommerce_Sales_Data

1. Find top-selling products.

select Product, sum(Sales) as total_sales
from Ecommerce_Sales_Data
group by 1
order by 2 desc

2. Find top-selling categories

select Category, sum(Sales) as total_sales
from Ecommerce_Sales_Data
group by 1
order by 2 desc

3. Calculate customer lifetime value (CLV).

select 
CustomerID, sum(Sales) as clv
from 
Ecommerce_Sales_Data
group by 1
order by 2 desc

4. Analyze monthly/seasonal sales trends.

select 
date_format(OrderDate, '%y-%m') as month, 
sum(Sales) as monthly_sale
from 
Ecommerce_Sales_Data
group by 1
order by 1 

5.  Identify regions with highest/lowest sales.

select 
Region, sum(Sales) as total_sales 
from 
Ecommerce_Sales_Data
group by 1 
order by 2 desc

6. Total Sales per Customer:


with a as
(select 
CustomerID, count(OrderID) as total_order, sum(Sales) as total_sales
from 
Ecommerce_Sales_Data
group by 1)

select a.*, 
case when a.total_sales > 500 then 'High-Value Customers'
when a.total_sales <= 500  and 
a.total_sales > 200 then 'Medium-Value Customers'
else 'Low-Value Customers' end as segments
from a



