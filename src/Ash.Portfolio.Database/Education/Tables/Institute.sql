CREATE TABLE [Education].[Institute]
(
	[Id]			INT				NOT NULL,
	[Title]			VARCHAR(30)		NOT NULL,
	[Name]			VARCHAR(30)		NOT NULL,
	[Link]			VARCHAR(50)		NOT NULL,
	CONSTRAINT [PK_Education_Institute] PRIMARY KEY NONCLUSTERED ([Id] ASC)
);
GO;