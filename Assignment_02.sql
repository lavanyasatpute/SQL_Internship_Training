create table bookings2008(
	BookingID int primary key,
	CustomerName varchar(32),
	MovieName varchar(30),
	SeatBooked varchar(30),
	TotalPrice int
	);

INSERT INTO bookings2008 (BookingID, CustomerName, MovieName, SeatBooked, TotalPrice) VALUES (1, 'Aarav', 'Avatar 2', 'A12', 300);
INSERT INTO bookings2008 (BookingID, CustomerName, MovieName, SeatBooked, TotalPrice) VALUES (2, 'Meera', 'Avengers: Endgame', 'B15', 350);
INSERT INTO bookings2008 (BookingID, CustomerName, MovieName, SeatBooked, TotalPrice) VALUES (3, 'Rahul', 'Joker', 'C10', 250);
INSERT INTO bookings2008 (BookingID, CustomerName, MovieName, SeatBooked, TotalPrice) VALUES (4, 'Sneha', 'Frozen 2', 'D5', 400);
INSERT INTO bookings2008 (BookingID, CustomerName, MovieName, SeatBooked, TotalPrice) VALUES (5, 'Vikram', 'The Lion King', 'E8', 320);
INSERT INTO bookings2008 (BookingID, CustomerName, MovieName, SeatBooked, TotalPrice) VALUES (6, 'Ananya', 'Toy Story 4', 'F14', 280);
INSERT INTO bookings2008 (BookingID, CustomerName, MovieName, SeatBooked, TotalPrice) VALUES (7, 'Rohit', 'Spider-Man: Far From Home', 'G9', 350);
INSERT INTO bookings2008 (BookingID, CustomerName, MovieName, SeatBooked, TotalPrice) VALUES (8, 'Kavita', 'Aladdin', 'H6', 300);
INSERT INTO bookings2008 (BookingID, CustomerName, MovieName, SeatBooked, TotalPrice) VALUES (9, 'Arjun', 'Mission: Impossible - Fallout', 'I3', 370);
INSERT INTO bookings2008 (BookingID, CustomerName, MovieName, SeatBooked, TotalPrice) VALUES (10, 'Divya', 'Jurassic World', 'J2', 360);

select * from bookings2008;
begin transaction bookings;
save transaction bookings;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- before commit
INSERT INTO bookings2008 (BookingID, CustomerName, MovieName, SeatBooked, TotalPrice) VALUES (11, 'Mohan', 'Black Panther', 'K1', 340);
INSERT INTO bookings2008 (BookingID, CustomerName, MovieName, SeatBooked, TotalPrice) VALUES (12, 'Sneha', 'Bohemian Rhapsody', 'L2', 360);
INSERT INTO bookings2008 (BookingID, CustomerName, MovieName, SeatBooked, TotalPrice) VALUES (13, 'Vikas', 'Deadpool 2', 'M3', 320);
INSERT INTO bookings2008 (BookingID, CustomerName, MovieName, SeatBooked, TotalPrice) VALUES (14, 'Arjun', 'Aquaman', 'N4', 330);

rollback transaction;
select * from bookings2008;

-- After Rollback
INSERT INTO bookings2008 (BookingID, CustomerName, MovieName, SeatBooked, TotalPrice) VALUES (15, 'Priya', 'Incredibles 2', 'O5', 290);
INSERT INTO bookings2008 (BookingID, CustomerName, MovieName, SeatBooked, TotalPrice) VALUES (16, 'Nikhil', 'The Greatest Showman', 'P6', 370);
INSERT INTO bookings2008 (BookingID, CustomerName, MovieName, SeatBooked, TotalPrice) VALUES (17, 'Manisha', 'Venom', 'Q7', 320);

------------------------------------

INSERT INTO bookings2008 (BookingID, CustomerName, MovieName, SeatBooked, TotalPrice) VALUES (18, 'Ajay', 'A Star is Born', 'R8', 340);
INSERT INTO bookings2008 (BookingID, CustomerName, MovieName, SeatBooked, TotalPrice) VALUES (19, 'Preeti', 'Shazam!', 'S9', 300);
INSERT INTO bookings2008 (BookingID, CustomerName, MovieName, SeatBooked, TotalPrice) VALUES (20, 'Sahil', 'Dumbo', 'T10', 310);




