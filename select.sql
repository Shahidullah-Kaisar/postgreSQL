-- Active: 1747422770417@@127.0.0.1@5432@test_db1


CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    age INT,
    grade CHAR(2),
    course VARCHAR(50),
    email VARCHAR(100),
    dob DATE,
    blood_group VARCHAR(5),
    country VARCHAR(50)
);


INSERT INTO students (
    first_name, last_name, age, grade, course, email, dob, blood_group, country
) VALUES
('Sajib', 'Hossain', 22, 'A+', 'Computer Science', 'sajib@example.com', '2003-05-12', 'O+', 'Bangladesh'),
('Rafi', 'Ahmed', 21, 'B+', 'Physics', 'rafi@example.com', '2004-03-22', 'A+', 'Bangladesh'),
('Nila', 'Sarker', 20, 'A', 'Mathematics', 'nila@example.com', '2005-07-18', 'B-', 'India'),
('Tariq', 'Rahman', 23, 'B', 'Biology', 'tariq@example.com', '2002-11-05', 'AB+', 'Pakistan'),
('Fahim', 'Islam', 22, 'C+', 'Chemistry', 'fahim@example.com', '2003-01-30', 'O-', 'Bangladesh'),
('Joya', 'Mitra', 21, 'A-', 'English Literature', 'joya@example.com', '2004-06-15', 'A-', 'Nepal'),
('Joya', 'Mitra', 21, 'A-', 'English Literature',NULL, '2004-06-15', 'A-', 'Nepal'),
('Rahaman', 'Mitra', 21, 'A-', 'English Literature',NULL, '2004-06-15', 'A-', 'Nepal');

INSERT INTO students (
    first_name, last_name, age, grade, course, email, dob, blood_group, country
) VALUES
('Sajib2', 'Hossain2', 222, 'A+', 'Computer Science', 'sajib@example.com', '2003-05-12', 'O+', 'Bangladesh'),
('Rafi2', 'Ahmed2', 212, 'B+', 'Physics', 'rafi@example.com', '2004-03-22', 'A+', 'Bangladesh'),
('Nila2', 'Sarker2', 202, 'A', 'Mathematics', 'nila@example.com', '2005-07-18', 'B-', 'India'),
('Tariq2', 'Rahman2', 232, 'B', 'Biology', 'tariq@example.com', '2002-11-05', 'AB+', 'Pakistan');


SELECT *FROM students;
SELECT email as "Student Email",country FROM students;

SELECT * FROM students WHERE country = 'Bangladesh';

SELECT first_name, blood_group FROM students WHERE blood_group = 'A+';
SELECT * FROM students WHERE age > 21;

SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM students;
SELECT MAX(age) AS oldest_age, MIN(age) AS youngest_age FROM students;
 
WHERE blood_group = 'O+' AND country = 'Bangladesh';
SELECT * FROM students WHERE email IS NULL;
SELECT AVG(age) AS average_age FROM students;

SELECT first_name, COALESCE(email, 'Email Not Provided') AS contact_email FROM students;

SELECT * FROM students ORDER BY age ASC;
SELECT * FROM students -- normal version without IN
WHERE country = 'Bangladesh' OR country = 'India' OR country = 'Nepal';

SELECT * FROM students WHERE country IN ('Bangladesh', 'India', 'Nepal');
SELECT * FROM students 
WHERE dob BETWEEN '2003-01-01' AND '2004-12-31';

SELECT * FROM students 
WHERE first_name LIKE 'S%';


SELECT * FROM students 
WHERE grade LIKE '_+'; --This will match grades like A+, B+, C+ (but not A, B, or A-).

SELECT * FROM students 
WHERE course ILIKE '%science%';

SELECT * FROM students WHERE first_name LIKE 'R_h_%';

SELECT * FROM students
ORDER BY student_id
LIMIT 3; --This returns the first 3 rows from the table.

SELECT * FROM students
ORDER BY student_id
OFFSET 3; --This skips the first 3 rows and shows all the rest.

SELECT * FROM students
ORDER BY student_id
LIMIT 3 OFFSET 3; --Show 3 students, starting after the first 3

SELECT *FROM students LIMIT 3 OFFSET 3 * 0;
SELECT *FROM students LIMIT 3 OFFSET 3 * 1;
SELECT *FROM students LIMIT 3 OFFSET 3 * 2;


DELETE FROM students
WHERE student_id = 12; -- delete row
UPDATE students
SET age = 2222
WHERE student_id = 2;

UPDATE students
SET age = 212, country = 'Nepal'
WHERE student_id = 3;


SELECT *FROM students;

SELECT country, COUNT(*) AS total_students
FROM students
GROUP BY country;