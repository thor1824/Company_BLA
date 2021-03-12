USE [Company]
GO

CREATE TABLE [dbo].[Tmp_Department](
	[DName] [varchar](50) NULL,
	[DNumber] [int] NOT NULL  IDENTITY(1, 1),
	[MgrSSN] [numeric](9, 0) NULL,
	[MgrStartDate] [datetime] NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
([DNumber] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET IDENTITY_INSERT dbo.Tmp_Department ON
GO

IF EXISTS ( SELECT * FROM dbo.Department ) 
    INSERT  INTO dbo.Tmp_Department ( DNumber, DName, MgrSSN, MgrStartDate)
            SELECT  DNumber,DName, MgrSSN, MgrStartDate
            FROM    dbo.Department TABLOCKX
GO

SET IDENTITY_INSERT dbo.Tmp_Department OFF
GO

ALTER TABLE dbo.Department DROP CONSTRAINT FK_Department_Employee;
GO
ALTER TABLE dbo.Dept_Locations DROP CONSTRAINT FK_Dept_Locations_Department;
GO
ALTER TABLE dbo.Employee DROP CONSTRAINT FK_Employee_Department;
GO
ALTER TABLE dbo.Project DROP CONSTRAINT FK_Project_Department;
GO

DROP TABLE dbo.Department
GO

Exec sp_rename 'Tmp_Department', 'Department'
GO

Exec sp_rename @objname = N'[dbo].[Department].[PK_Departments]', @newname = N'PK_Department'
GO

ALTER TABLE [dbo].[Department] ADD CONSTRAINT [FK_Department_Employee] FOREIGN KEY([MgrSSN])
REFERENCES [dbo].[Employee] ([SSN]) 
GO

ALTER TABLE [dbo].[Dept_Locations] ADD CONSTRAINT [FK_Dept_Locations_Department] FOREIGN KEY([DNUmber])
REFERENCES [dbo].[Department] ([DNumber]) ON DELETE CASCADE;
GO

ALTER TABLE [dbo].[Employee]  ADD CONSTRAINT [FK_Employee_Department] FOREIGN KEY([Dno])
REFERENCES [dbo].[Department] ([DNumber]) ON DELETE SET NULL;
GO

ALTER TABLE [dbo].[Project]  ADD CONSTRAINT [FK_Project_Department] FOREIGN KEY([DNum])
REFERENCES [dbo].[Department] ([DNumber]) ON DELETE CASCADE;
GO

--Alter CONSTRAINTS

ALTER TABLE dbo.Dept_Locations DROP CONSTRAINT FK_Dept_Locations_Department;
GO
ALTER TABLE dbo.Employee DROP CONSTRAINT FK_Employee_Department;
GO
ALTER TABLE dbo.Project DROP CONSTRAINT FK_Project_Department;
GO
ALTER TABLE dbo.Works_on DROP CONSTRAINT FK_Works_on_Project;
GO


ALTER TABLE [dbo].[Dept_Locations] ADD CONSTRAINT [FK_Dept_Locations_Department] FOREIGN KEY([DNUmber])
REFERENCES [dbo].[Department] ([DNumber]) ON DELETE CASCADE;
GO

ALTER TABLE [dbo].[Employee]  ADD CONSTRAINT [FK_Employee_Department] FOREIGN KEY([Dno])
REFERENCES [dbo].[Department] ([DNumber]) ON DELETE SET NULL;
GO

ALTER TABLE [dbo].[Project]  ADD CONSTRAINT [FK_Project_Department] FOREIGN KEY([DNum])
REFERENCES [dbo].[Department] ([DNumber]) ON DELETE CASCADE;
GO

ALTER TABLE [dbo].Works_on  ADD CONSTRAINT [FK_Works_on_Project] FOREIGN KEY([Pno])
REFERENCES [dbo].[Project] ([PNumber]) ON DELETE CASCADE;
GO


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
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE dbo.usp_ThrowIfNotUniqeName
	@DName varchar(50)
AS
BEGIN
	SET NOCOUNT ON;

	if @DName in ( SELECT DName from dbo.Department)
		RaisError('Department Name already exist',16,1)
END
GO
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
GO
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
GO

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

		UPDATE Department 
		SET  MgrSSN = @MgrSSN
		WHERE DNumber = @DNumber

	COMMIT TRANSACTION;
END TRY  
BEGIN CATCH 
	if @@trancount > 0 ROLLBACK TRANSACTION;
    throw;
END CATCH
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_DeleteDepartment]
	@DNumber int
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM dbo.Department WHERE DNumber = @DNumber;
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetAllDepartments]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT d.DNumber, d.DName, d.MgrSSN, d.MgrStartDate, count(e.SSN) as EmpCount
	FROM Department as d LEFT JOIN Employee as e ON e.Dno = d.DNumber
	GROUP BY d.DNumber, d.DName, d.MgrSSN, d.MgrStartDate;
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetDepartment]
	@DNumber int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT d.DNumber, d.DName, d.MgrSSN, d.MgrStartDate, count(e.SSN) as EmpCount
	FROM Department as d LEFT JOIN Employee as e ON e.Dno = d.DNumber
	WHERE  d.DNumber = @DNumber
	GROUP BY d.DNumber, d.DName, d.MgrSSN, d.MgrStartDate;
END
GO

CREATE VIEW DeparmentEmpCount
AS SELECT d.DNumber, d.DName, d.MgrSSN, d.MgrStartDate, count(e.SSN) as EmpCount
	FROM Department as d LEFT JOIN Employee as e ON e.Dno = d.DNumber
	GROUP BY d.DNumber, d.DName, d.MgrSSN, d.MgrStartDate;
GO

ALTER PROCEDURE [dbo].[usp_GetAllDepartments]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * From [dbo].[DeparmentEmpCount]
END
GO

ALTER PROCEDURE [dbo].[usp_GetDepartment]
	@DNumber int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT *
	FROM [dbo].[DeparmentEmpCount] as d
	WHERE d.DNumber = @DNumber
END
GO