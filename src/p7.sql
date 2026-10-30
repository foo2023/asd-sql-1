-- Problem 7 - Delete Customer
-- With bonus implemented
-- Will use Procedure
-- Procedure allow repeated call without manual copy and paste the query everytime.

DELIMITER //
CREATE PROCEDURE deleteCustomer(
    IN p_customer_id INT
)
COMMENT 'Deleting a customer and maintaining the integrity to the entity relationship'
BEGIN
    -- Delete customer
    DELETE FROM Customer
        WHERE customer_id = p_customer_id;

    -- Bonus part implemented inside p1.sql
    -- ON DELETE CASCADE added a rule to the table, when the customer record deleted, the record in Orders where it reference to this customer will also be deleted. 
    -- Sale record that are reference to the Order, will in same case.
END //
DELIMITER ;


-- Running on Linux ubuntu (mysql)

-- Verify the Orders record for customer 1
/*
mysql> select COUNT(*) AS Record_For_Customer_1 from Orders INNER JOIN Sale ON Orders.order_id = Sale.order_id WHERE customer_id = 1;

+-----------------------+
| Record_For_Customer_1 |
+-----------------------+
|                     4 |
+-----------------------+
1 row in set (0.00 sec)
*/

-- Create procedure and call
/*
mysql> DELIMITER //
mysql> CREATE PROCEDURE deleteCustomer(
    ->     IN p_customer_id INT
    -> )
    -> COMMENT 'Deleting a customer and maintaining the integrity to the entity relationship'
    -> BEGIN
    ->     -- Delete customer
    ->     DELETE FROM Customer
    ->         WHERE customer_id = p_customer_id;
    -> 
    ->     -- Bonus part implemented inside p1.sql
    ->     -- ON DELETE CASCADE added a rule to the table, when the customer record deleted, the record in Orders where it reference to this customer will also be deleted. 
    ->     -- Sale record that are reference to the Order, will in same case.
    -> END //
Query OK, 0 rows affected (0.08 sec)

mysql> DELIMITER ;
mysql> call deleteCustomer(1);
Query OK, 1 row affected (0.05 sec)
*/

-- verify Order record to the customer
/*
mysql> select COUNT(*) AS Record_For_Customer_1 from Orders INNER JOIN Sale ON Orders.order_id = Sale.order_id WHERE customer_id = 1; 
+-----------------------+
| Record_For_Customer_1 |
+-----------------------+
|                     0 |
+-----------------------+
1 row in set (0.01 sec)
*/
