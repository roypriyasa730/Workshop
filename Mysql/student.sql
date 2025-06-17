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