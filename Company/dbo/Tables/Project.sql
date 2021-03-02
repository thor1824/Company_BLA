CREATE TABLE [dbo].[Project] (
    [PName]     VARCHAR (50) NULL,
    [PNumber]   INT          NOT NULL,
    [PLocation] VARCHAR (50) NULL,
    [DNum]      INT          NULL,
    CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED ([PNumber] ASC),
    CONSTRAINT [FK_Project_Department] FOREIGN KEY ([DNum]) REFERENCES [dbo].[Department] ([DNumber]) ON DELETE CASCADE
);

