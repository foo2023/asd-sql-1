-- Problem 6 - Retrieve Employees with High Salary
-- With bonus implemented

SELECT Emp_Name, Position, Salary
FROM Employee
WHERE salary > 50000.00
ORDER BY salary DESC; -- order by higher salary to lower salary


/* 
In Linux ubuntu (mysql)

mysql> SELECT Emp_Name, Position, Salary
    -> FROM Employee
    -> WHERE salary > 50000.00
    -> ORDER BY salary DESC; -- order by higher salary to lower salary
+--------------+-------------------+----------+
| Emp_Name     | Position          | Salary   |
+--------------+-------------------+----------+
| Ava Martinez | Finance Manager   | 90000.00 |
| Sophia Tan   | Software Engineer | 85000.00 |
| John Carter  | Sales Manager     | 72000.00 |
| Peter Nguyen | Sales Executive   | 72000.00 |
| Liam Patel   | Software Engineer | 65000.00 |
| Noah Kim     | Accountant        | 58000.00 |
+--------------+-------------------+----------+
6 rows in set (0.00 sec)
*/


-- Bonus
SELECT Emp_Name, Position, Salary
FROM Employee
ORDER BY salary DESC -- order from higher salary to lower salary
LIMIT 3; -- top 3


/* Bonus:
In Linux ubuntu (mysql)

mysql> SELECT Emp_Name, Position, Salary
    -> FROM Employee
    -> ORDER BY salary DESC -- order from higher salary to lower salary
    -> LIMIT 3; -- top 3
+--------------+-------------------+----------+
| Emp_Name     | Position          | Salary   |
+--------------+-------------------+----------+
| Ava Martinez | Finance Manager   | 90000.00 |
| Sophia Tan   | Software Engineer | 85000.00 |
| John Carter  | Sales Manager     | 72000.00 |
+--------------+-------------------+----------+
3 rows in set (0.01 sec)

*/