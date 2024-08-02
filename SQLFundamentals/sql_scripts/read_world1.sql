-- The number of rows in transdactions table.
SELECT 
    COUNT() AS number_rows
FROM 
    groceries.transactions;

-- Return the customer id from the customer who lives farthest from the store.

SELECT 
    customer_id AS id,
    distance_from_store
FROM    
    groceries.customer_details
WHERE
    distance_from_store = (SELECT MAX(distance_from_store) FROM groceries.customer_details);

-- Return the number of unique customers in the customer_details table, split by gender    
SELECT
    count(),
    gender
FROM 
    groceries.customer_details
GROUP BY 
    gender;