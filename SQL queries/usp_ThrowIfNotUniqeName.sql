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
ALTER PROCEDURE [dbo].[usp_ThrowIfNotUniqeName]
	@DName varchar(50)
AS
BEGIN
	SET NOCOUNT ON;

	if @DName in ( SELECT	DName from dbo.Department)
		RaisError('DName already exist',16,1)
END
