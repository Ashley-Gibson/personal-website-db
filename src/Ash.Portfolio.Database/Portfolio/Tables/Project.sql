CREATE TABLE [Portfolio].[Project]
(
	[Name]				VARCHAR(50)		NOT NULL,
	[Technology]		VARCHAR(20)		NOT NULL,
	[RepositoryLink]	VARCHAR(100)	NOT NULL,
	[Status]			VARCHAR(20)		NOT NULL,
	CONSTRAINT [PK_Portfolio_Project] PRIMARY KEY NONCLUSTERED ([Name] ASC, [Technology] ASC)
);
GO;