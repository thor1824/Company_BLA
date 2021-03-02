CREATE TABLE [dbo].[Department] (
    [DName]        VARCHAR (50) NULL,
    [DNumber]      INT          IDENTITY (1, 1) NOT NULL,
    [MgrSSN]       NUMERIC (9)  NULL,
    [MgrStartDate] DATETIME     NULL,
    CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED ([DNumber] ASC),
    CONSTRAINT [FK_Department_Employee] FOREIGN KEY ([MgrSSN]) REFERENCES [dbo].[Employee] ([SSN])
);

