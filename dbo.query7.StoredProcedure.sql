USE [LibraryManagement]
GO
/****** Object:  StoredProcedure [dbo].[query7]    Script Date: 2/1/2019 3:03:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*For each book authored (or co-authored) by "Stephen King",
retrieve the title and the number of copies owned by the library branch whose name is "Central".
*/
Create proc [dbo].[query7]
As
Select b.title 'Title', c.Number_of_copies 'Number of Copies'
From books.Copies c
Inner Join books.Authors a On a.BookID = c.BookID
Inner Join books.Books b On b.BookID = a.BookID
Inner Join library_branch l On l.lib_BranchID = c.BranchID
Where a.author_Name = 'Stephen King' AND l.lib_BranchName = 'Central';
GO
