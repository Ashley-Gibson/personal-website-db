CREATE PROCEDURE [Portfolio].[uspGetProjects]
AS
BEGIN
	SELECT
		[Name],
		[Technologies],
		[RepositoryLink],
		[Status]
	FROM [Portfolio].[Project];
END