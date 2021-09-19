
Drop database if exists testingsystem;

create database testingsystem;

use testingsystem;

/* department */

drop table if exists department;

create table department (
departmentID tinyint primary key auto_increment,
departmentName varchar(50) not null unique
);

/* position */

drop table if exists position;

create table position (
positionID tinyint primary key auto_increment,
positionName enum ('dev', 'test', 'scrum master', 'pm')
);

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

/*group */

drop table if exists `group`;

create table `group` (
groupID mediumint primary key auto_increment,
groupName varchar(50) not null,
createdDate date
);

/* GroupAccount */

drop table if exists groupaccount;

create table groupaccount (
groupID mediumint,
accountID mediumint,
joinDate date 
);

/*typeQuestion */

drop table if exists TypeQuestion;

create table TypeQuestion (
categoryID tinyint primary key auto_increment,
categoryName varchar(50)
);

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

/*answer */

drop table if exists answer;

create table answer (
answerID tinyint primary key auto_increment,
content varchar(50),
questionID tinyint,
isCorrect boolean
);

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

/*examQuestion */

drop table if exists examquestion;

create table examquestion (
examID tinyint,
questionID tinyint);


