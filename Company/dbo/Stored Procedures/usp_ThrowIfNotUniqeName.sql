-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ThrowIfNotUniqeName]
	@DName varchar(50)
AS
BEGIN
	SET NOCOUNT ON;

	if @DName in ( SELECT DName from dbo.Department)
		RaisError('Department Name already exist',16,1)
END
