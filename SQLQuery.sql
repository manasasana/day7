use [demo];
go
select * from student
where marks> (select avg(marks) from student);
use [student];
go
select * from EmpInfo
where EmpId in (select EmpId from EmpSalary where BaseOffice in ('pune','chennai'));

select * from EmpSalary
where EmpId in (select EmpId from EmpInfo where BaseOffice in ('pune','chennai'));

select s.EmpId,s.Salary, e.Name from EmpInfo e,EmpSalary s
where e.EmpId=s.EmpId and s.EmpId in (select EmpId from EmpSalary where Salary<40000);

select * from EmpInfo e,EmpSalary s
where e.EmpId=s.EmpId and s.EmpId in (select EmpId from EmpSalary where Salary<40000);

select * into lowsalary from EmpSalary where salary<40000;
select * from lowsalary;
update lowsalary set salary=salary+5000 where EmpId in (select EmpId from EmpSalary where salary<40000);
select * from EmpSalary;

truncate table lowsalary;

sp_rename low_salary, lowsalary;

alter table low_salary rename to lowsalary;

create table ##globaltemptable (EmpId int, Salary bigint);
drop table #locallocaltemptable;

create index EmpIndex on EmpInfo(EmpId);
drop index EmpInfo.EmpIndex;

create table iteminfo(
itemid int identity(100, 1) primary key,
itemname varchar(100),
cost int,
quantity int
);
insert into iteminfo values('tshirt',500,5);
insert into iteminfo values('shirt',1500,2);

select * from EmpInfo;
drop table iteminfo;

select day(DOJ) from EmpInfo;

update EmpInfo set DOJ='2022-6-5';

select DATEADD(day,3,DOJ) from EmpInfo;

select DATEDIFF(year,DOB,DOJ) from EmpInfo;

select getdate();

select convert(varchar, DOJ,106),DOJ from EmpInfo;

select ceiling(EmpId) from EmpInfo;

select exp(8);
select rand();
select DEGREES(23);
use [student];
go
select DATALENGTH(name), name from salesman;
select * from salesman;

with orderinfo(ord_no, purch_amt) as ((select ord_no, purch_amt from orders where purch_amt>1000))
select ord_no, purch_amt from orders;

with orderinfo(ord_no, purch_amt) as ((select ord_no, purch_amt from orders where purch_amt>1000))
select ord_no, purch_amt from orders where ord_date>'2012-9-10';

with account(CusName, CustId, AccNo) as ((select CusName, CustId, AccNo from AccInfo where CusName like '%a%'))
select CusName, CustId, AccNo from AccInfo;

select * from StudentInfo;

with course(StdId,CourseId,CourseName) as ((select s.StdId,c.CourseId,c.CourseName 
from StudentInfo s, CourseInfo c where s.StdId=c.StdId and s.StdId>10))
select s.StdId,c.CourseId,c.CourseName  from  StudentInfo s, CourseInfo c where s.StdId=c.StdId and  c.CourseId>100;

select * from CourseInfo;

