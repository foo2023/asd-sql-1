-- sales analysis
-- Left join Orders with Sale on order_id and group by order. Return the total and average quantity sold for each order, keeping orders that have no sale records.
SELECT 
    o.order_id AS Order_Id, 
    SUM(quantity) AS Total_Quantity_Sold, 
    AVG(quantity) AS Average_Quantity_Sold
FROM Orders AS o LEFT OUTER JOIN Sale AS s
    ON o.order_id = s.order_id -- join on the same order_id
GROUP BY o.order_id; -- group multiple order_id (in the Sale record)