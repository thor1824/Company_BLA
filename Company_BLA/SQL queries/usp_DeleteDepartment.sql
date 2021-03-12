-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE usp_DeleteDepartment
	@DNumber int
AS
BEGIN
	DELETE FROM dbo.Department WHERE DNumber = @DNumber;
END
