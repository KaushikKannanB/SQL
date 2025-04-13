## Indexing in SQL

**Indexing** is a database optimization technique used to speed up the retrieval of rows from a database table. It creates an index on one or more columns, allowing the database to find rows faster.

### Example of Creating an Index:
```sql
CREATE INDEX idx_product_name ON Products(Name);
```

### Types of Indexes:
- **Unique Indexes**: Ensures all values in the indexed column(s) are unique.
- **Full-text Indexes**: Used for text searching.
- **Composite Indexes**: An index on multiple columns.

### Benefits:
- Speed up query performance.
- Reduce the cost of searching for rows.

---


## Before index
![Screenshot 2025-04-14 012347](https://github.com/user-attachments/assets/86dbb5a2-5eec-4b6b-b330-d405b9e54ae9)

## After index
![Screenshot 2025-04-14 012448](https://github.com/user-attachments/assets/8733528b-6cd4-42cc-b98d-3e1ac29b088a)


---
## Normalization in SQL

**Normalization** is the process of organizing a database to reduce redundancy and dependency by dividing large tables into smaller ones and defining relationships between them. The goal is to eliminate data anomalies and improve data integrity.

### Normal Forms:
1. **First Normal Form (1NF)**: Eliminate repeating groups.
2. **Second Normal Form (2NF)**: Remove partial dependencies.
3. **Third Normal Form (3NF)**: Eliminate transitive dependencies.
4. Higher Normal Forms (BCNF, 4NF, etc.) for more advanced normalization.

---

## Triggers in SQL

**Triggers** are automatic actions invoked by the database in response to certain events such as `INSERT`, `UPDATE`, or `DELETE` on a table.

### Creating a Trigger:
```sql
CREATE TRIGGER log_price_change
AFTER UPDATE ON Products
FOR EACH ROW
BEGIN
    -- Log price change in a log table
    INSERT INTO PriceChangeLog(ProductID, OldPrice, NewPrice, ChangeDate)
    VALUES (OLD.ProductID, OLD.Price, NEW.Price, NOW());
END;
```

### Benefits:
- Automate actions like logging, validation, or enforcing business rules.
- They are triggered automatically by data changes.

### Limitations:
- Triggers cannot manage transactions (like `START TRANSACTION` or `COMMIT`).
- They run within the transaction context and cannot handle errors in the same way as explicit transaction blocks.

---

## Transactions in SQL

A **transaction** is a sequence of one or more SQL statements that execute as a single unit of work. Either all statements in a transaction are committed, or none are.

### Key Properties (ACID):
- **Atomicity**: All or nothing.
- **Consistency**: Ensures valid data.
- **Isolation**: Ensures data integrity when multiple transactions run concurrently.
- **Durability**: Once committed, the changes are permanent.

### Example of Using Transactions:
```sql
START TRANSACTION;

-- Step 1: Insert a new order for CustomerID 1
INSERT INTO Orders (CustomerID, TotalAmount)
VALUES (1, 0.00);

-- Step 2: Capture the generated OrderID
SET @OrderID = LAST_INSERT_ID();

-- Step 3: Insert OrderDetails for that OrderID
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price)
VALUES (@OrderID, 1, 1, 999.99), (@OrderID, 6, 1, 150.00);

-- Step 4: Update the total amount in Orders
UPDATE Orders
SET TotalAmount = (SELECT SUM(Quantity * Price) FROM OrderDetails WHERE OrderID = @OrderID)
WHERE OrderID = @OrderID;

-- Step 5: Commit the transaction
COMMIT;
```

### Benefits:
- Ensure that all steps are successful, or rollback changes if anything goes wrong.
- Perfect for complex operations involving multiple tables.

---

## Combining Transactions and Triggers

Although **transactions** and **triggers** solve different problems, they can be used together to ensure data integrity and automate repetitive tasks.

### Example:
1. **Transaction** to insert a new order and order details.
2. **Trigger** to automatically calculate the total amount in the `Orders` table whenever new order details are inserted.


## Best Practices and Examples

- **Use indexes** to speed up queries but avoid over-indexing as it can slow down `INSERT` operations.
- **Normalize** your database to reduce redundancy and maintain data integrity.
- **Use transactions** for multi-step operations, ensuring that either all steps are completed or none are.
- **Use triggers** for automatically maintaining business rules, like logging changes or enforcing constraints.
- Always **handle exceptions** and **rollback transactions** if any part of a transaction fails.

---


## After Transaction 1 and before Transaction 2
![Screenshot 2025-04-14 022923](https://github.com/user-attachments/assets/deba157f-f1c9-4f62-a602-f1ed586a6917)

![Screenshot 2025-04-14 022941](https://github.com/user-attachments/assets/eb881690-1eda-4fb7-b8b6-25e48189ad54)

![Screenshot 2025-04-14 023004](https://github.com/user-attachments/assets/e8ad0e51-5bb9-4687-a0f6-b841e52fc39a)


## After Transaction 2
![Screenshot 2025-04-14 023043](https://github.com/user-attachments/assets/3d5f5433-3eb9-40e8-bb3c-de3184026003)

![Screenshot 2025-04-14 023115](https://github.com/user-attachments/assets/4aba8489-e06a-409f-a64b-96eb7c28f899)

![Screenshot 2025-04-14 023142](https://github.com/user-attachments/assets/14297dca-c8c9-48a8-91aa-df4e886ee4b6)

---

You can copy-paste this directly into a `README.md` file and use it for reference or share it as part of your project! It covers everything you've learned, from **indexing** and **normalization** to **transactions** and **triggers**.
