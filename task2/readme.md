## Key Learnings
## Example Table: `aids`
We will use the following `aids` table from the `kongu` database for demonstration:

### Table Structure:
| rno | name    | age | marks |
|-----|--------|-----|-------|
| 1   | Arun   | 21  | 85    |
| 2   | Bala   | 22  | 78    |
| 3   | Charan | 23  | 92    |
| ... | ...    | ... | ...   |
| 50  | Yash   | 21  | 87    |

### Sample Data Insertion:
```sql
USE kongu;
INSERT INTO aids (rno, name, age, marks) VALUES
(1, 'Arun', 21, 85),
(2, 'Bala', 22, 78),
(3, 'Charan', 23, 92),
(4, 'Divya', 22, 88),
(5, 'Elan', 21, 75),
(6, 'Farhan', 23, 90),
(7, 'Geetha', 22, 87),
(8, 'Hari', 21, 81),
(9, 'Ishaan', 22, 89),
(10, 'Jaya', 23, 93);
```
(Only a subset of the records is shown for brevity.)

---

## Filtering Data with `WHERE`
Filtering in SQL is primarily done using the `WHERE` clause to select only those rows that satisfy a given condition.

### Syntax:
```sql
SELECT column1, column2, ...
FROM table_name
WHERE condition;
```

### Example:
```sql
SELECT * FROM aids WHERE marks > 90;
```

### Common Filtering Operators:
| Operator | Description |
|----------|-------------|
| `=`      | Equal to |
| `<>` or `!=` | Not equal to |
| `>`      | Greater than |
| `<`      | Less than |
| `>=`     | Greater than or equal to |
| `<=`     | Less than or equal to |
| `BETWEEN` | Range check (inclusive) |
| `LIKE`   | Pattern matching |
| `IN`     | Checks if value exists in a list |
| `IS NULL` | Checks for NULL values |

### Example Queries:
```sql
SELECT * FROM aids WHERE age = 22;
SELECT * FROM aids WHERE marks BETWEEN 80 AND 90;
SELECT * FROM aids WHERE name LIKE 'A%';
SELECT * FROM aids WHERE age IN (21, 23);
```

---

## Sorting Data with `ORDER BY`
Sorting in SQL is done using the `ORDER BY` clause, which arranges the result set in ascending (`ASC`) or descending (`DESC`) order.

### Syntax:
```sql
SELECT column1, column2, ...
FROM table_name
ORDER BY column1 [ASC|DESC];
```

### Example:
```sql
SELECT name, marks FROM aids WHERE marks > 90 ORDER BY marks, age ASC;
```

---

## Logical Operators in SQL
Logical operators are used in SQL to combine multiple conditions in a `WHERE` clause.

### Logical Operators:
| Operator | Description |
|----------|-------------|
| `AND`    | Returns TRUE if all conditions are true |
| `OR`     | Returns TRUE if at least one condition is true |
| `NOT`    | Negates a condition |

### Example Queries:
```sql
SELECT * FROM aids WHERE age = 22 AND marks > 85;
SELECT * FROM aids WHERE age = 21 OR marks > 90;
SELECT * FROM aids WHERE NOT age = 23;
```

---

## Combining Filtering, Sorting, and Logical Operators
SQL queries can combine filtering, sorting, and logical operators for more advanced data retrieval.

### Example Query:
```sql
SELECT name, marks FROM aids
WHERE (age = 22 OR age = 23)
AND marks > 85
ORDER BY marks DESC;
```

---
![image](https://github.com/user-attachments/assets/cb74dd9e-1e8d-4f1e-9a6d-700a191efaad)
![image](https://github.com/user-attachments/assets/1043317e-27e0-4d8e-8007-4003ae6c74e7)
![image](https://github.com/user-attachments/assets/769eda68-caf4-4a5c-9266-462bfd1185e7)

