--- create a  Customer Table

create table Customer2008 (CustomerID int primary key, Cust_Name varchar(30),Cust_Phone bigint, Address varchar(40));

---create a Rooms table

create table Rooms2008 (RoomId int primary key, RoomType varchar(30), PricePerNight int, status bit);

----create a Bookings table

create table booking2008 (BookingID int primary key,CustomerID int foreign key (CustomerID) references customer2008(CustomerID),
roomid int foreign key (roomid) references rooms2008(roomid),
checkInDate date,checkOutDate date, TotalAmount int);

---Create Payments table

create table Payment2008 (paymentId int primary key, BookingID int foreign key (BookingID) references booking2008 (BookingID),
paymentDate date,Amount int, PaymentMethod varchar(30));

---Create Employee table

create table Employee2009 (emp_ID int primary key, emp_Name varchar(30),emp_Position varchar(30),Salary int,HireDate date, managerID int);

--Create a Service table

create table Service2008(serviceId int primary key, service_name varchar(30), Price int);

--create a HotelBranch table

create table HotelBranch2008(BranchId int primary key, BranchName varchar(30), Location varchar(30));

--create a Booking service table

create table BookingService2008 (BookingID int foreign key (BookingID) references booking2008(BookingID),
serviceId int foreign key (serviceId) references service2008(serviceId), ServiceTime time);

-------------------------------------------------------------------------------------------------------------------------------------------

---add the value in that table

INSERT INTO Customer2008 (CustomerID, Cust_Name, Cust_Phone, Address)
VALUES 
(1, 'John Doe', 9876543210, '123 Elm Street'),
(2, 'Jane Smith', 8765432109, '456 Oak Street'),
(3, 'Alice Johnson', 7654321098, '789 Pine Avenue'),
(4, 'Bob Brown', 6543210987, '321 Maple Road'),
(5, 'Carol White', 5432109876, '654 Cedar Lane');

INSERT INTO Customer2008 (CustomerID, Cust_Name, Cust_Phone, Address)
VALUES (6,'Gokul Ganesh',7249684774,'Lakshmi Puri Kolhapur'),
(7,'Anjali Sharma', 784595654858, 'Jammu');



INSERT INTO Rooms2008 (RoomId, RoomType, PricePerNight, status)
VALUES 
(101, 'Single', 1000, 1),
(102, 'Double', 1500, 1),
(103, 'Suite', 3000, 0),
(104, 'Deluxe', 2500, 1),
(105, 'Economy', 800, 0);


select * from Rooms2008;

INSERT INTO booking2008 (BookingID, CustomerID, roomid, checkInDate, checkOutDate, TotalAmount)
VALUES 
(11, 1, 101, '2025-02-20', '2025-02-23', 4500),
(12, 2, 102, '2025-02-21', '2025-02-25', 12000),
(13, 3, 103, '2025-02-19', '2025-02-21', 2000),
(14, 4, 104, '2025-02-22', '2025-02-24', 1600),
(15, 5, 105, '2025-02-20', '2025-02-23', 7500);


INSERT INTO booking2008 (BookingID, CustomerID, roomid, checkInDate, checkOutDate, TotalAmount)
VALUES 
(16, 1, 102, '2025-02-20', '2025-02-23', 8500),
(17, 2, 101, '2025-02-20', '2025-02-23', 4900);

INSERT INTO Payment2008 (paymentId, BookingID, paymentDate, Amount, PaymentMethod)
VALUES 
(111, 11, '2025-02-20', 4500, 'Credit Card'),
(222, 12, '2025-02-21', 12000, 'Debit Card'),
(333, 13, '2025-02-19', 2000, 'Cash'),
(444, 14, '2025-02-22', 1600, 'Credit Card'),
(555, 15, '2025-02-20', 7500, 'Bank Transfer');

insert into Employee2009 (emp_ID, emp_Name, emp_Position, Salary, HireDate, managerID) values 
(1001, 'Raj Patel', 'Manager', 60000, '2022-01-10', NULL),
(1002, 'Neha Singh', 'Receptionist', 30000, '2022-02-15', 1),
(1003, 'Amit Kumar', 'Chef', 40000, '2022-03-20', 1),
(1004, 'Priya Sharma', 'Housekeeper', 25000, '2022-04-25', 1),
(1005, 'Vikram Malhotra', 'Bellboy', 20000, '2022-05-30', 1);

insert into Service2008 (serviceId, service_name, Price) values 
(10, 'Room Cleaning', 500),
(20, 'Laundry Service', 300),
(30, 'Spa Treatment', 1500),
(40, 'Airport Pickup', 1000),
(50, 'Gym Access', 200);

insert into HotelBranch2008 (BranchId, BranchName, Location) values 
(21, 'Downtown Retreat', 'Mumbai'),
(22, 'Beachside Haven', 'Goa'),
(23, 'Mountain Resort', 'Shimla'),
(24, 'City Central', 'Delhi'),
(25, 'Country Side', 'Pune');

insert into BookingService2008 (BookingID, serviceId, ServiceTime) values 
(11, 10, '09:00:00'),
(12, 20, '10:00:00'),
(13, 30, '11:00:00'),
(14, 40, '12:00:00'),
(15, 50, '13:00:00');

-------------------------------------------------------------------------------------------------------------------------------

--task 2.1

select i.cust_Name, k.roomType, j.checkInDate,j.totalAmount  from Customer2008 as i 
inner join booking2008 as j on j.CustomerID = i.CustomerID
inner join Rooms2008 as k on j.roomID = k.roomid
where i.CustomerID = j.CustomerID;

--task 2.2

select e1.emp_Name, e2.emp_name as Manager from employee2009 as e1
left join employee2009 as e2 on e1.managerID = e2.emp_id;

select * from employee2009;

update employee2009
set managerid= 1001
where managerid = 1

--task 2.3

select * from rooms2008 
where roomid not in 
(select r.roomid from rooms2008 as r
inner join booking2008 as b on r.roomid = b.roomid);
--alternate for that querry
select * from rooms2008
where status = 0

---task 3
--task3.1

select * from booking2008 as b
join customer2008 as c on b.CustomerID = c.CustomerID
having count( c.CustomerID)>1;

--task 3.2

select * from booking2008
where TotalAmount = (select max(TotalAmount) from booking2008);

--------
--Task 4
--Task 4.1

create view ActiveBookings2008 as 
select c.cust_Name, r.RoomType, b.checkInDate,b.CheckOutDate 
from booking2008 as b
join customer2008 as c on b.customerId = c.customerID
join rooms2008 as r on b.roomid = r.roomID
where r.status = 1;

select * from ActiveBookings2008;

--task 5
--task 5.1
create clustered index RoomTypeIndex on rooms2008(roomtype);

--Task 5.2
create clustered index DateIndex2008 on booking2008(checkInDate, checkoutDate);

--Task 6
--task 6.1

create procedure TotalRevenu2008 @month int
as 
begin 
	select sum(amount) as TotalRevenu from Payment2008 
	where month(paymentDate) = @month;
end;

exec TotalRevenu2008 2;

--Task 6.2

create function fn_TotalDays2008()
returns int
as
begin
	declare @TotalDay int
	select @TotalDay = day(checkInDate) - day(checkOutDate) from booking2008;
	return @TotalDay
end;

select * from dbo.fn_TotalDays2008();

-----
---Task 7

create trigger UpdateRoomStatus2009 on booking2008
for delete
as 
begin
	declare @bookingId int
	declare @roomID int
	select @bookingId = bookingID from inserted;
	select @roomID = roomid from booking2008 where bookingid = @bookingId;
	update rooms2008
	set status = 1
	where roomid = @roomId ;
end;

delete from booking2008
where bookingid = 13;

select * from booking2008;
select * from rooms2008;
--Task 8

create role HotalManager;
grant select, insert update,delete on booking2008 to HotalManager;
grant select , insert, update on Payment2008 to hotalMnager;
 


