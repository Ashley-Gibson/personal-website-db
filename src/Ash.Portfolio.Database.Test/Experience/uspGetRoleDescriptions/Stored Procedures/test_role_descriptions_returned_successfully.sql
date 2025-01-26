CREATE PROCEDURE [test_Experience_uspGetRoleDescriptions].[test_role_descriptions_returned_successfully]
AS
BEGIN
	DROP TABLE IF EXISTS #Expected_RoleDescriptions_Projects;
	DROP TABLE IF EXISTS #Actual_RoleDescriptions_Projects;

	CREATE TABLE #Expected_RoleDescriptions_Projects
	(
		[ParentId]			INT				NOT NULL,
		[Text]				NVARCHAR(1000)	NOT NULL
	);

	CREATE TABLE #Actual_RoleDescriptions_Projects
	(
		[ParentId]			INT				NOT NULL,
		[Text]				NVARCHAR(1000)	NOT NULL
	);

	DECLARE @text11				NVARCHAR(1000)	= 'Designed, developed, tested and maintained in-house C# .NET Core Web Applications using Azure Cloud Computing';
	DECLARE @text12				NVARCHAR(1000)	= 'Used WebAPI for developing secure internal API endpoints';

	DECLARE @text21				NVARCHAR(1000)	= 'Designed, developed, tested and maintained C# .NET MVC CMS Websites and Web Applications (HTML/JavaScript/CSS) predominantly using Sitecore';
	DECLARE @text22				NVARCHAR(1000)	= 'Source Control: Bitbucket, Azure DevOps and TFS';

	EXEC [tSQLt].[FakeTable] '[Experience].[RoleDescription]';
	INSERT INTO [Experience].[RoleDescription] ([ParentId], [Text])
	VALUES	(1, @text11),
			(1, @text12),
			(2, @text21),
			(2, @text22);

	INSERT INTO #Expected_RoleDescriptions_Projects ([ParentId], [Text])
	VALUES	(1, @text11),
			(1, @text12),
			(2, @text21),
			(2, @text22);

	INSERT INTO #Actual_RoleDescriptions_Projects
	EXEC [Experience].[uspGetRoleDescriptions];

	EXEC [tSQLt].[AssertEqualsTable] '#Expected_RoleDescriptions_Projects', '#Actual_RoleDescriptions_Projects';

	DROP TABLE #Expected_RoleDescriptions_Projects;
	DROP TABLE #Actual_RoleDescriptions_Projects;
END