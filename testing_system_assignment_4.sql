use testingsystem;
-- question 1:
select a.accountid, a.fullname, d.departmentid, d.departmentName
from `account` a
inner join department d on a.departmentid = d.departmentid
;
-- question 2:
select * 	
from `account`
where createDate > '2010-12-20'
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

-- question 6:

select cq.categoryid, cq.categoryname, count(q.categoryid) as total
from categoryquestion cq
join question q on q.categoryid = cq.categoryid
group by q.categoryid;

-- question 7:
select q.questionid, q.content, count(eq.questionid) as total
from question q
join examquestion eq on eq.questionid = q.questionid
group by eq.questionid;

-- question 8:
select q.questionid, q.content, count(a.questionid) as total
from question q
join answer a on a.questionid = q.questionid
group by a.questionid
having total = (select max(countques) from 
(select count(b.questionid) as countques from answer b
group by b.questionid) as countansw
);
 -- question 9:
 select groupid, count(accountid)
 from groupaccount
 group by groupid
 order by groupid;
 -- question 10:
 select p.positionid, p.positionName, count(a.positionid) countPosition
 from position p
 join `account` a on a.positionid = p.positionid
 group by a.positionid
 having countPosition = (select min(countb) from(select count(b.positionid) countb from `account` b group by b.positionid) s)
 ;
 -- question 11:
 select p.positionName, d.departmentName, count(p.positionName)
 from `account` a
 join department d on a.departmentid = d.departmentid
 join position p on a.positionid = p.positionid
group by p.positionid, d.departmentid;

-- question 12:
select q.content, t.TypeName, a.fullname, ar.content
from question q
join categoryQuestion c on c.categoryid = q.categoryid
join typequestion t on t.typeid = q.typeid
join answer ar on ar.questionid = q.questionid
join `account` a on a.accountid = q.CreatorID
group by c.CategoryID, t.TypeID, ar.content, a.fullname;

-- question 13:
select t.typeid, t.typeName, count(q.typeid) total
from typequestion t
join question q on  t.typeid = q.typeid
group by q.typeid;

-- question 14:
select *
from `group` g
left join groupaccount ga on g.groupid = ga.groupid
where ga.accountid is null;

-- question 16:
select q.questionid
from answer a
right join question q on q.questionid = a.questionid
where a.answerid is null;
 -- question 17
 -- a:
select a.accountid, a.fullname, ga.groupid
from `account` a
join groupaccount ga on a.accountid = ga.accountid
where ga.groupid = 1;
-- b:
select a.accountid, a.fullname, ga.groupid
from `account` a
join groupaccount ga on a.accountid = ga.accountid
where ga.groupid = 2;
-- c:
select a.accountid, a.fullname, ga.groupid
from `account` a
join groupaccount ga on a.accountid = ga.accountid
where ga.groupid = 1 or ga.groupid = 2;

-- question 18:
-- a:
select g.groupid, g.groupName, count(ga.groupid) total
from `group` g
join groupaccount ga on g.groupid = ga.groupid
group by ga.groupid
having total >=5;
-- b:
select g.groupid, g.groupName, count(ga.groupid) total
from `group` g
join groupaccount ga on g.groupid = ga.groupid
group by ga.groupid
having total <=7;
-- c:
select g.groupid, g.groupName, count(ga.groupid) total
from `group` g
join groupaccount ga on g.groupid = ga.groupid
group by ga.groupid
having total >=5 or total <=7;