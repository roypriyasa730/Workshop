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

--left join to find all students and their grades
SELECT *
FROM 
    students s
LEFT JOIN 
    student_grades.student_grades sg
ON 
    CONCAT(s.first_name, ' ', s.last_name) = sg.student_name;

-- include query to find employees with more than four direct reports
select name from Employee where id in
(select managerId from Employee 

where managerId is not null 
group by managerId having count(*) > 4)


-- Write your MySQL query statement below
select s.name from SalesPerson s
left join orders o on o.sales_id = s.sales_id
where o.com_id in (select com_id from Company where name = 'RED')

-- Find the IDs of weather records where the temperature is higher than the previous day's temperature
select w1.id
from Weather w1 
join Weather w2
ON DATEDIFF(w1.recordDate, w2.recordDate) = 1
where w1.temperature > w2.temperature;

-- Find the first login date for each player
Select player_id ,
min(event_date) as first_login
from Activity
group by player_id

-- Find the classes with at least 5 students
select class from Courses
group by class 
having count(student) >= 5;


/*select e.name, b.bouns
from Employee on e.id = b.id
where b.id > 1000;*/


-- This query retrieves the customer number that has placed the highest number of orders.
SELECT customer_number
FROM Orders
GROUP BY customer_number
order by count(*) desc
limit 1


-- This query retrieves the user IDs and the count of followers for each user, ordered by user ID in ascending order.
SELECT user_id, COUNT(follower_id) AS Followers_count
FROM Followers
GROUP BY user_id ORDER BY user_id ASC;


--find the users with email addresses ending with '@leetcode.com'
SELECT *
FROM Users
WHERE  REGEXP_LIKE(mail,'^[a-zA-Z][a-zA-Z0-9._-]*@leetcode[.]com$','c'); 


--gourbp by sell_date and count distinct products sold, concatenating product names
select sell_date,
 count(distinct product) as num_sold, 
 group_concat(distinct product order by product separator ',') as products
  from Activities
   group by sell_date order by sell_date;

-- Find the product IDs of products that are both low fat and recyclable
SELECT product_id
FROM Products
WHERE low_fats = 'Y' AND recyclable = 'Y';

--find invalid tweets 15

SELECT tweet_id 
FROM Tweets
WHERE LENGTH(content) > 15;

--Find the number of times each student attended each exam 

SELECT s.student_id,s.student_name,u.subject_name, COUNT(e.subject_name) AS attended_exams
FROM Students s
JOIN Subjects u
LEFT JOIN Examinations e ON s.student_id = e.student_id AND u.subject_name = e.subject_name
GROUP BY s.student_id, u.subject_name
ORDER BY s.student_id, u.subject_name;

--Write a solution to find the name, population, and area of the big countries.
SELECT name, population, area
FROM World
WHERE area >= 3000000 or population >=25000000;

-- This query retrieves the user IDs and the count of followers for each user, ordered by user ID in ascending order.
SELECT user_id, COUNT(follower_id) AS Followers_count
FROM Followers
GROUP BY user_id ORDER BY user_id ASC;


--combine person and address tables using LEFT JOIN
SELECT 
p.firstName,
p.lastName,
a.city,
a.state
FROM person p
LEFT JOIN address a ON p.personId  = a.personId   


-- Find the confirmation rate for each user
SELECT s.user_id , ROUND(if(COUNT(*) > 0, 1, 0), 2) AS  confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c ON s.user_id = c.user_id
GROUP BY s.user_id;

-- Find the names of customers who have not placed any orders
select c.name as Customers from Customers c
where c.id not in (select customerId from Orders)


-- Find the unique IDs of employees and their names using a LEFT JOIN

SELECT EmployeeUNI.unique_id, Employees.name  
FROM Employees 
LEFT JOIN  EmployeeUNI 
ON Employees.id= EmployeeUNI.id

-- Find the maximum number from the MyNumbers table that is unique (appears only once)

SELECT MAX(num) AS num 
FROM (SELECT num FROM MyNumbers GROUP BY num HAVING COUNT(num)=1) a;


-- Calculate the average rating and the percentage of poor queries for each query name
SELECT query_name,
	ROUND(AVG(rating / position), 2) AS quality,
	ROUND(AVG(rating < 3) * 100, 2) AS poor_query_percentage 
FROM Queries
GROUP BY query_name;

-- Find patients with a condition
SELECT p.name
FROM Patients p
JOIN Conditions c ON p.id = c.patient_id
WHERE c.condition = 'diabetes';

-- Find employees who do not have a manager and earn less than 30000

select employee_id from Employees
where manager_id not in (select employee_id from Employees) 
and salary < 30000
order by employee_id


-- Find the IDs of weather records where the temperature is higher than the previous day's temperature  
select w1.id
from Weather w1 
join Weather w2
ON DATEDIFF(w1.recordDate, w2.recordDate) = 1
where w1.temperature > w2.temperature;

-- Create Cinema table

SELECT id,movie,description,rating
FROM Cinema
WHERE description NOT IN ('boring')  AND id %2 !=0 
ORDER BY rating DESC;

-- Find employees who are either the only employee in their department or are marked as primary
select distinct employee_id, department_id
from employee
where employee_id in (
    select employee_id
    from employee
    group by employee_id
    having count(*) = 1
) or primary_flag= 'Y'
ORDER BY employee_id


--610. Triangle Judgement
SELECT  x, y, z, CASE WHEN x + y > z AND x + z > y AND y + z > x 
THEN 'Yes' 
ELSE 'No' END AS triangle
FROM Triangle;



-- Find the number of direct reports and the average age of direct reports for each manager
SELECT  m.employee_id, m.name,
    COUNT(e.employee_id) AS reports_count,
    ROUND(AVG(e.age)) AS average_age
FROM Employees e
JOIN Employees m  ON e.reports_to = m.employee_id
GROUP BY m.employee_id, m.name
ORDER BY m.employee_id;

-- Find the percentage of users registered for each contest

SELECT contest_id,
ROUND(COUNT(user_id)*100/(select count(*)from Users),2) as percentage
from Register
group by contest_id
order by percentage desc, contest_id asc


-- Find the second highest salary from the Employee table
SELECT MAX(salary) AS SecondHighestSalary
FROM Employee
WHERE salary < (SELECT MAX(salary) FROM Employee);

--196. Delete Duplicate Emails
delete p1 from Person p1 
join Person p2 on p1.email=p2.email
where p1.id>p2.id;

-- Find employees who manage more than four employees

select name from Employee where id in
(select managerId from Employee 

where managerId is not null 
group by managerId having count(*) > 4)

-- Find the confirmation rate for each user
SELECT s.user_id,
    ROUND(
        IFNULL(SUM(c.action = 'confirmed') / COUNT(c.action), 0),
        2) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c  ON s.user_id = c.user_id
GROUP BY s.user_id;

-- Find viewers who have viewed their own videos
SELECT author_id AS id
FROM Views
WHERE author_id = viewer_id
GROUP BY author_id
ORDER BY id asc;

-- Calculate the average rating and the percentage of poor queries for each query name
SELECT query_name,
	ROUND(AVG(rating / position), 2) AS quality,
	ROUND(AVG(rating < 3) * 100, 2) AS poor_query_percentage 
FROM Queries
GROUP BY query_name;


-- Create Cinema table
SELECT id,movie,description,rating
FROM Cinema
WHERE description NOT IN ('boring')  AND id %2 !=0 
ORDER BY rating DESC;



-- Find products with at least 100 units sold in February 2020
select product_name, sum(unit) as unit 
from Orders 
left join Products on Orders.product_id = Products.product_id
where order_date >= '2020-02-01' and order_date<='2020-02-29'
group by Orders.product_id
 having sum(unit) >= 100

 
-- Find patients with a condition
 SELECT p.name
FROM Patients p
JOIN Conditions c ON p.id = c.patient_id
WHERE c.condition = 'diabetes';


-- Find the IDs of weather records where the temperature is higher than the previous day's temperature
SELECT today.id
FROM Weather yesterday 
CROSS JOIN Weather today
WHERE DATEDIFF(today.recordDate, yesterday.recordDate) = 1
    AND today.temperature > yesterday.temperature

-- Find the maximum number from the MyNumbers table that is unique (appears only once)

SELECT MAX(num) AS num 
FROM (SELECT num FROM MyNumbers GROUP BY num HAVING COUNT(num)=1) a;

-- Find the number of active users for each day in the last 30 days
SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27'
GROUP BY activity_date;

-- 1251. Average Selling Price 
SELECT p.product_id,
IFNULL(ROUND(SUM(p.price * u.units) / SUM(u.units), 2), 0) AS average_price
FROM Prices p
LEFT JOIN UnitsSold u ON p.product_id = u.product_id
AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id;  

-- Find the names of customers who have not placed any orders
select c.name as Customers from Customers c
where c.id not in (select customerId from Orders) 

-- Find the first sale year for each product along with its quantity and price
SELECT s.product_id, s.year AS first_year, s.quantity, s.price
FROM Sales s
JOIN (SELECT product_id, MIN(year) AS first_year
FROM Sales
GROUP BY product_id
) AS first_sales
ON s.product_id = first_sales.product_id 
AND s.year = first_sales.first_year;

-- Remove Element
class Solution {
    public int removeElement(int[] nums, int val) {
        
        int k=0;
        for(int i=0;i<nums.length;i++){
            if( nums[i]!=val){
              nums[k]=nums[i];
               k++;
            }
           continue ;
        }
       
       return k ;

    }
}

select employee_id from Employees
where manager_id not in (select employee_id from Employees) 
and salary < 30000
order by employee_id

-- Find employees who manage more than four employees
select name from Employee where id in
(select managerId from Employee 

where managerId is not null 
group by managerId having count(*) > 4)

-- Transaction table creation
SELECT
  DATE_FORMAT(trans_date, '%Y-%m') AS month,
  country,
  COUNT(*) AS trans_count,
  SUM(state = 'approved') AS approved_count,
  SUM(amount) AS trans_total_amount,
  SUM(IF(state = 'approved', amount, 0)) AS approved_total_amount
FROM Transactions
GROUP BY 1, 2;

--Game Play Analysis IV (Question #550)

WITH t1 AS (SELECT player_id,
MIN(event_date) AS first_login_date
FROM Activity
GROUP BY player_id
)
SELECT ROUND(COUNT(*) / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) AS fraction
FROM Activity a1
JOIN t1 t ON a1.player_id = t.player_id 
AND a1.event_date = DATE_ADD(t.first_login_date , INTERVAL 1 DAY);


 --626. Exchange Seats
SELECT CASE
        WHEN MOD(id, 2) != 0 AND id = (SELECT MAX(id) FROM Seat) THEN id
        WHEN MOD(id, 2) != 0 THEN id + 1
        ELSE id - 1 END AS id, student
FROM Seat
ORDER BY id ASC;
-- Find the maximum number from the MyNumbers table that is unique (appears only once)
SELECT
    MAX(num) AS num
FROM (SELECT  num
FROM MyNumbers
GROUP BY num
HAVING COUNT(*) = 1
) AS SingleNums;


SELECT v.customer_id, COUNT(*) AS count_no_trans
FROM Visits v
LEFT JOIN Transactions t ON v.visit_id = t.visit_id
WHERE t.transaction_id IS NULL
GROUP BY v.customer_id;

--1045. Customers Who Bought All Products
SELECT customer_id
FROM Customer
GROUP BY 1
HAVING COUNT(DISTINCT product_key) = (
SELECT COUNT(*) FROM Product);

-- Find the user with the most friends
WITH
  AllIds AS (
    SELECT requester_id AS id FROM RequestAccepted
    UNION ALL
    SELECT accepter_id FROM RequestAccepted
  )
SELECT
  id,
  COUNT(*) AS num
FROM AllIds
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;
-- Find viewers who have viewed their own videos
SELECT author_id AS id
FROM Views
WHERE author_id = viewer_id
GROUP BY author_id
ORDER BY id asc;
-- Find the dates where the number of customers visiting the store in the last 7 days is at least 100
WITH
  Dates AS (
    SELECT DISTINCT visited_on
    FROM Customer
    WHERE visited_on >= (
      SELECT DATE_ADD(MIN(visited_on), INTERVAL 6 DAY)
      FROM Customer
    )
  )

--1327. List the Products Ordered in a Period
select product_name, sum(unit) as unit 
from Orders 
left join Products on Orders.product_id = Products.product_id
where order_date >= '2020-02-01' and order_date<='2020-02-29'
group by Orders.product_id
 having sum(unit) >= 100

-- Find the first sale year for each product along with its quantity and price
 SELECT s.product_id, s.year AS first_year, s.quantity, s.price
FROM Sales s
JOIN (SELECT product_id,
 MIN(year) AS first_year
FROM Sales
GROUP BY product_id
) AS first_sales
ON s.product_id = first_sales.product_id 
AND s.year = first_sales.first_year;

--180. Consecutive Numbers
SELECT DISTINCT A.Num AS ConsecutiveNums
FROM Logs AS A
INNER JOIN Logs AS B ON A.Id + 1 = B.Id
INNER JOIN Logs AS C ON B.Id + 1 = C.Id
WHERE A.Num = B.Num
AND B.Num = C.Num;


