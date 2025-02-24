use JIBE_Main_Training;

select * from employee2008;

exec sp_help employee2008;

INSERT INTO employee2008 VALUES
(101, 'Alice', 'Smith', 'Engineer', 25, '2025-02-24'),
(102, 'Bob', 'Johnson', 'Designer', 30, '2025-03-15'),
(103, 'Charlie', 'Williams', 'Manager', 45, '2025-01-01'),
(104, 'David', 'Brown', 'Developer', 28, '2025-02-10'),
(105, 'Eve', 'Jones', 'Analyst', 35, '2025-04-05'),
(106, 'Frank', 'Garcia', 'Architect', 40, '2025-02-20'),
(107, 'Grace', 'Martinez', 'Consultant', 32, '2025-05-18'),
(108, 'Henry', 'Rodriguez', 'Teacher', 27, '2025-06-14'),
(109, 'Isabel', 'Martinez', 'Artist', 29, '2025-07-20'),
(110, 'Jack', 'Anderson', 'Scientist', 50, '2025-08-22'),
(111, 'Karen', 'Harris', 'Nurse', 33, '2025-09-10'),
(112, 'Leo', 'Clark', 'Pilot', 38, '2025-10-05'),
(113, 'Mia', 'Lewis', 'Chef', 26, '2025-11-12'),
(114, 'Noah', 'Walker', 'Lawyer', 42, '2025-12-01'),
(115, 'Olivia', 'Hall', 'Pharmacist', 31, '2025-01-15'),
(116, 'Paul', 'Allen', 'Dentist', 37, '2025-02-25'),
(117, 'Quinn', 'Young', 'Therapist', 29, '2025-03-30'),
(118, 'Rachel', 'King', 'Journalist', 34, '2025-04-22'),
(119, 'Sam', 'Wright', 'Photographer', 28, '2025-05-14'),
(120, 'Tina', 'Scott', 'Librarian', 36, '2025-06-18'),
(121, 'Uma', 'Green', 'Veterinarian', 32, '2025-07-25'),
(122, 'Victor', 'Adams', 'Firefighter', 39, '2025-08-30'),
(123, 'Wendy', 'Baker', 'Paramedic', 27, '2025-09-15'),
(124, 'Xander', 'Nelson', 'Electrician', 41, '2025-10-20'),
(125, 'Yara', 'Carter', 'Plumber', 30, '2025-11-05'),
(126, 'Zane', 'Mitchell', 'Mechanic', 35, '2025-12-10'),
(127, 'Ava', 'Perez', 'Scientist', 29, '2025-01-20'),
(128, 'Ben', 'Roberts', 'Engineer', 33, '2025-02-28'),
(129, 'Clara', 'Turner', 'Designer', 31, '2025-03-25'),
(130, 'Dylan', 'Phillips', 'Manager', 44, '2025-04-15');

INSERT INTO employee2008 VALUES
(131, 'Ethan', 'Moore', 'Engineer', 26, '2025-05-10'),
(132, 'Fiona', 'Taylor', 'Designer', 34, '2025-06-05'),
(133, 'George', 'Anderson', 'Manager', 46, '2025-07-01'),
(134, 'Hannah', 'Thomas', 'Developer', 29, '2025-08-10'),
(135, 'Ian', 'Jackson', 'Analyst', 36, '2025-09-05'),
(136, 'Julia', 'White', 'Architect', 41, '2025-10-20'),
(137, 'Kevin', 'Harris', 'Consultant', 33, '2025-11-18'),
(138, 'Laura', 'Martin', 'Teacher', 28, '2025-12-14'),
(139, 'Michael', 'Rodriguez', 'Artist', 30, '2025-01-20'),
(140, 'Natalie', 'Martinez', 'Scientist', 51, '2025-02-22'),
(141, 'Oliver', 'Clark', 'Nurse', 34, '2025-03-10'),
(142, 'Penelope', 'Lewis', 'Pilot', 39, '2025-04-05'),
(143, 'Quincy', 'Walker', 'Chef', 27, '2025-05-12'),
(144, 'Rebecca', 'Hall', 'Lawyer', 43, '2025-06-01'),
(145, 'Steven', 'Allen', 'Pharmacist', 32, '2025-07-15'),
(146, 'Tracy', 'Young', 'Dentist', 38, '2025-08-25'),
(147, 'Ursula', 'King', 'Therapist', 30, '2025-09-30'),
(148, 'Victor', 'Wright', 'Journalist', 35, '2025-10-22'),
(149, 'Wendy', 'Scott', 'Photographer', 29, '2025-11-14'),
(150, 'Xavier', 'Green', 'Librarian', 37, '2025-12-18'),
(151, 'Yvonne', 'Adams', 'Veterinarian', 33, '2025-01-25'),
(152, 'Zachary', 'Baker', 'Firefighter', 40, '2025-02-28'), -- Corrected date
(153, 'Aiden', 'Nelson', 'Paramedic', 28, '2025-03-15'),
(154, 'Bella', 'Carter', 'Electrician', 42, '2025-04-20'),
(155, 'Caleb', 'Mitchell', 'Plumber', 31, '2025-05-05'),
(156, 'Diana', 'Perez', 'Mechanic', 36, '2025-06-10'),
(157, 'Eli', 'Roberts', 'Scientist', 30, '2025-07-20'),
(158, 'Faith', 'Turner', 'Engineer', 34, '2025-08-28'),
(159, 'Gavin', 'Phillips', 'Designer', 32, '2025-09-25'),
(160, 'Holly', 'Moore', 'Manager', 45, '2025-10-15');

/*
DECLARE @StartTime DATETIME
DECLARE @EndTime DATETIME*/

set statistics io on;
select * from employee2008 where empno = 159 ;
set statistics io off;

/*
SET @StartTime = GETDATE()
select * from employee2008 where empno = 159 ;
SET @EndTime = GETDATE()
PRINT 'Normal Search Time: ' + CAST(DATEDIFF(MILLISECOND, @StartTime, @EndTime) AS VARCHAR) + ' milliseconds';*/

CREATE CLUSTERED INDEX emp_index ON employee2008 (empno);


set statistics time on;
select * from employee2008 where empno > 159 and salery > 40 ;
print 'this is my time'
set statistics time off;



drop  index empCompIndex on employee2008;

create clustered index empCompIndex on employee2008 (empno,department);


-----------------------------------------------------------------------------------------------------
----Function

create function fn_getSumOfSalary2008(@empno int)
returns decimal(10,2)
as 
begin
	declare @totalSalary decimal(10,2)
	select @totalSalary = sum(salery) from employee2008 where empno = @empno;
	return @totalSalary
end;

drop function fn_getSumOfSalary2008;

select dbo.fn_getSumOfSalary2008(101) as totalval;

------------------------------------------------------------------------------------------
---Procedure

create procedure pr_getTotalSalary @empno int, @totalSalary decimal(10,2) output
as 
begin
	select @totalSalary = sum(salery) from employee2008 where empno = @empno;
	print @totalSalary
end;

drop procedure pr_getTotalSalary;


declare @totalSalary1 decimal(10,2)=0;
exec  pr_getTotalSalary 101 ,@totalSalary output;

print 'Total Salary is' + cast(@totalSalary as decimal);
	


