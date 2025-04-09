## 1. Understanding DDL vs. DML Commands
### **DDL (Data Definition Language)**
- These commands define the structure of the database and tables.
- Examples:
  - `CREATE DATABASE` (Creates a new database)
  - `CREATE TABLE` (Defines a table structure)

### **DML (Data Manipulation Language)**
- These commands interact with the data stored in tables.
- Examples:
  - `INSERT INTO` (Adds records to a table)
  - `SELECT` (Retrieves records from a table)

---

## 2. Database Hierarchy
- **Database (`kongu`)** → Contains multiple **tables**
- **Table (`aids`)** → Stores multiple **rows (records)**
- **Row** → Represents a single record with multiple columns

Example:
```
Database: kongu
└── Table: aids
    ├── Row 1: (20, 'Kaushik', 22, 90)
    ├── Row 2: (…)
```

---

## 3. Syntax for All Commands Used

### **Creating a Database**
```sql
CREATE DATABASE kongu;
```
- Creates a new database named `kongu`.

### **Selecting the Database**
```sql
USE kongu;
```
- Switches the active database to `kongu`.

### **Creating a Table**
```sql
CREATE TABLE aids(rno INT KEY, name VARCHAR(50), age INT, marks INT);
```
- Defines the `aids` table with four columns.

### **Inserting Data**
```sql
INSERT INTO aids(rno, name, age, marks) VALUES (20, 'Kaushik', 22, 90);
```
- Adds a new record to the `aids` table.

### **Retrieving Data**
```sql
SELECT * FROM aids;
```
- Fetches all records from the `aids` table.

---
![image](https://github.com/user-attachments/assets/e63b4b9e-c643-4a1f-9d07-ba938b34a9d5)
![image](https://github.com/user-attachments/assets/ace1d015-cd22-45d4-ad0a-a664311edbbe)
![image](https://github.com/user-attachments/assets/8a4a7d65-f569-4d9c-8e64-32495a106e65)
![image](https://github.com/user-attachments/assets/b7d727d5-4e4b-45a4-81de-eff9edf770b8)
![image](https://github.com/user-attachments/assets/79b61f95-5ed5-4dc1-9096-6a0195ca4f82)
