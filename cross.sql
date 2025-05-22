-- Active: 1747422770417@@127.0.0.1@5432@test_db1

-- Creating employees table
CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(50),
    dept_id INT
);

-- Creating departments table
CREATE TABLE departments (
    dept_id INT,
    dept_name VARCHAR(50)
);

-- Inserting sample data into employees
INSERT INTO employees VALUES (1, 'John Doe', 101);
INSERT INTO employees VALUES (2, 'Jane Smith', 102);

-- Inserting sample data into departments
INSERT INTO departments VALUES (101, 'Human Resources');
INSERT INTO departments VALUES (102, 'Marketing');

-- Checking data
SELECT * FROM employees;
SELECT * FROM departments;

-- ==========================
-- CROSS JOIN Explanation:
-- ==========================
-- Cross Join দুইটা টেবিলের প্রতিটা রো একে অপরের সাথে মিলায়,
-- মানে: employees টেবিলের প্রতিটা রো departments-এর প্রতিটা রোর সাথে জোড়া লাগবে।
-- যদি employees টেবিলে 2 টা রো থাকে, আর departments টেবিলে 2 টা রো থাকে,
-- তাহলে result এ 2 × 2 = 4 টা রো আসবে।
-- এটা কোন column match করে না, সবার সাথে সবাই।
SELECT * FROM employees
CROSS JOIN departments;

-- ==========================
-- NATURAL JOIN Explanation:
-- ==========================
-- Natural Join দুইটা টেবিলের common column name অনুযায়ী match করে,
-- এখানে common column হলো: dept_id
-- মানে যেই rows গুলোর dept_id employees আর departments দুই টেবিলে একই,
-- শুধু সেই মিল থাকা rows গুলোই result এ আসবে।
-- result এ dept_id একবারই থাকবে, কারণ ওটা common field।
SELECT * FROM employees
NATURAL JOIN departments;
