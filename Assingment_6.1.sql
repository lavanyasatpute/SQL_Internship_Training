create table customers2008 (customerID int primary key, customerName varchar(30), email varchar(30), phoneNumber bigint);


create table Accounts2008(accountID int primary key,
customerID int foreign key (customerID) references customers2008 (customerID),
AccountNumber bigint, balence bigint , accountType varchar(30));

create table Transaction2008(TransactionID int primary key, AccountID int foreign key (accountID) references Accounts2008(accountID),
TransactionType varchar(30),amount bigint, TransactionDate date);

create table AuditTransaction2008 (AuditID int primary key, AccountID int foreign key (accountID) references Accounts2008(accountID),
Amount bigint, TransactionDate Date, Action varchar(30));

ALTER TABLE AuditTransaction2008
DROP CONSTRAINT PK__AuditTra__A17F23B87EAA1182;

alter table AuditTransaction2008
alter column AuditID date;

SELECT COLUMN_NAME, DATA_TYPE 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'AuditTransaction2008' AND COLUMN_NAME = 'AuditID';

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
create procedure TransferAmountProcedure2008 
	@FromAcountID int,
	@ToAccountID int, 
	@Amount int
as 
begin
	declare @fromAccountAmt int
	declare @toAccountAmt int
	select @fromAccountAmt = balence from Accounts2008 where accountID = @FromAcountID;
	select @toAccountAmt = balence from Accounts2008 where accountID = @ToAccountID;
	if @fromAccountAmt < @Amount
	begin
		Print 'Amount is to Low your account'
	end;
	else
	begin
		 update accounts2008 
		 set balence = @fromAccountAmt - @Amount
		 where accountID = @FromAcountID;
		 update accounts2008
		 set balence = @toAccountAmt + @Amount
		 where accountID = @ToAccountID;
	end;
end;
--------------------------------------------------------------------------------------------------------------------
--Task 04
create trigger checkBalance2008 on accounts2008
INSTEAD of update
as 
begin
	declare @Balance int;
	declare @currentBalance int
	declare @accountID int
	select @Balance = balence, @accountID = accountid   from inserted;
	select @currentBalance = balence from account2008 where accountid = @accountID ;

	if @balance < 0 and @currentBalance < @Balance
	begin
		print 'You dont have sufficient balance';
	end;
	else
	begin
		insert into AuditTransaction2008 (AuditID, AccountID, Amount, TransactionDate, Action )
		select getdate(), accountid ,balence, getdate(), 'updated' from inserted;
	end;
end;

-------------------------------------------------------------------------------------------------
--task 05
create trigger addTrasactionLog2008 on Transaction2008
after insert
as 
begin
	insert into AuditTransaction2008 (AuditID, AccountID, Amount, TransactionDate, Action )
	select TransactionID, AccountID,amount, getdate(),'Inserted' from inserted;
end;
------------------------------------------------------------------------------------------------------------------------




