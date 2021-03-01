USE [Company]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetDepartment]    Script Date: 3/1/2021 3:44:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[usp_GetDepartment]
	@DNumber int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT d.DNumber, d.DName, d.MgrSSN, d.MgrStartDate, count(e.SSN) as NoEmployee
	FROM Department as d LEFT JOIN Employee as e ON e.Dno = d.DNumber
	WHERE  d.DNumber = @DNumber
	GROUP BY d.DNumber, d.DName, d.MgrSSN, d.MgrStartDate;
END