use JIBE_Main_Training;

select user_name();

create user ls for login j2;

-- select * from role;
--insert into table values()


create table bank_account2008(accID int primary key, cutomer_name varchar(30), acc_type varchar(20), balence int);

insert into bank_account2008 values (2,'sita','saving',400000),(3,'gokul','current',30000),(4,'anjal','current',500000);


select * from bank_account2008;

begin transaction;

UPDATE bank_account2008
SET balence = CASE
                WHEN balence >= 59999 THEN 6000000
                ELSE balence
              END
WHERE acc_type = 'saving';

--update bank_account
--set balence-4000 if balence <4000 

create table Departments2008 (DepartmentID int primary key,DepartmentName varchar(30) not null );

create table Employee34 (EmployeeID int primary key,Name varchar(30),age int check (age>=18), salery Decimal (10,2) default 500000,
DepartmentID int,
constraint FK_Department2008 foreign key (DepartmentID) references Departments2008(DepartmentID));

insert into Departments2008 values(1,'Devolpers'),(2,'HR'),(3,'director');

insert into Employee34 values(1,'Gokul',23,3000000,1);

--drop table Employee34;

create table Employee5 (EmployeeID int not null,Name varchar(30),age int check (age>=18), salery Decimal (10,2) default 500000,
DepartmentID int,
constraint FK_Department28 foreign key (DepartmentID) references Departments2008(DepartmentID));

insert into Employee45 values(1,'Gokul',23,3000000,1);


ALTER TABLE Employee5
ADD constraint  FK_Department Foreign KEY (DepartmentID) references departments2008(DepartmentID) ;

select * from Employee45;

alter table departments2008 alter column DepartmentID int not null;