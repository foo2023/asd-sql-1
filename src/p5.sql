-- Problem 5 - Department Statistics

SELECT 
    dept.dept_name AS Department,
    AVG(emp.salary) AS Average_Salary 
FROM Department AS dept
LEFT OUTER JOIN Employee AS emp
    ON emp.dept_code = dept.dept_code -- join the table with dept_code
GROUP BY dept.dept_code -- GROUP the merge table follow (dept_code)
    ORDER BY AVG(emp.salary) DESC; -- sort from higher average salary (department)


/*
In Linux ubuntu (mysql)
mysql> SELECT 
    ->     dept.dept_name AS Department,
    ->     AVG(emp.salary) AS Average_Salary 
    -> FROM Department AS dept
    -> LEFT OUTER JOIN Employee AS emp
    ->     ON emp.dept_code = dept.dept_code -- join the table with dept_code
    -> GROUP BY dept.dept_code -- GROUP the merge table follow (dept_code)
    ->     ORDER BY AVG(emp.salary) DESC; -- sort from higher average salary (department)
+-------------+----------------+
| Department  | Average_Salary |
+-------------+----------------+
| Engineering |   75000.000000 |
| Finance     |   74000.000000 |
| Sales       |   64000.000000 |
| HR          |   45000.000000 |
+-------------+----------------+
4 rows in set (0.01 sec)

*/