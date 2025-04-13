create database task10;
use task10;
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(20),
    Address TEXT
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Description TEXT,
    Price DECIMAL(10,2) NOT NULL,
    Stock INT NOT NULL,
    Category VARCHAR(50)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    OrderDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);



INSERT INTO Customers (Name, Email, Phone, Address) VALUES
('Phil Dunphy', 'phil@modernfamily.com', '1112223333', '123 Dunphy Lane'),
('Claire Dunphy', 'claire@modernfamily.com', '2223334444', '123 Dunphy Lane'),
('Jay Pritchett', 'jay@modernfamily.com', '3334445555', '456 Pritchett Blvd'),
('Gloria Pritchett', 'gloria@modernfamily.com', '4445556666', '456 Pritchett Blvd'),
('Mitchell Pritchett', 'mitchell@modernfamily.com', '5556667777', '789 Pritchett Ave'),
('Cameron Tucker', 'cameron@modernfamily.com', '6667778888', '789 Pritchett Ave');

INSERT INTO Products (Name, Description, Price, Stock, Category) VALUES
('Magic iPad', 'Phil’s favorite gadget for tech tricks and real estate demos', 999.99, 5, 'Electronics'),
('Closet Organizer Pro', 'Claire’s must-have for keeping everything in its place', 59.99, 20, 'Home & Living'),
('Colombian Coffee Set', 'Authentic coffee kit from Gloria’s homeland', 39.99, 25, 'Kitchen'),
('Dog Tuxedo', 'Lily’s stylish outfit for Stella the dog', 29.99, 10, 'Pets'),
('Bowtie Bundle', 'Cam’s favorite accessory pack — vibrant & floral', 19.99, 30, 'Fashion'),
('Vintage Record Player', 'Jay’s classic music player for his man cave', 150.00, 7, 'Electronics'),
('Rainbow Cupcake Kit', 'Lily and Cam’s favorite baking fun-time activity', 24.99, 15, 'Hobbies');

EXPLAIN SELECT * FROM Products WHERE Category= 'Electronics';

create index i_product on Products (Category);

EXPLAIN SELECT * FROM Products WHERE Category= 'Electronics';

delimiter &&
create trigger alter_stocks_after_orders
after insert on OrderDetails
for each row
begin
	update Products
	set Stock = Stock - new.Quantity
	where ProductID = new.ProductID;
end;
&&
delimiter ;

show triggers;

delimiter &&
create trigger trigger_calc_order_total
after insert on OrderDetails
for each row
BEGIN
    UPDATE Orders
    SET TotalAmount = (
        SELECT SUM(Quantity * Price)
        FROM OrderDetails
        WHERE OrderID = NEW.OrderID
    )
    WHERE OrderID = NEW.OrderID;
END;
&&

delimiter ;

show triggers;

select * from products;

start transaction;

insert into orders(CustomerID, TotalAmount) values
(1, 0.00);

set  @oid = last_insert_id();

insert into orderdetails(orderid, productid, quantity, price)
values
(@oid, 1,1,999.99),
(@oid, 6,2,150.00);

commit;


start transaction;

insert into orders(CustomerID, TotalAmount) values
(1, 0.00);

set  @oid = last_insert_id();

insert into orderdetails(orderid, productid, quantity, price)
values
(@oid, 2,1,59.99),
(@oid, 3,2,39.99);

commit;