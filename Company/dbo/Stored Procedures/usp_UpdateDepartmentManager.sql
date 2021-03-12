-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_UpdateDepartmentManager]
	@DNumber int,
	@MgrSSN NUMERIC(9, 0)
AS
BEGIN TRY 
	BEGIN TRANSACTION;
		SET NOCOUNT ON;

		EXEC [dbo].[usp_ThrowIfIsManager] @MgrSSN = @MgrSSN;
		
		BEGIN TRY 
			UPDATE Employee 
			SET  SuperSSN = @MgrSSN
			WHERE Dno = @DNumber and SSN != @MgrSSN
		END TRY  
		BEGIN CATCH 
			throw;
		END CATCH

	COMMIT TRANSACTION;
	BEGIN TRANSACTION;

		UPDATE Department 
		SET  MgrSSN = @MgrSSN, MgrStartDate = CURRENT_TIMESTAMP
		WHERE DNumber = @DNumber

	COMMIT TRANSACTION;
END TRY  
BEGIN CATCH 
	if @@trancount > 0 ROLLBACK TRANSACTION;
    throw;
END CATCH
