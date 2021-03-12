-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetAllDepartments2]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * From [dbo].[DeparmentEmpCount]
END
