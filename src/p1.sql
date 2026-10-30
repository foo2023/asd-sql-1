-- For simplicity purpose, the design did not follow normal form procedure.
-- Target: MySQL. Tables are created in dependency order so every foreign key
-- points at a table that already exists.

-- Split Department as a seperate table
-- To reduce redundancy on Employee table
CREATE TABLE Department (
    dept_code INT PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL
);

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(255) NOT NULL,
    position VARCHAR(100),
    dept_code INT,
    salary DECIMAL(10, 2),
    FOREIGN KEY (dept_code) REFERENCES Department(dept_code)
);

CREATE TABLE Inventory (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) -- up to 99,999,999.99
);

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(80),
    city VARCHAR(40)
);

-- keep reference to customer_id in the order table only
-- "Order" is a reserved word in MySQL, so the table is named Orders
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    order_date DATE NOT NULL,
    customer_id INT NOT NULL,
    total_amount DECIMAL (10,2),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
        ON DELETE CASCADE -- when customer delete, record will be delete automatically
);

-- Customer ID can reference to Orders table.
-- because order_id is unique identify to customer and every purchases they have made.
CREATE TABLE Sale (
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    sale_date DATE NOT NULL,
    PRIMARY KEY (order_id, product_id), -- composite PK
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
        ON DELETE CASCADE, -- when record in order delete, record here will also delete
    FOREIGN KEY (product_id) REFERENCES Inventory(product_id)
);

-- Dummy data, inserted parents first so foreign keys are satisfied.
INSERT INTO Department (dept_code, dept_name) VALUES
    (10, 'Sales'),
    (20, 'Engineering'),
    (30, 'HR'),
    (40, 'Finance');

INSERT INTO Employee (emp_id, emp_name, position, dept_code, salary) VALUES
    (1, 'John Carter',   'Sales Manager',     10, 72000.00),
    (2, 'Mary Adams',    'Sales Executive',   10, 48000.00),
    (3, 'Peter Nguyen',  'Sales Executive',   10, 72000.00), -- ties with John for highest in Sales
    (4, 'Sophia Tan',    'Software Engineer', 20, 85000.00),
    (5, 'Liam Patel',    'Software Engineer', 20, 65000.00),
    (6, 'Olivia Chen',   'HR Officer',        30, 45000.00),
    (7, 'Noah Kim',      'Accountant',        40, 58000.00),
    (8, 'Ava Martinez',  'Finance Manager',   40, 90000.00);

INSERT INTO Inventory (product_id, product_name, quantity, price) VALUES
    (1, 'Laptop',   50, 1200.00),
    (2, 'Mouse',   200,   25.50),
    (3, 'Keyboard',120,   75.00),
    (4, 'Monitor',  80,  300.00),
    (5, 'Headset', 150,   60.00);

INSERT INTO Customer (customer_id, customer_name, city) VALUES
    (1, 'Alice Johnson', 'New York'),
    (2, 'Bob Smith',     'Los Angeles'),
    (3, 'Carol Lee',     'New York'),
    (4, 'David Brown',   'Chicago'),
    (5, 'Emma Wilson',   'Houston');

-- total_amount equals the sum of quantity * price of the matching Sale rows
INSERT INTO Orders (order_id, order_date, customer_id, total_amount) VALUES
    (101, '2026-01-05', 1, 1251.00),
    (102, '2026-01-12', 2,  600.00),
    (103, '2026-02-03', 3,  135.00),
    (104, '2026-02-14', 1,  450.00),
    (105, '2026-03-01', 4,  102.00),
    (106, '2026-03-20', 5, 1320.00),
    (107, '2026-04-02', 3,  325.50);

INSERT INTO Sale (order_id, product_id, quantity, sale_date) VALUES
    (101, 1, 1, '2026-01-05'),
    (101, 2, 2, '2026-01-05'),
    (102, 4, 2, '2026-01-12'),
    (103, 3, 1, '2026-02-03'),
    (103, 5, 1, '2026-02-03'),
    (104, 4, 1, '2026-02-14'),
    (104, 3, 2, '2026-02-14'),
    (105, 2, 4, '2026-03-01'),
    (106, 1, 1, '2026-03-20'),
    (106, 5, 2, '2026-03-20'),
    (107, 2, 1, '2026-04-02'),
    (107, 4, 1, '2026-04-02');
