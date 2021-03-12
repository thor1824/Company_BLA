-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetDepartment2]
	@DNumber int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT *
	FROM [dbo].[DeparmentEmpCount] as d
	WHERE d.DNumber = @DNumber
END