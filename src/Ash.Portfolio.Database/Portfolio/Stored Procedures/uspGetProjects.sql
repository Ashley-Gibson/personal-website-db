CREATE PROCEDURE [Portfolio].[uspGetProjects]
AS
BEGIN
	SELECT
		[Name],
		[Technologies],
		[RepositoryLink],
		[ImageLink],
		[Status]
	FROM [Portfolio].[Project];
END