
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
('giam doc'),
('ky thuat'),
('quan ly thiet bi'),
('nhan su'),
('thuc tap sinh'),
('nghien cuu'),
('ho so')
;

/* position*/

drop table if exists position;

create table position (
positionID tinyint unsigned primary key auto_increment,
positionName enum ('dev', 'test', 'scrum master', 'pm')
);

ALTER TABLE position modify column positionName 
enum ('dev', 'tester', 'pm', 'scrum master', 'QA', 'leader', 'QC', 'CEO', 'SE', 'SA');

insert into position (positionName)
values ('dev'),
('tester'),
('pm'),
('scrum master'),
('QA'),
('Leader'),
('QC'),
('CEO'),
('SE'),
('SA')
;

/*account*/

drop table if exists `account`;

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
values ('lanct131@wru.vn', 'lanct131', 'cao thuy lan', 1, 1, '2019-01-11'),
('hoann12@wru.vn', 'hoann12', 'nguyen ngoc hoa', 2, 2, '2021-02-10'),
('linhnt15@wru.vn', 'linhnt15', 'nguyen thuy linh', 3, 3, '2021-03-17'),
('namvt15@wru.vn', 'namvt15', 'vu tuan nam', 3, 4, '2021-04-23'),
('thanhnnt14@wru.vn', 'thanhnnt14', 'tran nguyen ngoc thanh', 2, 5, '2019-05-15'),
('hoangvt12@wru.vn', 'hoangvt12', 'vu tran hoang', 6, 6, '2021-06-21'),
('loanttt16@wru.vn', 'loanttt16', 'tran thi thanh loan', 3, 7, '2021-07-13'),
('daotv11@wru.vn', 'daotv11', 'tran van dao', 8, 8, '2021-07-25'),
('hungnv12@wrun.vn', 'hungnt12', 'nguyen van hung', 2, 9, '19-08-13'),
('minhnq14@wu.vn', 'minhnq14', 'nguyen quang minh', 3, 9, '2021-08-25')
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
values ('Nhom 1', 1, '2019-01-11'),
('Nhom 2', 2, '2021-02-10'),
('Nhom 3', 3, '2021-03-17'),
('Nhom 4', 4, '2021-04-23'),
('Nhom 5', 5, '2019-05-15'),
('Nhom 6', 6, '2021-06-21'),
('Nhom 7', 7, '2021-07-13'),
('Nhom 8', 8, '2021-07-25'),
('Nhom 9', 9, '2019-08-13'),
('Nhom 10', 10, '2021-08-25')
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
(2, 2, '2019-02-10'),
(3, 3, '2021-03-17'),
(4, 4, '2021-04-23'),
(5, 5, '2019-05-15'),
(6, 6, '2021-06-21'),
(7, 7, '2021-07-13'),
(8, 8, '2021-07-25'),
(9, 9, '2019-08-13'),
(10, 10, '2021-08-25')
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
values 
('Cau hoi SQL 1', 2, 1, 1, '2019-01-11'),
('Cau hoi SQL 2', 2, 1, 2, '2021-02-10'),
('Cau hoi JAVA 1', 4, 2, 3, '2021-03-17'),
('Cau hoi JAVA 2', 4, 1, 4, '2021-04-23'),
('Cau hoi HTML 1', 5, 1, 5, '2019-05-15'),
('Cau hoi HTML 2', 6, 1, 6, '2021-06-21'),
('Cau hoi Ruby 1', 7, 2, 7, '2021-07-13'),
('Cau hoi Ruby 2', 3, 1, 8, '2021-07-25'),
('Cau hoi CSS 1', 1, 1, 9, '2019-08-13'),
('Cau hoi CSS 2', 2, 1, 10, '2021-08-25')
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
values 
('Cau tra loi 1 - question SQL 1', 1, 1),
('Cau tra loi 2 - question SQL 1', 1, 0),
('Cau tra loi 3 - question SQL 1', 1, 0),
('Cau tra loi 4 - question SQL 1', 1, 1),
('Cau tra loi 1 - question SQL 2', 2, 0),
('Cau tra loi 2 - question SQL 2', 2, 0),
('Cau tra loi 3 - question SQL 2', 2, 0),
('Cau tra loi 4 - question SQL 2', 2, 1),
('Cau tra loi 1 - question JAVA 2', 4, 0),
('Cau tra loi 2 - question JAVA 2', 4, 0),
('Cau tra loi 3 - question JAVA 2', 4, 0),
('Cau tra loi 4 - question JAVA 2', 4, 1),
('Cau tra loi 1 - question HTML 1', 5, 1),
('Cau tra loi 2 - question HTML 2', 5, 0)
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
values ('MS_01', 'de thi 01', 1, '01:00:00', 1, '2019-01-11'),
('MS_02', 'de thi 02', 2, '01:30:00', 2, '2021-02-10'),
('MS_03', 'de thi 03', 3, '03:00:00', 3, '2021-03-17'),
('MS_04', 'de thi 04', 4, '01:00:00', 4, '2021-04-23'),
('MS_05', 'de thi 05', 5, '02:00:00', 5, '2019-05-15'),
('MS_06', 'de thi 06', 6, '01:00:00', 6, '2021-06-21'),
('MS_07', 'de thi 07', 7, '02:00:00', 7, '2021-07-13'),
('MS_08', 'de thi 08', 4, '01:00:00', 8, '2021-07-25'),
('MS_09', 'de thi 09', 2, '01:3:00', 9, '2019-08-13'),
('MS_010', 'de thi 10', 7, '01:00:00', 10, '2021-08-25')
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
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10)
;
-- question 2
select * from department
order by departmentid;
-- question 3
select * from department
where departmentname = 'sale';
-- Question 4
select max(length(fullname)) from `account`;
select * from `account`
where length(fullname) = 22;
-- or Question 4
select * 
from `account`
where length(fullname)= (select max(length(fullname)) from `account`)
;
-- Question 5
with cte_ac_dp3 as (select * from `account` where departmentId = 3)
select * from cte_ac_dp3
where length(fullname)= (select max(length(fullname)) from `cte_ac_dp3`);

-- or question 5:
select * 
from `account` 
where length(fullname) = (select max(length(fullname)) from `account`) and departmentID = 3;

-- question 6:
select groupname
from `group`
where createdate < '2019-12-20'
;
-- / question 7:
select a.questionid, count(a.questionid) as total
from answer a
group by a.questionid 
having total >= 4 
;
-- question 8:
select `code`
from exam
where duration > '01:00:00' and createdate < '2019-12-20'
;
-- question 9:
select * 
from `group`
order by createdate desc
limit 5;
-- question 10:
select departmentid, count(departmentid) as total
from `account` a
where departmentid = 2
;
-- question 11:
select fullname
from `account`
where fullname like '%d_o%'
;
-- or question 11:
select fullname
from `account`
where (substring_index(fullname, ' ', -1)) like 'd%o';

-- question 12:
delete from exam
where createdate < '2019-12-20'
;

-- question 13:
delete from question
where (substring_index(content, ' ', 2)) ='cau hoi';

-- question 14:
update `account`
set fullname = 'Nguyen Ba Loc', email = 'loc.nguyenba@vti.vn'
where accountid = 5
;
-- question 15:

update groupaccount
set accountid = 5
where groupid = 4;



