-- Procedure is suitable for this type of task, can repeating without typing the query again and again.
DELIMITER //
CREATE PROCEDURE updatePricing(
    IN p_product_id INT,
    IN p_new_price DECIMAL(10,2)
) -- recieve two parameters (product_id & new price)
BEGIN
    UPDATE Inventory AS i
         SET i.price = p_new_price
    WHERE i.product_id = p_product_id;

END //
DELIMITER ;

/*
mysql> DELIMITER //
mysql> CREATE PROCEDURE updatePricing(
    ->     IN p_product_id INT,
    ->     IN p_new_price DECIMAL(10,2)
    -> )
    -> BEGIN
    ->     UPDATE Inventory AS i
    ->          SET i.price = p_new_price
    ->     WHERE i.product_id = p_product_id;
    -> 
    -> END //
Query OK, 0 rows affected (0.10 sec)

mysql> DELIMITER ;
mysql> select * from Inventory;
+------------+--------------+----------+---------+
| product_id | product_name | quantity | price   |
+------------+--------------+----------+---------+
|          1 | Laptop       |       50 | 1200.00 |
|          2 | Mouse        |      200 |   25.50 |
|          3 | Keyboard     |      120 |   75.00 |
|          4 | Monitor      |       80 |  300.00 |
|          5 | Headset      |      150 |   60.00 |
+------------+--------------+----------+---------+
5 rows in set (0.03 sec)

mysql> call updatePricing(1, 1300.00)
    -> ;
Query OK, 1 row affected (0.04 sec)

mysql> select * from Inventory;
+------------+--------------+----------+---------+
| product_id | product_name | quantity | price   |
+------------+--------------+----------+---------+
|          1 | Laptop       |       50 | 1300.00 |
|          2 | Mouse        |      200 |   25.50 |
|          3 | Keyboard     |      120 |   75.00 |
|          4 | Monitor      |       80 |  300.00 |
|          5 | Headset      |      150 |   60.00 |
+------------+--------------+----------+---------+
5 rows in set (0.01 sec)
*/