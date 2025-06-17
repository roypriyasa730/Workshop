-- Create database
CREATE DATABASE student_db;

-- Select database 
USE student_db;

-- Create new student table
CREATE TABLE students (
    id int,
    frist_name varchar(20),
    last_name varchar(10),
    dob date,
   gmail varchar,
    address varchar(50),
    city varchar(20),
    state varchar(20),
    zip_code int,
    phone_number varchar(15),
    PRIMARY KEY (id)
   );
