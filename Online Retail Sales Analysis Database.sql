CREATE DATABASE virtusa;
USE virtusa;
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50)
);
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
CREATE TABLE Order_Items (
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
show tables
INSERT INTO Customers VALUES (1, 'Ravi', 'Hyderabad');

INSERT INTO Customers VALUES
(2, 'Madhavi', 'Chennai'),
(3, 'Sunny', 'Bangalore'),
(4, 'Abhishek', 'Mumbai'),
(5, 'Teja', 'Hyderabad'),
(6, 'Cherry', 'Vijayawada'),
(7, 'Deepu', 'Delhi'),
(8, 'Manisha', 'Pune');
select * from customers;

INSERT INTO Orders VALUES
(1, 1, '2026-04-01'),
(2, 2, '2026-04-02'),
(3, 3, '2026-04-03'),
(4, 1, '2026-04-04'),
(5, 4, '2026-04-05');

INSERT INTO Order_Items VALUES 
(1, 1, 1),
(1, 2, 1),
(2, 3, 2),
(3, 1, 1),
(4, 2, 1);

select * from orders, order_items

-- top selling  products

SELECT p.name, SUM(oi.quantity)
FROM Products p, Order_Items oi
WHERE p.product_id = oi.product_id
GROUP BY p.name
LIMIT 1;
-- Most Valuable Customers

SELECT c.name, SUM(p.price * oi.quantity) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
GROUP BY c.name
ORDER BY total_spent DESC
limit 1;


-- Monthly Revenue
SELECT MONTH(o.date) AS month, SUM(p.price * oi.quantity) AS revenue
FROM Orders o
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
GROUP BY MONTH(o.date);

-- Category-wise Sales
SELECT category, SUM(price * quantity) AS revenue
FROM Products
JOIN Order_Items USING(product_id)
GROUP BY category;

-- Inactive Customers
SELECT name
FROM Customers
WHERE customer_id NOT IN (
    SELECT customer_id FROM Orders
);



