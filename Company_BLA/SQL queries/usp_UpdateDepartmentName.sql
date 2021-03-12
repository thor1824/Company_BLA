-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_UpdateDepartmentName]
	@DNumber int,
	@DName varchar(50)
AS
BEGIN TRY 
	BEGIN TRANSACTION;
		SET NOCOUNT ON;

		Exec dbo.usp_ThrowIfNotUniqeName @DName = @DName

		UPDATE Department 
		SET  DName = @DName
		WHERE DNumber = @DNumber

	COMMIT TRANSACTION;
END TRY  
BEGIN CATCH 
	if @@trancount > 0 ROLLBACK TRANSACTION;
    throw;
END CATCH
