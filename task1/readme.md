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

<br>
![image](https://github.com/user-attachments/assets/51303309-19c6-41f5-a4d0-ca85e601275a)

<br>
![image](https://github.com/user-attachments/assets/b8aaf5df-0b3a-4854-be11-02ff2f2898de)

<br>
![image](https://github.com/user-attachments/assets/f897abaf-3ef2-499e-bcf6-bd72596f5ce2)

<br>
![image](https://github.com/user-attachments/assets/e34a90ff-fc73-4b1a-b84d-26bdc9f1e342)

<br>
![image](https://github.com/user-attachments/assets/55439f84-a2d4-4caf-acfa-32cdf69443d6)

