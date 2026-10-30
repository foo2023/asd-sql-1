-- Problem 8 - Query Performance Optimization

-- Since, I make the department as a seperate entity with foreign key assign to Employee, the 'dept_code' was indexed automatically in mysql
-- can check with this command
show index from Employee;

-- dept_code was there.

-- But, the scenario was given composite (two) queries (department & salary)

-- The previous indexing cannot be use in this scenario
-- Create a composite index
CREATE INDEX idx_emp_dept_salary ON Employee(dept_code, salary);

EXPLAIN SELECT * FROM Employee JOIN Department
    ON Employee.dept_code = Department.dept_code
WHERE Department.dept_name LIKE '%Sales%' AND salary > 50000;