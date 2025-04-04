use kongu;
show tables;
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2)
);

INSERT INTO Customers (customer_id, name, email) VALUES
(1, 'John Doe', 'john@example.com'),
(2, 'Jane Smith', 'jane@example.com'),
(3, 'Mike Johnson', 'mike@example.com');

INSERT INTO Orders (order_id, customer_id, order_date, total_amount) VALUES
(101, 1, '2024-03-01', 250.50),
(102, 2, '2024-03-05', 100.00),
(103, 1, '2024-03-07', 75.75),
(104, 3, '2024-03-10', 200.00);

INSERT INTO Orders (order_id, customer_id, order_date, total_amount) VALUES
(105, 4, '2024-03-01', 250.50),
(106, 5, '2024-03-05', 100.00);

INSERT INTO Customers (customer_id, name, email) VALUES
(6, 'Nelson Mandela', 'nellie@example.com');

select c.customer_id, o.order_id from Customers c inner join Orders o on c.customer_id=o.customer_id;

select c.customer_id, o.order_id from Customers c left join Orders o on c.customer_id=o.customer_id;

select c.customer_id, o.order_id from Customers c right join Orders o on c.customer_id=o.customer_id;
