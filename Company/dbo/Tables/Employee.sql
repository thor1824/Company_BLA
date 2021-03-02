CREATE TABLE [dbo].[Employee] (
    [FName]    VARCHAR (50)    NULL,
    [Minit]    CHAR (1)        NULL,
    [LName]    VARCHAR (50)    NULL,
    [SSN]      NUMERIC (9)     NOT NULL,
    [BDate]    DATETIME        NULL,
    [Address]  VARCHAR (50)    NULL,
    [Sex]      CHAR (1)        NULL,
    [Salary]   NUMERIC (10, 2) NULL,
    [SuperSSN] NUMERIC (9)     NULL,
    [Dno]      INT             NULL,
    CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED ([SSN] ASC),
    CONSTRAINT [FK_Employee_Department] FOREIGN KEY ([Dno]) REFERENCES [dbo].[Department] ([DNumber]) ON DELETE SET NULL,
    CONSTRAINT [FK_Employee_Employee] FOREIGN KEY ([SuperSSN]) REFERENCES [dbo].[Employee] ([SSN])
);

