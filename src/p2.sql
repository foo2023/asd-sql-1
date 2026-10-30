SELECT cus.customer_name AS Customer_Name, order_date AS Order_Date
FROM Customer AS cus INNER JOIN Orders AS ord
    ON cus.customer_id = ord.customer_id -- inner join on both side
WHERE cus.city LIKE '%New%York%'; -- filter the record with containing only 'New' and 'York'