CREATE TABLE [dbo].[Tmp_Department](
	[DName] [varchar](50) NULL,
	[DNumber] [int] NOT NULL  IDENTITY(1, 1),
	[MgrSSN] [numeric](9, 0) NULL,
	[MgrStartDate] [datetime] NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
([DNumber] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET IDENTITY_INSERT dbo.Tmp_Department ON
go

IF EXISTS ( SELECT * FROM dbo.Department ) 
    INSERT  INTO dbo.Tmp_Department ( DNumber, DName, MgrSSN, MgrStartDate)
            SELECT  DNumber,DName, MgrSSN, MgrStartDate
            FROM    dbo.Department TABLOCKX
go

SET IDENTITY_INSERT dbo.Tmp_Department OFF
go

ALTER TABLE dbo.Department DROP CONSTRAINT FK_Department_Employee;
ALTER TABLE dbo.Dept_Locations DROP CONSTRAINT FK_Dept_Locations_Department;
ALTER TABLE dbo.Employee DROP CONSTRAINT FK_Employee_Department;
ALTER TABLE dbo.Project DROP CONSTRAINT FK_Project_Department;

DROP TABLE dbo.Department
go

Exec sp_rename 'Tmp_Department', 'Department'

ALTER TABLE [dbo].[Department] ADD CONSTRAINT [FK_Department_Employee] FOREIGN KEY([MgrSSN])
REFERENCES [dbo].[Employee] ([SSN])
GO

ALTER TABLE [dbo].[Dept_Locations] ADD CONSTRAINT [FK_Dept_Locations_Department] FOREIGN KEY([DNUmber])
REFERENCES [dbo].[Department] ([DNumber])
GO

ALTER TABLE [dbo].[Employee]  ADD CONSTRAINT [FK_Employee_Department] FOREIGN KEY([Dno])
REFERENCES [dbo].[Department] ([DNumber])
GO

ALTER TABLE [dbo].[Project]  ADD CONSTRAINT [FK_Project_Department] FOREIGN KEY([DNum])
REFERENCES [dbo].[Department] ([DNumber])
GO