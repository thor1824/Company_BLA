-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ThrowIfIsManager]
	@MgrSSN numeric(9, 0)
AS
BEGIN
	SET NOCOUNT ON;

	if @MgrSSN in ( SELECT MgrSSN from dbo.Department)
		RaisError('Employee is already Manager og a Department', 16, 1)
END
