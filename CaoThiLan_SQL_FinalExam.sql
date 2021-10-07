DROP DATABASE ThucTap;

CREATE DATABASE ThucTap;

USE ThucTap;
-- create tables
DROP TABLE IF EXISTS Country;

CREATE TABLE Country (
	country_id INT PRIMARY KEY AUTO_INCREMENT,
    country_name VARCHAR(50) NOT NULL
);

DROP TABLE IF EXISTS Location;

CREATE TABLE Location (
	location_id INT PRIMARY KEY AUTO_INCREMENT,
    street_address VARCHAR(50) NOT NULL,
    postal_code int,
    country_id int,
    CONSTRAINT fk_Location_Country FOREIGN KEY (country_id) REFERENCES Country (country_id)
);

DROP TABLE IF EXISTS Employee;

CREATE TABLE Employee (
	employee_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name varchar(50),
	email VARCHAR(50) NOT NULL UNIQUE,
    location_id int,
    CONSTRAINT fk_Employee_Location FOREIGN KEY (location_id) REFERENCES Location (location_id)
);

-- insert data
INSERT INTO Country (country_name)
		VALUES 		('Viet Nam'),
					('England'),
					('America'),
					('Nhat Ban');
					
                    
INSERT INTO Location (street_address, postal_code, country_id)
		VALUES 		('Ba Dinh_Ha Noi', '10000', 1),
					('London_England', '56000', 2),
                    ('Hoan Kiem_Ha Noi', '46555', 1),
                    ('Tokyo', '35000', 4);
				

INSERT INTO Employee (full_name, email, location_id)
		VALUES 		('Nguyen Van Ngoc', 'nn03@gmail.com', 1),
					('Tom Hiddleston', 'tom11@gmail.com', 2),
					('Tran Van Dung', 'dungtv13@gmail.com', 3),
					('Suzuki Misuzu', 'suzuki56@gmail.com', 4);
                    
-- Cau 2: a) Lay ra tat ca nhan vien thuoc Viet Nam
SELECT e.full_name
FROM Employee e
join Location l on e.location_id = l.location_id
join Country c on l.country_id = c.country_id
where c.country_name = 'Viet Nam'
;
-- b)
SELECT c.country_name
FROM Employee e
join Location l on e.location_id = l.location_id
join Country c on l.country_id = c.country_id
where e.email = 'nn03@gmail.com';

-- c
-- thong ke theo moi country
SELECT c.country_name, count(e.employee_id) total
FROM Employee e
join Location l on e.location_id = l.location_id
join Country c on l.country_id = c.country_id 
group by c.country_name;
-- thong ke theo moi location
SELECT l.street_address, count(e.employee_id) total
FROM Employee e
join Location l on e.location_id = l.location_id
join Country c on l.country_id = c.country_id 
group by l.location_id;

-- 3
DROP TRIGGER IF EXISTS EmployInsert;

DELIMITER //
CREATE TRIGGER EmployInsert
BEFORE INSERT
ON Employee FOR EACH ROW
BEGIN
	if (SELECT count(e.employee_id) total
FROM Employee e
join Location l on e.location_id = l.location_id
join Country c on l.country_id = c.country_id 
where c.country_id = (select l.country_id
from location l
where l.location_id = new.location_id)) >= 10  then
    signal sqlstate value '45000' 
    set message_text = 'insert values failed';
    end if;
END //
DELIMITER ;
-- use
INSERT INTO Employee (full_name, email, location_id)
		VALUES 		('Nguyen Van f', 'nn01@gmail.com', 1),
					('Nguyen Van b', 'nn02@gmail.com', 1),
('Nguyen Van c', 'nn09@gmail.com', 1),
('Nguyen Van d', 'nn04@gmail.com', 1),
('Nguyen Van e', 'nn05@gmail.com', 1),
('Nguyen Van g', 'nn06@gmail.com', 1),
('Nguyen Van h', 'nn07@gmail.com', 1),
('Nguyen Van k', 'nn08@gmail.com', 1)
;

INSERT INTO Employee (full_name, email, location_id)
value ('Nguyen Van hkg', 'nn0110@gmail.com', 1);





		
                    
                    