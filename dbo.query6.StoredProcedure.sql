USE [LibraryManagement]
GO
/****** Object:  StoredProcedure [dbo].[query6]    Script Date: 2/1/2019 3:03:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*Retrieve the names, addresses, and the number of books checked out for all borrowers
who have more than five books checked out.
*/

Create Proc [dbo].[query6]
As
Select bor.bor_name, bor.bor_Address, Count(l.BookID)
From borrower bor
Inner Join books.Loans l On l.CardNo = bor.bor_CardNo
Group By bor.bor_Name, bor.bor_Address
Having Count(l.BookID) > 5;
GO
