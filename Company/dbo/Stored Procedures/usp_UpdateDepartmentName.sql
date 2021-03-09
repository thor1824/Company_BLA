-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_UpdateDepartmentName]
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
