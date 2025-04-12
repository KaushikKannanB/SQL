## 🆚 Stored Procedures vs Functions

| Feature                        | **Stored Procedure**                                           | **User-Defined Function (UDF)**                              |
|-------------------------------|----------------------------------------------------------------|---------------------------------------------------------------|
| **Purpose**                    | Perform operations or business logic                           | Return a computed value                                       |
| **Returns**                    | Zero, one, or multiple result sets                             | One **scalar value** only                                     |
| **Can Modify Data?**          | ✅ Yes (INSERT, UPDATE, DELETE)                                 | ❌ No (Read-only)                                              |
| **Can Use Transactions?**     | ✅ Yes                                                         | ❌ No                                                          |
| **Call Syntax**               | `CALL procedure_name(...)`                                     | Used **within queries**, like `SELECT function_name(...)`     |
| **Usage in SELECT**           | ❌ Not used in `SELECT`                                        | ✅ Can be used in `SELECT`, `WHERE`, `ORDER BY`, etc.         |
| **Flexibility**               | High – allows conditions, loops, cursors                       | Limited – pure logic & read-only queries                      |
| **Use Case Example**          | Generate reports, update stock levels                         | Calculate discounts, bonuses, or derived values               |

---

## 🧱 Syntax

### 🔧 Stored Procedure

```sql
DELIMITER $$

CREATE PROCEDURE procedure_name (
    IN param1 datatype,
    IN param2 datatype
)
BEGIN
    -- SQL statements
END $$

DELIMITER ;
```

#### Example: Get Total Sales Between Dates

```sql
DELIMITER $$

CREATE PROCEDURE GetTotalSales (
    IN start_date DATE,
    IN end_date DATE
)
BEGIN
    SELECT SUM(total_amount) AS total_sales
    FROM orders
    WHERE order_date BETWEEN start_date AND end_date;
END $$

DELIMITER ;
```

#### Call It

```sql
CALL GetTotalSales('2024-01-01', '2024-03-01');
```

---

### 🧮 User-Defined Function (UDF)

```sql
DELIMITER $$

CREATE FUNCTION function_name (
    param1 datatype,
    param2 datatype
)
RETURNS return_type
DETERMINISTIC
BEGIN
    -- logic
    RETURN value;
END $$

DELIMITER ;
```

#### Example: Calculate Discount

```sql
DELIMITER $$

CREATE FUNCTION CalculateDiscount (
    original_price DECIMAL(10,2),
    discount_percent DECIMAL(5,2)
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN original_price - (original_price * discount_percent / 100);
END $$

DELIMITER ;
```

#### Use in Query

```sql
SELECT order_id, total_amount,
       CalculateDiscount(total_amount, 10) AS discounted_price
FROM orders;
```

---

## 🔍 DETERMINISTIC vs NOT DETERMINISTIC

| Keyword              | Meaning                                                                 |
|----------------------|-------------------------------------------------------------------------|
| `DETERMINISTIC`      | Always returns the **same output** for the same input values            |
| `NOT DETERMINISTIC`  | May return **different outputs** for the same input (e.g. uses `NOW()`) |

### Example

```sql
-- DETERMINISTIC
CREATE FUNCTION Square(x INT) RETURNS INT DETERMINISTIC
BEGIN
    RETURN x * x;
END;

-- NOT DETERMINISTIC
CREATE FUNCTION GetCurrentYear() RETURNS INT NOT DETERMINISTIC
BEGIN
    RETURN YEAR(NOW());
END;
```

---

## 🔁 Editing Stored Procedures or Functions

> ❌ **You cannot directly edit** a stored procedure or function in MySQL.

### ✅ Correct Approach:

1. Drop the existing one:
   ```sql
   DROP PROCEDURE IF EXISTS procedure_name;
   DROP FUNCTION IF EXISTS function_name;
   ```

2. Recreate it with changes:
   ```sql
   CREATE PROCEDURE ... -- or FUNCTION ...
   ```

### 📤 View Existing Definition:

```sql
SHOW CREATE PROCEDURE procedure_name;
SHOW CREATE FUNCTION function_name;
```

---

## ✨ DELIMITER Explained

- `DELIMITER` changes the symbol used to **mark the end of SQL blocks** (temporarily).
- Used when creating procedures/functions to avoid premature termination from `;`.

### Example:

```sql
DELIMITER $$

CREATE PROCEDURE SampleProc()
BEGIN
    SELECT 'Hello, world!';
END $$

DELIMITER ;
```

You can use other delimiters like `//`, `%%`, etc., but remember to reset it to `;`.


---

## 📌 Using Functions in SELECT

```sql
SELECT get_average_amount('2024-03-01', '2024-03-05');
```

✅ This returns **one value**.

```sql
SELECT get_average_amount('2024-03-01', '2024-03-05') FROM orders;
```

❌ This returns the **same value on every row**, once per row in `orders`, which is usually not intended.

---

## 🧠 Final Takeaways

- Use **procedures** for logic, multiple steps, or data manipulation.
- Use **functions** when you want to calculate and return **one value**.
- Always use `DETERMINISTIC` if the function’s output doesn’t vary with time or randomness.
- You must **drop and recreate** to modify stored procedures/functions.
- Keep your code in `.sql` files for versioning and easy edits.

