# Documentation

This project has SQL files for 8 problems. All files are in the `src` folder.

## Environment

- Database: MySQL
- Operating system: Ubuntu 26.04 LTS
- Virtual machine: Oracle VirtualBox
- Host computer: Windows 11

## How to Run

1. Open the terminal in Ubuntu.
2. Log in to MySQL:

   ```
   mysql -u root -p
   ```

3. Create and choose a database:

   ```
   CREATE DATABASE asd_sql;
   USE asd_sql;
   ```

4. Run `p1.sql` first. It creates the tables and the dummy data.

   ```
   source /path/to/src/p1.sql
   ```

5. Run the other files in the same way, one by one.

## Tables

| Table | What it stores |
|---|---|
| Department | Department name and code |
| Employee | Employee name, position, salary and department |
| Inventory | Product name, quantity and price |
| Customer | Customer name and city |
| Orders | Orders made by customers |
| Sale | Products sold in each order |

## Files

| File | Problem | What it does |
|---|---|---|
| `p1.sql` | 1 | Creates the tables and adds dummy data |
| `p2.sql` | 2 | Shows customers from New York and their order dates |
| `p3.sql` | 3 | Shows the total and average quantity sold for each order |
| `p4.sql` | 4 | Procedure `updatePricing` to change the price of a product |
| `p5.sql` | 5 | Shows the average salary of each department |
| `p6.sql` | 6 | Shows employees with salary above 50000 and the top 3 salaries (bonus) |
| `p7.sql` | 7 | Procedure `deleteCustomer` to delete a customer |
| `p8.sql` | 8 | Creates a composite index to make a query faster |

## Notes

- **Procedures (p4, p7):** A procedure can be called many times. We do not need to type the query again.
  - `CALL updatePricing(1, 1300.00);`
  - `CALL deleteCustomer(1);`
- **ON DELETE CASCADE (p1, p7):** When a customer is deleted, the orders of that customer are deleted too. The sales of those orders are deleted as well.
- **Index (p8):** The index on `Employee(dept_code, salary)` helps when we search by department and salary together.
