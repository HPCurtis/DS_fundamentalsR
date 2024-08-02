-- SQL Portfolio porject

/*
 Check for any rows that are NULL values.

*/

SELECT *
FROM groceries.transactions
WHERE transaction_date IS NULL
OR num_items IS NULL
OR sales_cost IS NULL
OR customer_id IS NULL;

-- Look at our sales totals for the 6 months.
SELECT
  ROUND(SUM(sales_cost), 2) AS total_sales_value,
  SUM(num_items) AS total_num_items,
  ROUND(AVG(sales_cost),2) AS average_transaction_value
FROM groceries.transactions;


SELECT *
FROM groceries.customer_details;

-- Who are our top 10 most valuable customers?
SELECT customer_id,
       SUM(num_items) AS total_num_items,
       SUM(sales_cost) AS total_sales_cost,
       SUM(sales_cost) / SUM(num_items) AS average_item_value,
       AVG(sales_cost) AS average_purchase_value,
       SUM(sales_cost) / 6 AS average_monthly_customer_value
       -- , SUM(SUM(sales_cost)) OVER () AS grand_total_Sales
FROM groceries.transactions
GROUP BY customer_id
ORDER BY total_sales_cost DESC
LIMIT 10;

-- Q1 - Verify the validity of the Pareto principal - that 80% of profits come from 20% of customers - for our data.  
-- Split our customers into quintiles of total sales value from the 6 months transaction data we have - our top 20% will be quintile 1
SELECT customer_id,
       SUM(num_items) AS total_num_items,
       SUM(sales_cost) AS total_sales_value,
       NTILE(5) OVER (ORDER BY SUM(sales_cost) DESC) AS Customer_Value_Quintile,
       SUM(SUM(sales_cost)) OVER () AS grand_total_sales
FROM groceries.transactions
GROUP BY customer_id;


-- Run a query over this selection and group by the quintile, to see the total sales value for each customer value quintile
WITH CUST_VALUE AS 
(
  SELECT customer_id,
         SUM(num_items) AS total_num_items,
         SUM(sales_cost) requAS total_sales_value,
         NTILE(5) OVER (ORDER BY SUM(sales_cost) DESC) AS Customer_Value_Quintile,
         SUM(SUM(sales_cost)) OVER () AS grand_total_sales
  FROM groceries.transactions
  GROUP BY customer_id
)
SELECT Customer_Value_Quintile,
       SUM(total_num_items) AS total_num_items,
       SUM(total_sales_value) AS total_sales_value,
       (SUM(total_sales_value) * 100) / MAX(grand_total_sales) AS percentage_total_sales
FROM CUST_VALUE
GROUP BY Customer_Value_Quintile
ORDER BY Customer_Value_Quintile;

-- So we see from our groceries db data, that Pareto's principal is false, we have just under 50% of sales from our top 20% of customers.


-- Q2 We want to look at the cost of supply, so now we ideally want to optimise for customers who make fewer, larger purchases, thereby reducing packing and delivery costs.

