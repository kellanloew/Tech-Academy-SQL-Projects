USE [LibraryManagement]
GO
/****** Object:  StoredProcedure [dbo].[query2]    Script Date: 2/1/2019 3:03:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- How many copies of the book titled "The Lost Tribe" are owned by each library branch?
CREATE Procedure [dbo].[query2]
As
Select l.lib_BranchName As 'Library Branch', c.Number_of_copies As 'Number of Copies'
From books.Copies c
Inner Join books.Books b On b.BookID = c.BookID
Inner Join library_branch l On l.lib_BranchID = c.BranchID
Where b.title = 'The Lost Tribe'
GO
