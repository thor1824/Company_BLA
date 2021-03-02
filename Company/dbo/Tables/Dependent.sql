CREATE TABLE [dbo].[Dependent] (
    [Essn]           NUMERIC (9)  NOT NULL,
    [Dependent_Name] VARCHAR (50) NOT NULL,
    [Sex]            NCHAR (1)    NULL,
    [BDate]          DATETIME     NULL,
    [Relationship]   VARCHAR (50) NULL,
    CONSTRAINT [PK_Dependent] PRIMARY KEY CLUSTERED ([Essn] ASC, [Dependent_Name] ASC),
    CONSTRAINT [FK_Dependent_Employee] FOREIGN KEY ([Essn]) REFERENCES [dbo].[Employee] ([SSN])
);

