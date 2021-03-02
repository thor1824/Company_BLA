USE [Company]
GO

/****** Object: Table [dbo].[Department] Script Date: 3/2/2021 3:39:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER TABLE dbo.Department DROP CONSTRAINT FK_Department_Employee;
GO
ALTER TABLE dbo.Dept_Locations DROP CONSTRAINT FK_Dept_Locations_Department;
GO
ALTER TABLE dbo.Employee DROP CONSTRAINT FK_Employee_Department;
GO
ALTER TABLE dbo.Project DROP CONSTRAINT FK_Project_Department;
GO

ALTER TABLE dbo.Employee DROP CONSTRAINT FK_Employee_Employee;
GO

SET IDENTITY_INSERT [dbo].[Department] ON;
GO
INSERT [dbo].[Department] ([DName], [DNumber], [MgrSSN], [MgrStartDate]) VALUES (N'Headquarters', 1, CAST(888665555 AS Numeric(9, 0)), CAST(N'1971-06-19 00:00:00.000' AS DateTime))
INSERT [dbo].[Department] ([DName], [DNumber], [MgrSSN], [MgrStartDate]) VALUES (N'Administration', 4, CAST(123456789 AS Numeric(9, 0)), CAST(N'1986-01-01 00:00:00.000' AS DateTime))
INSERT [dbo].[Department] ([DName], [DNumber], [MgrSSN], [MgrStartDate]) VALUES (N'Research', 5, CAST(987654321 AS Numeric(9, 0)), CAST(N'1978-05-22 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Department] OFF;
GO

INSERT [dbo].[Employee] ([FName], [Minit], [LName], [SSN], [BDate], [Address], [Sex], [Salary], [SuperSSN], [Dno]) VALUES (N'John', N'B', N'Smith', CAST(123456789 AS Numeric(9, 0)), CAST(N'1955-01-09 00:00:00.000' AS DateTime), N'731 Fondren, Houston, TX', N'M', CAST(30000.00 AS Numeric(10, 2)), CAST(987654321 AS Numeric(9, 0)), 5)
INSERT [dbo].[Employee] ([FName], [Minit], [LName], [SSN], [BDate], [Address], [Sex], [Salary], [SuperSSN], [Dno]) VALUES (N'Franklin', N'T', N'Wong', CAST(333445555 AS Numeric(9, 0)), CAST(N'1945-12-08 00:00:00.000' AS DateTime), N'638 Voss, Houston, TX', N'M', CAST(40000.00 AS Numeric(10, 2)), CAST(987654321 AS Numeric(9, 0)), 5)
INSERT [dbo].[Employee] ([FName], [Minit], [LName], [SSN], [BDate], [Address], [Sex], [Salary], [SuperSSN], [Dno]) VALUES (N'Joyce', N'A', N'English', CAST(453453453 AS Numeric(9, 0)), CAST(N'1962-07-31 00:00:00.000' AS DateTime), N'5631 Rice, Houston, TX', N'F', CAST(25000.00 AS Numeric(10, 2)), CAST(987654321 AS Numeric(9, 0)), 5)
INSERT [dbo].[Employee] ([FName], [Minit], [LName], [SSN], [BDate], [Address], [Sex], [Salary], [SuperSSN], [Dno]) VALUES (N'Ramesh', N'K', N'Narayan', CAST(666884444 AS Numeric(9, 0)), CAST(N'1952-09-15 00:00:00.000' AS DateTime), N'974 Fire Oak, Humble, TX', N'M', CAST(38000.00 AS Numeric(10, 2)), CAST(987654321 AS Numeric(9, 0)), 5)
INSERT [dbo].[Employee] ([FName], [Minit], [LName], [SSN], [BDate], [Address], [Sex], [Salary], [SuperSSN], [Dno]) VALUES (N'James', N'E', N'Borg', CAST(888665555 AS Numeric(9, 0)), CAST(N'1927-11-10 00:00:00.000' AS DateTime), N'450 Stone, Houston, TX', N'M', CAST(55000.00 AS Numeric(10, 2)), NULL, 1)
INSERT [dbo].[Employee] ([FName], [Minit], [LName], [SSN], [BDate], [Address], [Sex], [Salary], [SuperSSN], [Dno]) VALUES (N'Jennifer', N'S', N'Wallace', CAST(987654321 AS Numeric(9, 0)), CAST(N'1931-06-20 00:00:00.000' AS DateTime), N'291 Berry, Bellaire, TX', N'F', CAST(36000.00 AS Numeric(10, 2)), CAST(123456789 AS Numeric(9, 0)), 4)
INSERT [dbo].[Employee] ([FName], [Minit], [LName], [SSN], [BDate], [Address], [Sex], [Salary], [SuperSSN], [Dno]) VALUES (N'Ahmad', N'V', N'Jabbar', CAST(987987987 AS Numeric(9, 0)), CAST(N'1959-03-29 00:00:00.000' AS DateTime), N'980 Dallas, Houston, TX', N'M', CAST(25000.00 AS Numeric(10, 2)), CAST(123456789 AS Numeric(9, 0)), 4)
INSERT [dbo].[Employee] ([FName], [Minit], [LName], [SSN], [BDate], [Address], [Sex], [Salary], [SuperSSN], [Dno]) VALUES (N'Alicia', N'J', N'Zelaya', CAST(999887777 AS Numeric(9, 0)), CAST(N'1958-07-19 00:00:00.000' AS DateTime), N'3321 Castle, Spring, TX', N'F', CAST(25000.00 AS Numeric(10, 2)), CAST(123456789 AS Numeric(9, 0)), 4)


INSERT [dbo].[Dependent] ([Essn], [Dependent_Name], [Sex], [BDate], [Relationship]) VALUES (CAST(123456789 AS Numeric(9, 0)), N'Alice', N'F', CAST(N'1978-12-31 00:00:00.000' AS DateTime), N'Daughter')
INSERT [dbo].[Dependent] ([Essn], [Dependent_Name], [Sex], [BDate], [Relationship]) VALUES (CAST(123456789 AS Numeric(9, 0)), N'Elizabeth', N'F', CAST(N'1957-05-05 00:00:00.000' AS DateTime), N'Spouse')
INSERT [dbo].[Dependent] ([Essn], [Dependent_Name], [Sex], [BDate], [Relationship]) VALUES (CAST(123456789 AS Numeric(9, 0)), N'Michael', N'M', CAST(N'1978-01-01 00:00:00.000' AS DateTime), N'Son')
INSERT [dbo].[Dependent] ([Essn], [Dependent_Name], [Sex], [BDate], [Relationship]) VALUES (CAST(333445555 AS Numeric(9, 0)), N'Alice', N'F', CAST(N'1976-04-05 00:00:00.000' AS DateTime), N'Daughter')
INSERT [dbo].[Dependent] ([Essn], [Dependent_Name], [Sex], [BDate], [Relationship]) VALUES (CAST(333445555 AS Numeric(9, 0)), N'Joy', N'F', CAST(N'1948-05-03 00:00:00.000' AS DateTime), N'Spouse')
INSERT [dbo].[Dependent] ([Essn], [Dependent_Name], [Sex], [BDate], [Relationship]) VALUES (CAST(333445555 AS Numeric(9, 0)), N'Theodore', N'M', CAST(N'1973-10-25 00:00:00.000' AS DateTime), N'Son')
INSERT [dbo].[Dependent] ([Essn], [Dependent_Name], [Sex], [BDate], [Relationship]) VALUES (CAST(987654321 AS Numeric(9, 0)), N'Abner', N'M', CAST(N'1932-02-29 00:00:00.000' AS DateTime), N'Spouse')


INSERT [dbo].[Dept_Locations] ([DNUmber], [DLocation]) VALUES (1, N'Houston')
INSERT [dbo].[Dept_Locations] ([DNUmber], [DLocation]) VALUES (4, N'Stafford')
INSERT [dbo].[Dept_Locations] ([DNUmber], [DLocation]) VALUES (5, N'Bellaire')
INSERT [dbo].[Dept_Locations] ([DNUmber], [DLocation]) VALUES (5, N'Houston')
INSERT [dbo].[Dept_Locations] ([DNUmber], [DLocation]) VALUES (5, N'Sugarland')

INSERT [dbo].[Project] ([PName], [PNumber], [PLocation], [DNum]) VALUES (N'ProductX', 1, N'Bellaire', 5)
INSERT [dbo].[Project] ([PName], [PNumber], [PLocation], [DNum]) VALUES (N'ProductY', 2, N'Sugarland', 5)
INSERT [dbo].[Project] ([PName], [PNumber], [PLocation], [DNum]) VALUES (N'ProductZ', 3, N'Houston', 5)
INSERT [dbo].[Project] ([PName], [PNumber], [PLocation], [DNum]) VALUES (N'Computerization', 10, N'Stafford', 4)
INSERT [dbo].[Project] ([PName], [PNumber], [PLocation], [DNum]) VALUES (N'Reorganization', 20, N'Houston', 1)
INSERT [dbo].[Project] ([PName], [PNumber], [PLocation], [DNum]) VALUES (N'Newbenefits', 30, N'Stafford', 4)

INSERT [dbo].[Works_on] ([Essn], [Pno], [Hours]) VALUES (CAST(123456789 AS Numeric(9, 0)), 1, 32.5)
INSERT [dbo].[Works_on] ([Essn], [Pno], [Hours]) VALUES (CAST(123456789 AS Numeric(9, 0)), 2, 7.5)
INSERT [dbo].[Works_on] ([Essn], [Pno], [Hours]) VALUES (CAST(333445555 AS Numeric(9, 0)), 2, 10)
INSERT [dbo].[Works_on] ([Essn], [Pno], [Hours]) VALUES (CAST(333445555 AS Numeric(9, 0)), 3, 10)
INSERT [dbo].[Works_on] ([Essn], [Pno], [Hours]) VALUES (CAST(333445555 AS Numeric(9, 0)), 10, 10)
INSERT [dbo].[Works_on] ([Essn], [Pno], [Hours]) VALUES (CAST(333445555 AS Numeric(9, 0)), 20, 10)
INSERT [dbo].[Works_on] ([Essn], [Pno], [Hours]) VALUES (CAST(453453453 AS Numeric(9, 0)), 1, 20)
INSERT [dbo].[Works_on] ([Essn], [Pno], [Hours]) VALUES (CAST(453453453 AS Numeric(9, 0)), 2, 20)
INSERT [dbo].[Works_on] ([Essn], [Pno], [Hours]) VALUES (CAST(666884444 AS Numeric(9, 0)), 3, 40)
INSERT [dbo].[Works_on] ([Essn], [Pno], [Hours]) VALUES (CAST(888665555 AS Numeric(9, 0)), 20, NULL)
INSERT [dbo].[Works_on] ([Essn], [Pno], [Hours]) VALUES (CAST(987654321 AS Numeric(9, 0)), 20, 15)
INSERT [dbo].[Works_on] ([Essn], [Pno], [Hours]) VALUES (CAST(987654321 AS Numeric(9, 0)), 30, 20)
INSERT [dbo].[Works_on] ([Essn], [Pno], [Hours]) VALUES (CAST(987987987 AS Numeric(9, 0)), 10, 35)
INSERT [dbo].[Works_on] ([Essn], [Pno], [Hours]) VALUES (CAST(987987987 AS Numeric(9, 0)), 30, 5)
INSERT [dbo].[Works_on] ([Essn], [Pno], [Hours]) VALUES (CAST(999887777 AS Numeric(9, 0)), 10, 10)
INSERT [dbo].[Works_on] ([Essn], [Pno], [Hours]) VALUES (CAST(999887777 AS Numeric(9, 0)), 30, 30)

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

ALTER TABLE [dbo].[Employee]  ADD  CONSTRAINT [FK_Employee_Employee] FOREIGN KEY([SuperSSN])
REFERENCES [dbo].[Employee] ([SSN])
GO

