USE [Company]
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteDepartment]    Script Date: 3/1/2021 3:08:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[usp_DeleteDepartment]
	@DNumber int
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM dbo.Department WHERE DNumber = @DNumber;
END
