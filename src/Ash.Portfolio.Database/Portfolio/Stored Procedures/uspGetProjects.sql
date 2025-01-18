CREATE PROCEDURE [Portfolio].[uspGetProjects]
AS
BEGIN
	SELECT
		[Name],
		[Technology],
		[RepositoryLink],
		[Status]
	FROM [Portfolio].[Project];
END