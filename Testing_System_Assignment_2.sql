
Drop database if exists testingsystem;

create database testingsystem;

use testingsystem;

/* department*/

drop table if exists department;

create table department (
departmentID tinyint unsigned primary key auto_increment,
departmentName varchar(50) not null unique
);

insert into department (departmentName) 
values ('sale'), 
('marketing'),
('ke toan'),
('hanh chinh'),
('giam doc')
;

/* position*/

drop table if exists position;

create table position (
positionID tinyint unsigned primary key auto_increment,
positionName enum ('dev', 'test', 'scrum master', 'pm')
);

ALTER TABLE position modify column positionName 
enum ('dev', 'tester', 'pm', 'scrum master', 'QA', 'leader');

insert into position (positionName)
values ('dev'),
('tester'),
('pm'),
('scrum master'),
('QA'),
('Leader')
;

/*account*/

drop table if exists account;

create table `account` (
accountID mediumint unsigned primary key auto_increment,
email varchar(50) unique,
username varchar(50) not null,
fullname varchar(50),
departmentID tinyint unsigned,
positionID  tinyint unsigned,
createDate date,
constraint fk_account_department foreign key (departmentID) 
references department (departmentID) on delete set null on update cascade,
constraint fk_account_position foreign key (positionID) 
references position (positionID) on delete set null on update cascade
);

insert into `account` (email, username, fullname, departmentID, positionID, createDate)
values ('lanct131@wru.vn', 'lanct131', 'cao thuy lan', 1, 1, '2021-01-11'),
('hoann12@wru.vn', 'hoann12', 'nguyen ngoc hoa', 2, 2, '2021-02-10'),
('linhnt15@wru.vn', 'linhnt15', 'nguyen thuy linh', 3, 3, '2021-03-17'),
('namvt15@wru.vn', 'namvt15', 'vu tuan nam', 4, 4, '2021-04-23'),
('thanhnnt14@wru.vn', 'thanhnnt14', 'tran nguyen ngoc thanh', 5, 5, '2021-05-15')
;

/*group*/

drop table if exists `group`;

create table `group` (
groupID mediumint unsigned primary key auto_increment,
groupName varchar(50) not null,
creatorID mediumint unsigned,
createDate date
);

insert into `group` (groupName, creatorID, createDate)
values ('Nhom 1', 1, '2021-01-11'),
('Nhom 2', 2, '2021-02-10'),
('Nhom 3', 3, '2021-03-17'),
('Nhom 4', 4, '2021-04-23'),
('Nhom 5', 5, '2021-05-15')
;

/* GroupAccount*/

drop table if exists groupaccount;

create table groupaccount (
groupID mediumint unsigned,
accountID mediumint unsigned,
joinDate date,
constraint fk_groupaccount_group foreign key (groupID) 
references `group` (groupID) on delete set null on update cascade,
constraint fk_groupaccount_account foreign key (accountID) 
references `account` (accountID) on delete set null on update cascade
);

insert into groupaccount (groupID, accountID, joinDate)
values (1, 1, '2021-01-11'),
(2, 2, '2021-02-10'),
(3, 3, '2021-03-17'),
(4, 4, '2021-04-23'),
(5, 5, '2021-05-15')
;

/*typeQuestion*/

drop table if exists TypeQuestion;

create table TypeQuestion (
typeID tinyint unsigned primary key auto_increment,
typeName varchar(50)
);

insert into TypeQuestion (typeName)
value ('trac nghiem'),
('tu luan')
;

/*categoryQuestion*/

drop table if exists categoryQuestion;

create table categoryQuestion (
categoryID tinyint unsigned primary key auto_increment,
categoryName enum ('Java', 'NET', 'SQL', 'Postman', 'Ruby')
);

ALTER TABLE categoryQuestion modify column categoryName
enum ('Python', 'HTML', 'CSS', 'Java', 'NET', 'SQL', 'Ruby');

insert into categoryQuestion (categoryName)
values ('Python'), 
('HTML'), 
('CSS'), 
('Java'), 
('NET'), 
('SQL'), 
('Ruby')
;

/*Question*/

drop table if exists Question;

create table Question (
questionID tinyint unsigned primary key auto_increment,
content varchar(50),
categoryID tinyint unsigned,
typeID tinyint unsigned,
creatorID tinyint unsigned,
createdate date,
constraint fk_Question_categoryQuestion foreign key (categoryID)
references categoryQuestion (categoryID) on delete set null on update cascade,
constraint fk_Question_TypeQuestion foreign key (typeID)
references TypeQuestion (typeID) on delete set null on update cascade
);

insert into Question (content, categoryID, typeID, creatorID, createdate)
values ('cau 2 khong hieu de bai', 2, 1, 1, '2021-01-11'),
('cau 10 sai de bai', 2, 1, 2, '2021-02-10'),
('cau 19 bi trung cau 5', 4, 2, 3, '2021-03-17'),
('cau 16 thieu du lieu', 4, 1, 4, '2021-04-23'),
('cau 25 khong co dap an dung', 5, 1, 5, '2021-05-15')
;

/*answer */

drop table if exists answer;

create table answer (
answerID tinyint unsigned primary key auto_increment,
content varchar(50),
questionID tinyint unsigned,
isCorrect boolean,
constraint fk_answer_Question foreign key (questionID)
references Question (questionID) on delete set null on update cascade
);

insert into answer (content, questionID, isCorrect)
values ('dap an la 43', 1, 1),
('dap an bi nham', 2, 0),
('de bai khong sai', 3, 0),
('dap an la 17', 4, 0),
('dap an bi trung', 5, 1)
;

/*exam */

drop table if exists exam;

create table exam (
examID tinyint unsigned primary key auto_increment,
`code` varchar(20) not null,
title varchar(50) not null,
categoryID tinyint unsigned,
duration time,
creatorID mediumint unsigned,
createDate date,
constraint fk_exam_categoryQuestion foreign key (categoryID)
references categoryQuestion (categoryID) on delete set null on update cascade
);

insert into exam (`code`, title, categoryID, duration, creatorID, createDate)
values ('MS_01', 'de thi 01', 1, '01:00:00', 1, '2021-01-11'),
('MS_02', 'de thi 02', 2, '01:30:00', 2, '2021-02-10'),
('MS_03', 'de thi 03', 3, '03:00:00', 3, '2021-03-17'),
('MS_04', 'de thi 04', 4, '01:00:00', 4, '2021-04-23'),
('MS_05', 'de thi 05', 5, '02:00:00', 5, '2021-05-15')
;

/*examQuestion */

drop table if exists examquestion;

create table examquestion (
examID tinyint unsigned,
questionID tinyint unsigned,
constraint fk_examquestion_exem foreign key (examID)
references exam (examID) on delete set null on update cascade,
constraint fk_examquestion_Question foreign key (questionID)
references Question (questionID) on delete set null on update cascade
);

insert into examquestion (examID, questionID)
values (1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5)
;
