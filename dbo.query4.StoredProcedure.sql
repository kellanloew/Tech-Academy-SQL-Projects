USE [LibraryManagement]
GO
/****** Object:  StoredProcedure [dbo].[query4]    Script Date: 2/1/2019 3:03:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today,
   retrieve the book title, the borrower's name, and the borrower's address.
*/
Create Proc [dbo].[query4]
As
Select b.title, bo.bor_Name, bo.bor_Address
From books.Books b
Inner Join books.loans lo ON b.bookID = lo.BookID
Inner Join borrower bo On bo.bor_CardNo = lo.CardNo
Inner Join library_branch l On l.lib_BranchID = lo.BranchID
Where l.lib_BranchName = 'Sharpstown' AND lo.DateDue = CONVERT (date, GETDATE())
GO
