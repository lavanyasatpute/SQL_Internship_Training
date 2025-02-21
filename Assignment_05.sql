
create table tbl_Employee2008 (employeeID int primary key,empname varchar(30), empcity varchar(30),emp_sallery int);

insert into tbl_employee2008 values (1,'ram','amt',2000000),(2,'sita','nagpur',3000000),(3,'karan','kol',500000);

insert into tbl_employee2008 values (4,'sham','kol',400000),(5,'ram1','amt',200000),(6,'sita1','nagpur',300000);

select empname , empcity,emp_sallery
from tbl_Employee2008 as e1 where emp_sallery in (select max(emp_sallery) from tbl_Employee2008 as e2 where e1.empcity = e2.empcity);




