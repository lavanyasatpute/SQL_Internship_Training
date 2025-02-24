create table customers2008 (customerID int primary key, customerName varchar(30), email varchar(30), phoneNumber bigint);


create table Accounts2008(accountID int primary key,
customerID int foreign key (customerID) references customers2008 (customerID),
AccountNumber bigint, balence bigint , accountType varchar(30));

create table Transaction2008(TransactionID int primary key, AccountID int foreign key (accountID) references Accounts2008(accountID),
TransactionType varchar(30),amount bigint, TransactionDate date);

create table AuditTransaction2008 (AuditID int primary key, AccountID int foreign key (accountID) references Accounts2008(accountID),
Amount bigint, TransactionDate Date, Action varchar(30));


---------------------------------------------------------------------------------------------------------------------------------------------------

---task 01
--1 :-
--drop table Transaction2008;

--drop table AuditTransaction2008;

SELECT CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'Accounts2008' AND CONSTRAINT_TYPE = 'PRIMARY KEY';

alter table accounts2008 
drop constraint PK__Accounts__F267253E101420FE;

create clustered index Account_index2008 on accounts2008(accountid);

--2 :-
create nonclustered index customerNameIndex2008 on customers2008(CustomerName);

--3:-
create nonclustered index TransactionCompositeCluster on Transaction2008(TransactionDate, Amount);

--4:-
create unique index AccountNumberIndex on Accounts2008 (AccountNumber);

------------------------------------------------------------------------------------------------
--task 02

create function fn_interest2008(@accountID int)
returns decimal(10,2)
as
begin
	declare @totalInterest decimal(10,2)
	select @totalInterest = balence * 0.05 from accounts2008 where accountid = @accountid
	return @totalInterest;
end;

select * from dbo.fn_interest2008(1);

--------------------------------------------------------------------------------------------------------------
--task 03
create procedure TransferAmountProcedure2008 @FromAcountID int, @ToAccountID int
as 
begin