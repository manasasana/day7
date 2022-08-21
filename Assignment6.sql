use [demo]
go
use [student]
go

select * from orders;

SELECT customer_id,ord_date,MAX(purch_amt) 
FROM orders where ord_date between '2022-02-01' and '2022-07-31'
GROUP BY customer_id,ord_date;

create index OrderIndex on orders(ord_no);

with empinfo(EmpId, Salary) as (select EmpId,salary from EmpSalary where Salary>45000)
select EmpId, salary from empinfo;