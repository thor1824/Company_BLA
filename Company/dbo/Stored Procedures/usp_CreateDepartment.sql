-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_CreateDepartment]
	@DName VARCHAR(50),
	@MgrSSN NUMERIC(9, 0)
AS
BEGIN TRY 
	BEGIN TRANSACTION;
		SET NOCOUNT ON;

		EXEC [dbo].[usp_ThrowIfNotUniqeName] @DName = @DName;

		EXEC [dbo].[usp_ThrowIfIsManager] @MgrSSN = @MgrSSN;

		DECLARE @Today DATE = GETDATE();
		INSERT INTO Department(DName, MgrSSN, MgrStartDate)
		VALUES (@DName, @MgrSSN, @Today);

	COMMIT TRANSACTION;
	RETURN SCOPE_IDENTITY();	
END TRY  
BEGIN CATCH 
	if @@trancount > 0 ROLLBACK TRANSACTION;
    throw;
END CATCH
