USE [LibraryManagement]
GO
/****** Object:  StoredProcedure [dbo].[query1]    Script Date: 2/1/2019 3:03:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?

Create Proc [dbo].[query1]
As

Select c.Number_of_copies As 'Number of Copies'
From books.Copies c
INNER JOIN books.Books b On b.BookID = c.BookID
INNER JOIN library_branch r On r.lib_BranchID = c.BranchID
Where b.title = 'The Lost Tribe' AND r.lib_BranchName = 'Sharpstown'
;
GO
