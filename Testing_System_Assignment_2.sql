
Drop database if exists testingsystem;

create database testingsystem;

use testingsystem;

/* department */

drop table if exists department;

create table department (
departmentID tinyint primary key auto_increment,
departmentName varchar(50) not null unique
);

insert into department (departmentID, departmentName) 
values (1, 'sale'), 
(2, 'marketing'),
(3, 'ke toan'),
(4, 'hanh chinh'),
(5, 'giam doc')
;

/* position */

drop table if exists position;

create table position (
positionID tinyint primary key auto_increment,
positionName varchar(50)
);

insert into position (positionID, positionName)
values (1, 'dev'),
(2, 'tester'),
(3, 'pm'),
(4, 'scrum master'),
(5, 'QA'),
(6, 'Leader')
;

/*account */

drop table if exists account;

create table `account` (
accountID mediumint primary key auto_increment,
email varchar(50) unique,
username varchar(50)not null,
fullname varchar(50),
departmentID tinyint,
positionID  tinyint,
createDate date
);

insert into `account` (accountID, email, username, fullname, departmentID, positionID, createDate)
values (1, 'lanct131@wru.vn', 'lanct131', 'cao thuy lan', 8, 2, '2021-03-11'),
(2, 'hoann12@wru.vn', 'hoant12', 'nguyen ngoc hoa', 6, 3, '2021-01-10'),
(3, 'linhnt15@wru.vn', 'linhnt15', 'nguyen thuy linh', 4, 6, '2021-05-17'),
(4, 'namvt15@wru.vn', 'namvt15', 'vu tuan nam', 23, 15, '2021-02-23'),
(5, 'thanhnnt14@wru.vn', 'thanhnnt14', 'tran nguyen ngoc thanh', 12,31, '2021-03-15')
;

/*group */

drop table if exists `group`;

create table `group` (
groupID mediumint primary key auto_increment,
groupName varchar(50) not null,
createdDate date
);

insert into `group` (groupID, groupName, createdDate)
values (1, 'Nhom 3', '2021-02-11'),
(2, 'Nhom 5', '2021-01-20'),
(3, 'Nhom 3', '2021-04-24'),
(4, 'Nhom 4', '2021-05-19'),
(5, 'Nhom 5', '2021-04-16')
;

/* GroupAccount */

drop table if exists groupaccount;

create table groupaccount (
groupID mediumint,
accountID mediumint,
joinDate date 
);

insert into groupaccount (groupID, accountID, joinDate)
values (1, 4, '2021-03-13'),
(2, 1, '2021-01-09'),
(2, 5, '2021-04-08'),
(5, 2, '2021-02-16'),
(5, 3, '2021--5-19')
;

/*typeQuestion */

drop table if exists TypeQuestion;

create table TypeQuestion (
categoryID tinyint primary key auto_increment,
categoryName varchar(50)
);

insert into typeQuestion (categoryID, categoryName)
value (1, 'trac nghiem'),
(2, 'tu luan')
;

/*question */

drop table if exists Question;

create table Question (
questionID tinyint primary key auto_increment,
content varchar(50),
categoryID tinyint,
typeID tinyint,
creatorID tinyint,
createdate date
);

insert into Question (questionID, content, categoryID, typeID, creatorID, createdate)
values (1, 'cau 2 khong hieu de bai', 1, 4, 5, '2021-01-03'),
(2, 'cau 10 sai de bai', 4, 5, 3, '2021-02-01'),
(3, 'cau 19 bi trung cau 5', 3, 6, 2, '2021-01-18'),
(4, 'cau 16 thieu du lieu', 4, 6, 21, '2021-03-15'),
(5, 'cau 25 khong co dap an dung', 4, 6, 3, '2021-04-13')
;

/*answer */

drop table if exists answer;

create table answer (
answerID tinyint primary key auto_increment,
content varchar(50),
questionID tinyint,
isCorrect boolean
);

insert into answer (answerID, content, questionID, isCorrect)
values (1, 'dap an la 43', 13, 1),
(2, 'dap an bi nham', 21, 0),
(3, 'de bai khong sai', 24, 0),
(4, 'dap an la 17', 4, 0),
(5, 'dap an bi trung', 6, 1)
;

/*exam */

drop table if exists exam;

create table exam (
examID tinyint primary key auto_increment,
`code` varchar(20) not null,
title varchar(50) not null,
categoryID tinyint,
duration time,
creatorID mediumint,
createDate date
);

insert into exam (examID, `code`, title, categoryID, duration, creatorID, createDate)
values (1, 'MS_01', 'de thi 01', 6, '01:00:00', 1, '2021-04-02'),
(2, 'MS_02', 'de thi 02', 2, '01:30:00', 4, '2021-04-02'),
(3, 'MS_03', 'de thi 03', 3, '03:00:00', 1, '2021-04-02'),
(4, 'MS_04', 'de thi 04', 2, '01:00:00', 3, '2021-04-02'),
(5, 'MS_05', 'de thi 05', 1, '02:00:00', 2, '2021-04-02')
;

/*examQuestion */

drop table if exists examquestion;

create table examquestion (
examID tinyint,
questionID tinyint);

insert into examquestion (examID, questionID)
values (1, 2),
(2, 5),
(3, 8),
(4, 3),
(5, 9)
;

