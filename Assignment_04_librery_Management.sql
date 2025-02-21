use jibe_main_training;

--------Authers Table-------
create table Authors2008 (authorID int primary key,firstName varchar(20) NOT NULL, LastName varchar(30)); 

alter table Authors2008 alter column LastName varchar(30) not null;
---------------------------------------------------------------------------------------------------------------
---------Books Table -------
create table Books2008 (bookID int, title varchar(30),PublishedYear varchar(4) check (PublishedYear>1500));


alter table books2008 alter column bookid int not null;

alter table Books2008
add constraint PK_bookID primary key (bookID);

alter table books2008 alter column title int not null;

ALTER TABLE books2008
ADD authorID INT;

alter table books2008 alter column authorID int not null;

alter table books2008 
add constraint FK_authorID2008 foreign key (authorID) references Authors2008 (authorID);
--------------------------------------------------------------------------------------------------------------------------
-------------Member Table----------------------
create table Member2008 (memberID int , f_Name varchar (30), L_name varchar(30), email varchar(30));

alter table member2008 alter column memberid int not null;

alter table Member2008
add constraint PK_memberID primary key (memberID);

alter table member2008 alter column f_Name int not null;
alter table member2008 alter column L_name int not null;

ALTER TABLE member2008
ALTER COLUMN email varchar(30) NOT NULL;

alter table member2008
ADD CONSTRAINT unique_email UNIQUE (email);

---------------------------------------------------------------------------------------------------------------------
----Loan table----------
create table Loan2008 (LoanID int , bookID int, memberID int , LoanDate Date, returnDate Date);

alter table Loan2008 alter column loanID int not null;

alter table loan2008
add constraint PK_loanID primary key (loanID);

alter table loan2008 
add constraint FK_bookID2008 foreign key (bookID) references books2008 (bookID);

alter table loan2008
add constraint FK_memberID2008 foreign key (memberID) references member2008 (memberid);

alter table loan2008 alter column loandate Date not null;

ALTER TABLE loan2008 
ADD CONSTRAINT chk_dates CHECK (returndate > LoanDate);
---------------------------------------------------------------------------
select * from Authors2008;

