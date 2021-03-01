USE [Company]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetDepartment]    Script Date: 3/1/2021 3:39:13 PM ******/
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
	FROM Department as d, Employee as e
	WHERE e.Dno = d.DNumber AND d.DNumber = 4
	GROUP BY d.DNumber, d.DName, d.MgrSSN, d.MgrStartDate;
END
