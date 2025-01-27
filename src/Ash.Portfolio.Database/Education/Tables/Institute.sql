CREATE TABLE [Education].[Institute]
(
	[Id]			INT				NOT NULL	IDENTITY(0,1),
	[Title]			VARCHAR(50)		NOT NULL,
	[Name]			VARCHAR(50)		NOT NULL,
	[Link]			VARCHAR(50)		NOT NULL,
	[ImageLink]		VARCHAR(50)		NOT NULL,
	CONSTRAINT [PK_Education_Institute] PRIMARY KEY NONCLUSTERED ([Id] ASC)
);
GO;