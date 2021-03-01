USE [Company]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetAllDepartments]    Script Date: 3/1/2021 3:42:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[usp_GetAllDepartments]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT d.DNumber, d.DName, d.MgrSSN, d.MgrStartDate, count(e.SSN) as NoEmployee
	FROM Department as d LEFT JOIN Employee as e ON e.Dno = d.DNumber
	GROUP BY d.DNumber, d.DName, d.MgrSSN, d.MgrStartDate;
END
