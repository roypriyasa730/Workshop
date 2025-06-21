-- Create database
CREATE DATABASE student_db;

-- Select database 
USE student_db;

-- Create new student table
CREATE TABLE students (
    id INT,
    first_name VARCHAR(20),
    last_name VARCHAR(10),
    dob DATE,
    gmail VARCHAR(50),
    address VARCHAR(50),
    city VARCHAR(20),
    state VARCHAR(20),
    zip_code INT,
    phone_number VARCHAR(15),
    PRIMARY KEY (id)
);

-- Show tables in the database
show tables;

-- Describe the structure of the students table
describe students;

-- Insert data into the students table
INSERT INTO students (id, first_name, last_name, dob, gmail, address, city, state, zip_code, phone_number) 
VALUES 
  (1, 'Thamma', 'Roy', '2000-01-01','johndoe1@gmail.com', '123 Main St', 'Springfield', 'IL', 62701, '555-1234'),
  (2, 'Amar', 'Roy', '1999-02-02','amarroy2@gmail.com', '456 Elm St', 'Springfield', 'IL', 62702, '555-5678'),
  (3, 'Santana', 'Roy', '1998-03-03','sanatanaroy3@gmail.com', '789 Oak St', 'Springfield', 'IL', 62703, '555-9012'),
  (4, 'Apu', 'Roy', '1997-04-04','apuroy4@gmail.com', '101 Pine St', 'Springfield', 'IL', 62704, '555-3456'),
  (5, 'Tapu', 'Roy', '1996-05-05','tapuroy5@gmail.com','202 Maple St', 'Springfield', 'IL', 62705, '555-7890'),
  (6, 'Papan', 'Roy', '1995-06-06','papanroy@gmail.com', '303 Cedar St', 'Springfield', 'IL', 62706, '555-2345'),
  (7, 'Priyasa', 'Roy', '1994-07-07', 'amarroy2@gmail.com', '404 Birch St', 'Springfield', 'IL', 62707, '555-6789'),
  (8, 'Aarohi', 'Roy', '1993-08-08','aarohiroy@gmail.com', '505 Walnut St', 'Springfield', 'IL', 62708, '555-0123'),
  (9, 'Sonali', 'Roy', '1992-09-09','sonaliroy@gmail.com', '606 Chestnut St', 'Springfield', 'IL', 62709, '555-4567');

-- Show all data in the students table
SELECT * FROM students;

-- Show the structure of the students table
DESCRIBE students;

-- Show the first name and last name of all students
SELECT first_name, last_name FROM students;

--Update a Student's Gmail
update students
set gmail = 'papanroy6@gmail.com'
where id = 6;

--add a new column for the student's age
ALTER TABLE students
ADD age INT;

-- Update the age of each student based on their date of birth
UPDATE students
SET age = YEAR(CURDATE()) - YEAR(dob) - (DATE_FORMAT(CURDATE(), '%m%d') < DATE_FORMAT(dob, '%m%d'));

-- Show the updated students table with the new age column
SELECT * FROM students;

-- Delete a student with id 9
DELETE FROM students
WHERE id = 9;

-- Show the students table after deletion
SELECT * FROM students; 


-- AGEUPDATE students
UPDATE students
SET age = 30
WHERE id = 1;
 -- create a new table for student grades

CREATE DATABASE student_grades;
USE student_grades;

-- Create a new table for student grades
CREATE TABLE student_grades (
    id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100),
    subject VARCHAR(100),
    grade CHAR(2)
);

-- Insert sample data into the student_grades table
INSERT INTO student_grades (student_name, subject, grade)
VALUES
    ('Thamma Roy', 'Math', 'A'),
    ('Amar Roy', 'Science', 'B'),
    ('Santana Roy', 'History', 'C'),
    ('Apu Roy', 'English', 'B'),
    ('Tapu Roy', 'Geography', 'A'),
    ('Papan Roy', 'Physics', 'C'),
    ('Priyasa Roy', 'Chemistry', 'B'),
    ('Aarohi Roy', 'Biology', 'A');

    --join the students table with the student_grades table
SELECT 
  s.id,
  s.first_name,
  s.last_name,
  g.subject,
  g.grade
FROM 
  students s
JOIN 
  student_grades g
ON 
  CONCAT(s.first_name, ' ', s.last_name) = g.student_name;

-- Find students with duplicate email addresses
SELECT email
FROM students
GROUP BY email
HAVING COUNT(*) > 1;

--inner join to find students with grades
SELECT 
    s.id,
    CONCAT(s.first_name, ' ', s.last_name) AS full_name,
    s.gmail,
    s.city,
    sg.subject,
    sg.grade
FROM 
    students s
INNER JOIN 
    student_grades sg
ON 
    CONCAT(s.first_name, ' ', s.last_name) = sg.student_name;
