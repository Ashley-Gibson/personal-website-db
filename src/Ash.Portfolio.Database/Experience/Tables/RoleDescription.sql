CREATE TABLE [Experience].[RoleDescription]
(
	[ParentId]		INT				NOT NULL,
	[Id]			INT				NOT NULL,
	[Text]			NVARCHAR(1000)	NOT NULL,
	CONSTRAINT [PK_Experience_RoleDescription]	PRIMARY KEY NONCLUSTERED ([Id] ASC),
	CONSTRAINT [FK_Experience_RoleDescription]	FOREIGN KEY ([ParentId]) REFERENCES [Experience].[Role] ([Id])
);
GO;