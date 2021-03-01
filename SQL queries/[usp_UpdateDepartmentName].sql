USE [Company]
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateDepartmentName]    Script Date: 01-03-2021 12:52:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[usp_UpdateDepartmentName]
	@DNumber int,
	@DName varchar(50)
AS
BEGIN
SET NOCOUNT ON;

	Exec dbo.usp_ThrowIfNotUniqeName @DName = @DName

	UPDATE Department 
	SET  DName = @DName
	WHERE DNumber = @DNumber

END
