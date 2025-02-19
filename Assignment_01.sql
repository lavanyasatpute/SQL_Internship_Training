use JIBE_Main_Training;
create table Employee2008(
EMPno int,
EName varchar(30),
);

alter table Employee2008
add email varchar(30);

alter table Employee2008
add Department varchar(30);

alter table Employee2008
add Salery int;

alter table Employee2008
add Joindate Date;

select * from Employee2008;

INSERT INTO Employee2008 VALUES (1, 'Gokul', 'gokul@jibe.com', 'Development', 20000, '2025-02-25');

insert into Employee2008 values (2, 'ram', 'ram@gmail.com', 'IT', 30000,'2020-05-16');


-- delete from employee2008 where EMPno ();


CREATE table Orders2008(orderID int, CustomerName varchar(30), ProductName varchar(30), Quantity int, Price int, OrderDate Date);

insert into Orders2008 values (1 , 'anjali', 'pen', 2 , 50, '2025-02-19');

INSERT INTO Orders2008 VALUES (2, 'rohit', 'notebook', 5, 100, '2025-02-20');
INSERT INTO Orders2008 VALUES (3, 'neha', 'marker', 3, 75, '2025-02-21');
INSERT INTO Orders2008 VALUES (4, 'amit', 'eraser', 10, 20, '2025-02-22');
INSERT INTO Orders2008 VALUES (5, 'kavita', 'pencil', 8, 40, '2025-02-23');
INSERT INTO Orders2008 VALUES (6, 'rahul', 'stapler', 1, 150, '2025-02-24');
INSERT INTO Orders2008 VALUES (7, 'priya', 'glue', 6, 30, '2025-02-25');
INSERT INTO Orders2008 VALUES (8, 'suman', 'scissors', 2, 60, '2025-02-26');
INSERT INTO Orders2008 VALUES (9, 'vikas', 'highlighter', 4, 80, '2025-02-27');
INSERT INTO Orders2008 VALUES (10, 'anita', 'paper', 20, 200, '2025-02-28');

select * from Orders2008;

update Orders2008
set ProductName='Book'
where orderID=5;
 
-- delete table LDemo;

-- select * from ldemo;
-- insert into ldemo values('Lavanya');

create table patient2008(patientsID int identity(1,1) primary key, PName varchar(30),PAge int, PDesease varchar(30), DoctorAssinged varchar(30));


INSERT INTO patient2008 (PName, PAge, PDesease, DoctorAssinged) VALUES ('Ananya', 25, 'Flu', 'Dr. Sharma');
INSERT INTO patient2008 (PName, PAge, PDesease, DoctorAssinged) VALUES ('Raj', 34, 'Asthma', 'Dr. Verma');
INSERT INTO patient2008 (PName, PAge, PDesease, DoctorAssinged) VALUES ('Priya', 29, 'Diabetes', 'Dr. Kapoor');
INSERT INTO patient2008 (PName, PAge, PDesease, DoctorAssinged) VALUES ('Arjun', 42, 'Hypertension', 'Dr. Mehta');
INSERT INTO patient2008 (PName, PAge, PDesease, DoctorAssinged) VALUES ('Sneha', 37, 'Migraine', 'Dr. Joshi');
INSERT INTO patient2008 (PName, PAge, PDesease, DoctorAssinged) VALUES ('Vikram', 50, 'Arthritis', 'Dr. Iyer');
INSERT INTO patient2008 (PName, PAge, PDesease, DoctorAssinged) VALUES ('Divya', 28, 'Anemia', 'Dr. Rao');
INSERT INTO patient2008 (PName, PAge, PDesease, DoctorAssinged) VALUES ('Rohit', 31, 'Bronchitis', 'Dr. Patil');
INSERT INTO patient2008 (PName, PAge, PDesease, DoctorAssinged) VALUES ('Meera', 45, 'Thyroid', 'Dr. Singh');
INSERT INTO patient2008 (PName, PAge, PDesease, DoctorAssinged) VALUES ('Amit', 39, 'Allergy', 'Dr. Das');

select * from patient2008
where PAge>40;

select * from patient2008
where DoctorAssinged = 'Dr. Mehta';

select PDesease, count(PDesease) from patient2008 group by PDesease;

checkpoint;




