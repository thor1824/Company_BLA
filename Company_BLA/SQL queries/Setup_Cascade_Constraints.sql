USE [Company]
GO

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
