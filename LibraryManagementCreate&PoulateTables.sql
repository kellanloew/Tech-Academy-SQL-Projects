Create Database LibraryManagement;

IF NOT EXISTS(SELECT * FROM sys.schemas WHERE name = 'books')
BEGIN
    execute('CREATE SCHEMA books');
END;

Create table library_branch(
	lib_BranchID INT Primary Key Not Null Identity (1,1),
	lib_BranchName varchar(30) Not Null,
	lib_Address varchar(30) Not Null
);

Insert into library_branch
(lib_BranchName, lib_Address)
Values
('Sharpstown', '548 W Foothill Rd'),
('Central', '1700 Garden Pl'),
('Corky-Martinez', '649 18th Ave'),
('Hoover''s Closet', '2493 Ghetto St')
;

Select * from library_branch;

Create table publisher(
	pub_PublisherName varchar(30) primary key not null,
	pub_Address varchar(60) not null,
	pub_Phone varchar(15) not null
);

Insert into publisher
(pub_PublisherName, pub_Address, pub_Phone)
Values
('Benziger Brothers', '234 Dartmouth Ave, New York, NY, 56928', '523-234-9623'),
('Cambridge', '1789 E. Central St, Chicago, IL, 26793', '253-106-0011'),
('Hackett', '3333 Massachusetts Ave, Indianapolis, IN 46218', '533-125-1052'),
('Oxford', '14 N Wild St., New York, NY, 56923', '652-125-3910'),
('Dover', 'DE3 Island, Dublin, Ireland, 9FD4', '5-23-243-1403'),
('Penguin Classics', '593 Regency Dr, Chicago, IL, 05932', '634-322-9623')
;

Select * from publisher;

Create table borrower(
	bor_CardNo Int primary key not null,
	bor_Name varchar(20) not null,
	bor_Address varchar(60) not null,
	bor_Phone varchar(15) not null
);

Insert into borrower
	(bor_CardNo, bor_Name, bor_Address, bor_Phone)
Values
	(19534872, 'Ronnie Milsap', '142 Hight St, Denver, CO, 14982', '142-636-2532'),
	(19234232, 'Glenn Miller', '12543 Joy St, Los Angeles, CA, 10953', '883-992-2533'),
	(159823, 'Steve Jobs', '1253 Kilpatrick Ln, Brookfield, CT, 82454', '152-636-2532'),
	(9912304, 'Bill Gates', '358 Krill Blvd, Post Falls, ID, 29853', '142-636-8234'),
	(135702, 'Charles DeGaulle', '9897 Unity Blvd, Houston, TX, 14982', '723-345-4552'),
	(246832, 'Antonin Dvorak', '25JK Liegst Rott, Prague, Czech, 2NT029', '1-203-23432'),
	(1562353, 'Allison Kneuper', '29034 Lakeview Dr, Wamego, KS, 56340', '142-999-2532'),
	(2195387, 'Isabelle Nonsense', '234 Ninja St, Gas, KS, 29853', '264-234-1509'),
	(6230942, 'Mary Smith', '7343 Starlight Ln, Bozeman, MT, 12431', '291-636-2532'),
	(554433, 'Kim Phan', 'Oregon St., Topeka, KS, 57123', '211-333-2532'),
	(86534872, 'Flannery O''Connor', '283 Humid Rd, Savannah, GA, 37495', '253-354-6444'),
	(7369834, 'Kathleen Flamba', '8927 Rochester Blvd, Alhambra, VA, 72943', '888-636-2532')
;

Select * from borrower;

CREATE TABLE [books].[Books](
	BookID INT Primary Key Not Null Identity (1,1),
	Title varchar(50) not null,
	pub_PublisherName varchar(30) Constraint fk_pub_name Foreign Key References publisher(pub_PublisherName) On delete cascade on update cascade
);

Insert into books.Books
(Title, pub_PublisherName)
Values
('Metaphysics of Morals', 'Hackett'),
('The Rise of Rome', 'Oxford'),
('A study in Words', 'Cambridge'),
('Dubliners', 'Dover'),
('Gulliver''s Travels', 'Dover'),
('The Leviathan', 'Hackett'),
('Dialogues', 'Hackett'),
('Catholic National Reader 2', 'Benziger Brothers'),
('Catholic National Reader 3', 'Benziger Brothers'),
('Catholic National Reader 4', 'Benziger Brothers'),
('On Duties', 'Cambridge'),
('Confessions', 'Oxford'),
('Divine Comedy', 'Penguin Classics'),
('Emma', 'Penguin Classics'),
('Death of Ivan Ilyich', 'Penguin Classics'),
('Gunnarsdatter', 'Penguin Classics'),
('Pride and Prejudice', 'Penguin Classics'),
('Brothers Karamazov', 'Penguin Classics'),
('Rules for the Direction of the Mind', 'Penguin Classics'),
('On Government', 'Hackett'),
('Essays on the Theory of Numbers', 'Dover'),
('The Lost Tribe', 'Hackett'),
('Don''t fear!', 'Oxford')
;

Select * from books.Books;

Create Table books.Authors(
	BookID Int Constraint fk_book_id Foreign Key References books.Books(BookID) on delete cascade on update cascade,
	author_Name varchar(20) not null
);

Insert into books.Authors
(BookID, author_Name)
Values
(1, 'Immanuel Kant'),
(2, 'Livy'),
(3, 'C.S. Lewis'),
(4, 'James Joyce'),
(5, 'Jonathan Swift'),
(6, 'Thomas Hobbes'),
(7, 'Plato'),
(8, 'Various'),
(9, 'Various'),
(10, 'Various'),
(11, 'Cicero'),
(12, 'St. Augustine'),
(13, 'Dante'),
(14, 'Jane Austen'),
(15, 'Leo Tolstoy'),
(16, 'Sigrid Undset'),
(17, 'Jane Austen'),
(18, 'Fyodor Dostoevsky'),
(19, 'Rene Descartes'),
(20, 'John Locke'),
(21, 'Richard Dedekind'),
(22, 'Stephen King'),
(23, 'Stephen King')
;

Select * from books.Authors;

Create table books.Copies(
	BookID int Constraint fk_bookCopies Foreign Key References books.Books(BookID) on delete cascade on update cascade,
	BranchID int Constraint fk_branchID Foreign Key References library_branch(lib_BranchID) on delete cascade on update cascade,
	Number_of_copies int not null
);


Insert into books.Copies
(BookID, BranchID, Number_of_copies)
Values
(1, 1, 2),
(1, 2, 3),
(1, 3, 2),
(1, 4, 2),
(2, 1, 2),
(2, 4, 2),
(2, 2, 3),
(2, 3, 2),
(3, 1, 2),
(3, 2, 3),
(3, 3, 2),
(3, 4, 0),
(4, 1, 5),
(4, 4, 4),
(4, 2, 3),
(4, 3, 2),
(5, 1, 2),
(5, 2, 3),
(5, 3, 0),
(5, 4, 0),
(6, 1, 0),
(6, 4, 3),
(6, 2, 3),
(6, 3, 2),
(7, 1, 3),
(7, 2, 3),
(7, 3, 2),
(7, 4, 0),
(8, 1, 2),
(8, 2, 3),
(8, 4, 2),
(8, 3, 2),
(9, 1, 2),
(9, 2, 3),
(9, 3, 3),
(9, 4, 0),
(10, 1, 2),
(10, 2, 0),
(10, 3, 2),
(10, 4, 3),
(11, 1, 2),
(11, 2, 3),
(11, 3, 2),
(11, 4, 0),
(12, 1, 3),
(12, 2, 5),
(12, 3, 2),
(12, 4, 3),
(13, 1, 0),
(13, 2, 3),
(13, 3, 2),
(13, 4, 0),
(14, 1, 2),
(14, 4, 2),
(14, 2, 3),
(14, 3, 2),
(15, 1, 2),
(15, 2, 3),
(15, 3, 2),
(15, 4, 0),
(16, 1, 0),
(16, 2, 3),
(16, 4, 6),
(16, 3, 2),
(17, 1, 2),
(17, 2, 3),
(17, 3, 4),
(17, 4, 0),
(18, 1, 2),
(18, 2, 3),
(18, 4, 2),
(18, 3, 2),
(19, 1, 2),
(19, 2, 3),
(19, 3, 2),
(19, 4, 0),
(20, 1, 4),
(20, 2, 3),
(20, 3, 2),
(20, 4, 0),
(21, 1, 2),
(21, 2, 3),
(21, 3, 3),
(21, 4, 4),
(22, 1, 2),
(22, 2, 3),
(22, 3, 4),
(22, 4, 0),
(23, 1, 2),
(23, 2, 4),
(23, 3, 2),
(23, 4, 8)
;

Select * from books.Copies;

Create table books.Loans(
	BookID Int Constraint fk_loans_bookID Foreign Key References books.Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID Int Constraint fk_loans_branchID Foreign Key References library_branch(lib_BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	CardNo Int Constraint fk_loans_cardNo Foreign Key References borrower(bor_CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut Date not null,
	DateDue Date not null
);

Insert into books.Loans
(BookID, BranchID, CardNo, DateOut, DateDue)
Values
(1, 1, 9912304, '2019-01-17', CONVERT (date, GETDATE())),
(2, 4, 554433, '2019-02-06', '2019-03-19'),
(3, 1, 246832, '2019-01-17', CONVERT (date, GETDATE())),
(4, 1, 6230942, '2019-01-06', '2019-01-19'),
(4, 1, 246832, '2019-01-06', '2019-01-19'),
(4, 1, 6230942, '2019-01-06', '2019-01-19'),
(4, 2, 19234232, '2019-01-06', '2019-01-19'),
(5, 2, 1562353, '2019-01-06', '2019-01-19'),
(6, 2, 554433, '2019-02-06', '2019-03-19'),
(6, 4, 1562353, '2019-02-06', '2019-03-19'),
(6, 3, 246832, '2019-03-07', '2019-04-19'),
(6, 3, 159823, '2019-03-06', '2019-03-19'),
(7, 3, 159823, '2019-01-06', '2019-01-19'),
(8, 2, 19534872, '2019-01-06', '2019-01-19'),
(8, 3, 2195387, '2019-01-03', '2019-03-29'),
(8, 1, 7369834, CONVERT (date, GETDATE()), '2019-02-18'),
(8, 4, 7369834, CONVERT (date, GETDATE()), '2019-02-18'),
(9, 3, 2195387, '2019-01-06', '2019-01-19'),
(9, 3, 7369834, '2018-12-12', '2019-01-19'),
(10, 1, 6230942, '2019-01-17', CONVERT (date, GETDATE())),
(10, 3, 19234232, '2019-01-17', CONVERT (date, GETDATE())),
(11, 2, 19534872, '2019-01-17', CONVERT (date, GETDATE())),
(12, 3, 19234232, '2019-01-30', '2019-11-19'),
(12, 2, 135702, CONVERT (date, GETDATE()), '2019-02-17'),
(12, 2, 2195387, CONVERT (date, GETDATE()), '2019-02-17'),
(12, 4, 7369834, CONVERT (date, GETDATE()), '2019-02-18'),
(13, 2, 9912304, '2019-01-30', '2019-11-19'),
(13, 2, 554433, '2019-01-30', '2019-11-19'),
(13, 2, 2195387, CONVERT (date, GETDATE()), '2019-02-17'),
(14, 3, 6230942, '2019-01-30', '2019-11-19'),
(14, 1, 2195387, '2019-01-17', CONVERT (date, GETDATE())),
(15, 1, 159823, CONVERT (date, GETDATE()), '2019-02-17'),
(15, 1, 2195387, '2019-01-29', '2019-02-12'),
(15, 3, 246832, CONVERT (date, GETDATE()), '2019-02-17'),
(16, 3, 135702, CONVERT (date, GETDATE()), '2019-02-17'),
(16, 4, 2195387, '2019-01-29', '2019-02-01'),
(17, 2, 9912304, '2019-01-17', CONVERT (date, GETDATE())),
(17, 2, 159823, CONVERT (date, GETDATE()), '2019-02-17'),
(17, 3, 2195387, CONVERT (date, GETDATE()), '2019-02-17'),
(18, 1, 19234232, '2019-01-16', CONVERT (date, GETDATE())),
(18, 2, 19534872, '2019-01-17', CONVERT (date, GETDATE())),
(18, 3, 159823, '2018-12-12', '2019-01-19'),
(19, 3, 6230942, '2019-02-27', '2019-10-19'),
(19, 3, 246832, '2019-02-27', '2019-10-19'),
(19, 1, 9912304, '2019-02-24', '2019-10-19'),
(20, 1, 9912304, '2019-02-27', '2019-10-19'),
(20, 1, 19534872, '2019-02-27', '2019-10-19'),
(20, 3, 159823, '2019-02-26', '2019-10-19'),
(21, 3, 9912304, '2019-02-25', '2019-10-19'),
(21, 2, 246832, '2019-01-30', '2019-07-19'),
(22, 2, 19534872, '2019-01-17', CONVERT (date, GETDATE())),
(22, 3, 7369834, '2018-12-12', '2019-01-19'),
(23, 2, 19534872, '2019-01-17', CONVERT (date, GETDATE())),
(23, 4, 246832, '2019-01-30', '2019-07-19'),
(23, 4, 159823, '2019-01-30', '2019-07-19'),
(23, 4, 9912304, '2019-01-30', '2019-07-19')
;

Select * from books.Loans;

