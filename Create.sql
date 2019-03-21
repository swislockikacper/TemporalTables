ALTER TABLE [dbo].[Person] SET (SYSTEM_VERSIONING = OFF)
GO
DROP TABLE [dbo].[Person]
GO

CREATE TABLE [dbo].[Person]
(
	[Id] INT PRIMARY KEY CLUSTERED NOT NULL IDENTITY, 
	[FirstName] NVARCHAR(200) NOT NULL,
	[LastName] NVARCHAR(200) NOT NULL,
	[Address] NVARCHAR(200) NOT NULL,
	[EmailAddress] NVARCHAR(200) NOT NULL,
	[Age] INT NOT NULL,

	[StartTime] datetime2 GENERATED ALWAYS AS ROW START --HIDDEN
           CONSTRAINT [DF_Person_StartTime] DEFAULT SYSUTCDATETIME(),  
    [EndTime] datetime2 GENERATED ALWAYS AS ROW END --HIDDEN
           CONSTRAINT [DF_Person_EndTime] DEFAULT CONVERT(datetime2 (0), '9999-12-31 23:59:59'),   
	
	PERIOD FOR SYSTEM_TIME ([StartTime], [EndTime])
)
WITH
(
	SYSTEM_VERSIONING = ON
	(
		HISTORY_TABLE = [dbo].[PersonHistory]
	)
);

INSERT INTO [dbo].[Person]([FirstName], [LastName], [Address], [EmailAddress], [Age])
    VALUES('Test', 'User', 'Address', 'email@com', 10)
GO
INSERT INTO [dbo].[Person]([FirstName], [LastName], [Address], [EmailAddress], [Age])
    VALUES('Test1', 'User2', 'Address1', 'email1@com', 10)
GO
INSERT INTO [dbo].[Person]([FirstName], [LastName], [Address], [EmailAddress], [Age])
    VALUES('Test2', 'User3', 'Address2', 'email2@com', 32)
GO
INSERT INTO [dbo].[Person]([FirstName], [LastName], [Address], [EmailAddress], [Age])
    VALUES('Test3', 'User', 'Address3', 'email3@com', 42)
GO
INSERT INTO [dbo].[Person]([FirstName], [LastName], [Address], [EmailAddress], [Age])
    VALUES('Test4', 'User4', 'Address4', 'email4@com', 30)
GO
INSERT INTO [dbo].[Person]([FirstName], [LastName], [Address], [EmailAddress], [Age])
    VALUES('Test5', 'User5', 'Address5', 'email5@com', 11)
GO
INSERT INTO [dbo].[Person]([FirstName], [LastName], [Address], [EmailAddress], [Age])
    VALUES('Test6', 'User6', 'Address6', 'email6@com', 18)
GO
INSERT INTO [dbo].[Person]([FirstName], [LastName], [Address], [EmailAddress], [Age])
    VALUES('Test7', 'User7', 'Address7', 'email7@com', 15)
GO
INSERT INTO [dbo].[Person]([FirstName], [LastName], [Address], [EmailAddress], [Age])
    VALUES('Test8', 'User8', 'Address8', 'email8@com', 12)
GO
INSERT INTO [dbo].[Person]([FirstName], [LastName], [Address], [EmailAddress], [Age])
    VALUES('Test9', 'User9', 'Address9', 'email9@com', 20)
GO