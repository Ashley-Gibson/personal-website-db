CREATE TABLE [Education].[InstituteDescription]
(
	[ParentId]		INT				NOT NULL,
	[Id]			INT				NOT NULL,
	[Text]			NVARCHAR(1000)	NOT NULL,
	CONSTRAINT [PK_Education_InstituteDescription]	PRIMARY KEY NONCLUSTERED ([Id] ASC),
	CONSTRAINT [FK_Education_InstituteDescription]	FOREIGN KEY ([ParentId]) REFERENCES [Education].[Institute] ([Id])
);
GO;