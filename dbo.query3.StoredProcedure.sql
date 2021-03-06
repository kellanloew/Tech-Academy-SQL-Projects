USE [LibraryManagement]
GO
/****** Object:  StoredProcedure [dbo].[query3]    Script Date: 2/1/2019 3:03:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Retrieve the names of all borrowers who do not have any books checked out.

Create Proc [dbo].[query3]
As
Select b.bor_Name As 'Borrower'
From borrower b
Left Join books.loans l ON l.CardNo = b.bor_CardNo
Where l.CardNo IS Null
GO
