
DROP DATABASE IF EXISTS testingsystem;

CREATE database testingsystem;

USE testingsystem;

CREATE TABLE user (
id INT,
user_name VARCHAR(50),
email varchar(50),
password varchar(20)
);

insert into user (id, user_name, email, password) value (1, 'nmpv', 'namviet0710@gmail.com', '123abc');

select * from user;
