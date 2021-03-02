-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetAllDepartments]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT d.DNumber, d.DName, d.MgrSSN, d.MgrStartDate, count(e.SSN) as NoEmployee
	FROM Department as d LEFT JOIN Employee as e ON e.Dno = d.DNumber
	GROUP BY d.DNumber, d.DName, d.MgrSSN, d.MgrStartDate;
END
