CREATE TABLE [Experience].[Role]
(
	[Id]				INT				NOT NULL,
	[Title]				VARCHAR(30)		NOT NULL,
	[EmployerName]		VARCHAR(30)		NOT NULL,
	[EmployerLink]		VARCHAR(50)		NOT NULL,
	CONSTRAINT [PK_Experience_Role] PRIMARY KEY NONCLUSTERED ([Id] ASC)
);
GO;