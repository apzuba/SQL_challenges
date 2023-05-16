-- A company maintains an EMPLOYEE table with information for each of their employees. 
-- Write a query to produce a list containing two columns. 
-- The first column should include the name of an employee who earns less than some other employee. 
-- The second column should contain the name of a higher earning employee. 
-- All combinations of lesser and greater earning employees should be included.
-- Sort ascending, first by the lower earning employee's ID, then by the higher earning employee's SALARY.


CREATE DATABASE "Chluj_ex_1"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'C'
    LC_CTYPE = 'C'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
	
	
CREATE TABLE EMPLOYEE (
    id SERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(128),
    age INT,
    address VARCHAR(256),
    salary INT
)


INSERT INTO EMPLOYEE (name, age, address, salary) VALUES
('John Doe', 30, '123 Main St', 50000),
('Jane Smith', 25, '456 Elm St', 60000),
('Bob Johnson', 40, '789 Oak St', 70000),
('Alice Lee', 35, '321 Pine St', 80000),
('Sam Brown', 28, '654 Maple St', 90000),
('Sara Wilson', 42, '987 Cedar St', 100000),
('Tom Anderson', 37, '246 Birch St', 110000),
('Karen Taylor', 31, '369 Walnut St', 120000),
('Mike Jones', 45, '802 Cherry St', 130000),
('Lisa Kim', 29, '135 Spruce St', 140000),
('Mark Wilson', 33, '246 Elmwood Ave', 55000),
('Sarah Chen', 27, '135 Oakwood Ave', 65000),
('David Lee', 45, '789 Maplewood Ave', 75000),
('Emily Johnson', 29, '369 Pinewood Ave', 85000),
('Alex Kim', 35, '802 Cedarwood Ave', 95000),
('Lisa Garcia', 31, '654 Walnutwood Ave', 105000),
('Erica Brown', 38, '123 Cherrywood Ave', 115000),
('Kevin Davis', 42, '456 Sprucewood Ave', 125000),
('Tiffany Nguyen', 26, '987 Birchwood Ave', 135000),
('Scott Anderson', 39, '246 Pinecrest Ave', 145000),
('Michelle Thomas', 29, '369 Cedargrove Ave', 155000),
('Steven Wilson', 36, '802 Elmcrest Ave', 165000),
('Ashley Chen', 33, '135 Oakcrest Ave', 175000),
('Daniel Lee', 45, '789 Maplegrove Ave', 185000),
('Lauren Johnson', 29, '369 Pinetree Ave', 195000),
('Nathan Kim', 35, '802 Cedarcrest Ave', 205000),
('Rachel Garcia', 31, '654 Walnuthill Ave', 215000),
('Sean Brown', 38, '123 Cherrytree Ave', 225000),
('Brianna Davis', 42, '456 Sprucegrove Ave', 235000),
('Carlos Nguyen', 26, '987 Birchgrove Ave', 245000),
('Vanessa Anderson', 39, '246 Pinetop Ave', 255000),
('Gabriel Thomas', 29, '369 Cedarhill Ave', 265000),
('Jasmine Wilson', 36, '802 Elmtree Ave', 275000),
('Adam Chen', 33, '135 Oakhill Ave', 285000),
('Marie Lee', 45, '789 Mapletop Ave', 295000),
('Andrew Johnson', 29, '369 Pinehollow Ave', 305000),
('Maria Kim', 35, '802 Cedarhollow Ave', 315000),
('Jessica Garcia', 31, '654 Walnutgrove Ave', 325000),
('Ethan Brown', 38, '123 Cherryside Ave', 335000);


SELECT e1.name AS lower_earning_employee, e2.name AS higher_earning_employee
FROM EMPLOYEE e1, EMPLOYEE e2
WHERE e1.salary < e2.salary
ORDER BY e1.salary ASC, e2.salary ASC;