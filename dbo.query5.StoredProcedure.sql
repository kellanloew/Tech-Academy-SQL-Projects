USE [LibraryManagement]
GO
/****** Object:  StoredProcedure [dbo].[query5]    Script Date: 2/1/2019 3:03:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- For each library branch, retrieve the branch name and the total number of books loaned out from that branch.
Create Proc [dbo].[query5]
As

Select br.lib_BranchName As 'Branch Name', Count(l.BookID) As 'Number of loans'
From library_branch br
Inner Join books.loans l On l.BranchID = br.lib_branchID
Group By br.lib_BranchName;
GO
