USE [Company]
GO
/****** Object:  StoredProcedure [dbo].[usp_ThrowIfNotUniqeName]    Script Date: 01-03-2021 13:38:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[usp_ThrowIfIsManager]
	@MgrSSN numeric(9, 0)
AS
BEGIN
	SET NOCOUNT ON;

	if @MgrSSN in ( SELECT MgrSSN from dbo.Department)
		RaisError('Employee is already Manager og a Department', 16, 1)
END
