SELECT * FROM chocolate_sales_analysis.people_data;
-- Select all people whose name starts with S.
SELECT * FROM people_data where `Sales Person` like "s%";

-- Fetch all records where country = 'hyderabad'.
SELECT * FROM people_data where Location="hyderabad";

-- Show the count of people in each country.
SELECT count(`sales Person`),location from people_data group by location; 

-- Show countries having more than 2 people.
SELECT Location,count(team) from people_data group by Location having count(team)>2;

-- Show customers who have placed more than 3 orders.
SELECT p.`Sales person`,count(s.boxes) from people_data p join shipments s on p.`sp id`= s. `sales Person` group by `Sales Person` having count(s.boxes)>3;

SELECT * FROM chocolate_sales_analysis.products_info;

-- Find the product with the highest price.
SELECT product,`cost per Box` from products_info order by `Cost per Box` desc limit 1;

-- Calculate the average price for each product category.
SELECT p.product,round(avg(s.amount)) as avgPrice from products_info p join shipments s on p.`Product ID`=s.product group by p.Product; 

-- Join sales and products tables to show product name and total sales.
SELECT p.product,sum(s.Amount) as TotalSales from products_info p join shipments s on p.`Product ID`=s.product group by p.Product;

-- Join sales and people tables to show customer name and total orders.
SELECT p.`sales person`,sum(s.boxes) as TotalOrders from people_data p join shipments s on p.`sp id`=s.`sales person` group by p.`sales person`;

SELECT * FROM chocolate_sales_analysis.geo_info;

-- Find the top 3 highest selling products.
SELECT p.Product,s.boxes from products_info p join shipments s order by s.boxes desc limit 3; 

-- Find the customer who spent the most money.
select p.`sales person`,s.amount from people_data p join shipments s order by s.amount desc limit 1;

-- Calculate total sales for each country.
SELECT P.Location,sum(s.amount) as `Total sales` from people_data p join shipments s on p.`SP ID`=s.`sales person` group by p.Location;

-- Calculate average sales per product.
 SELECT p.product, round(avg(s.amount),2) as avgSales from products_info p join  shipments s on p.`Product ID`=s.product group by p.Product;

-- Find the most popular product (maximum number of orders).
 SELECT p.product,max(s.boxes)as maxOrders from products_info p join  shipments s on p.`product ID`=s.product  group by p.Product order by p.Product desc limit 1;

SELECT * FROM chocolate_sales_analysis.shipments;

-- Calculate the total sales amount from the sales table.
SELECT sum(amount) as `total Sales` from shipments;

-- Count the total number of orders in the sales table.
SELECT count(boxes) as orders from shipments;

-- Calculate total sales amount for each product.
SELECT product,sum(amount) as totalAmount from shipments group by product;

-- Count total number of orders for each customer.
SELECT product,count(boxes) as orders from shipments group by product;

-- Show products where total sales amount is greater than 500.
SELECT Product,sum(amount) as `total Sales` from shipments group by Product having sum(Amount)>500;
