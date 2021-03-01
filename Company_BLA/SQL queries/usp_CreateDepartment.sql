SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE usp_CreateDepartment
	@DName varchar(50),
	@MgrSSN numeric(9, 0)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here
	declare @Today date = GETDATE();
	insert into Department(DName, MgrSSN, MgrStartDate)
	VALUES (@DName, @MgrSSN, @Today);

	return SCOPE_IDENTITY();
END
GO