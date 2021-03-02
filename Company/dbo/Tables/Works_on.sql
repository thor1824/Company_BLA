CREATE TABLE [dbo].[Works_on] (
    [Essn]  NUMERIC (9) NOT NULL,
    [Pno]   INT         NOT NULL,
    [Hours] FLOAT (53)  NULL,
    CONSTRAINT [PK_Works_on] PRIMARY KEY CLUSTERED ([Essn] ASC, [Pno] ASC),
    CONSTRAINT [FK_Works_on_Employee] FOREIGN KEY ([Essn]) REFERENCES [dbo].[Employee] ([SSN]),
    CONSTRAINT [FK_Works_on_Project] FOREIGN KEY ([Pno]) REFERENCES [dbo].[Project] ([PNumber]) ON DELETE CASCADE
);

