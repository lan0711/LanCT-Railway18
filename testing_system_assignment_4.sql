use testingsystem;
-- question 1:
select a.accountid, a.fullname, d.departmentid, d.departmentName
from `account` a
inner join department d on a.departmentid = d.departmentid
;
-- question 2:
select *
from `account`
where createdDate > '2010-12-20'
;
-- question 3:
select a.fullname, a.email, p.positionName
from `account` a
inner join position p on a.positionid = p.positionid
where p.positionName like '%dev%' -- con co cach khac dung sub query
;
-- question 4:
select d.departmentid, d.departmentname, count(a.departmentid) as totalAccounts
from `account` a
inner join department d on a.departmentid = d.departmentid
group by a.departmentid
having totalAccounts > 3
;
-- question 5: 
-- max la 4
select eq.questionid, q.content, count(eq.questionid) as totalquestions
from examquestion eq
inner join question q on eq.questionid = q.questionid
group by eq.questionid
having totalquestions = ( 
select max(total)
from (
select count(questionid) as total
from examquestion 
group by questionid
) as ex_temp )   -- cai nay la bat buoc
;
-- da lay duoc so 4 lon nhat gan vao having cua cau select chinh