CREATE TABLE [dbo].[Dept_Locations] (
    [DNUmber]   INT          NOT NULL,
    [DLocation] VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_Dept_Locations] PRIMARY KEY CLUSTERED ([DNUmber] ASC, [DLocation] ASC),
    CONSTRAINT [FK_Dept_Locations_Department] FOREIGN KEY ([DNUmber]) REFERENCES [dbo].[Department] ([DNumber]) ON DELETE CASCADE
);

