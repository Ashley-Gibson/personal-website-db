CREATE TABLE [Experience].[Role]
(
	[Id]				INT				NOT NULL	IDENTITY(0, 1),
	[Title]				VARCHAR(30)		NOT NULL,
	[EmployerName]		VARCHAR(30)		NOT NULL,
	[EmployerLink]		VARCHAR(100)	NOT NULL,
	[ImageLink]			VARCHAR(100)	NOT NULL,
	CONSTRAINT [PK_Experience_Role] PRIMARY KEY NONCLUSTERED ([Id] ASC)
);
GO;