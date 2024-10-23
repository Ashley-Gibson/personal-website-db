CREATE PROCEDURE [test_Experience_uspGetRolesWithDescription].[test_roles_returned_with_description_rows_successfully]
AS
BEGIN
	DROP TABLE IF EXISTS #Expected_RolesWithDescription_Projects;
	DROP TABLE IF EXISTS #Actual_RolesWithDescription_Projects;

	CREATE TABLE #Expected_RolesWithDescription_Projects
	(
		[Title]				VARCHAR(30)		NOT NULL,
		[EmployerName]		VARCHAR(30)		NOT NULL,
		[EmployerLink]		VARCHAR(50)		NOT NULL,
		[DescriptionRow]	NVARCHAR(1000)	NOT NULL
	);

	CREATE TABLE #Actual_RolesWithDescription_Projects
	(
		[Title]				VARCHAR(30)		NOT NULL,
		[EmployerName]		VARCHAR(30)		NOT NULL,
		[EmployerLink]		VARCHAR(50)		NOT NULL,
		[DescriptionRow]	NVARCHAR(1000)	NOT NULL
	);

	DECLARE @title1				VARCHAR(30)		= 'Senior Software Engineer';
	DECLARE @employerName1		VARCHAR(30)		= 'ASOS';
	DECLARE @employerLink1		VARCHAR(50)		= 'https://www.asos.com';
	DECLARE @text11				NVARCHAR(1000)	= 'Designed, developed, tested and maintained in-house C# .NET Core Web Applications using Azure Cloud Computing';
	DECLARE @text12				NVARCHAR(1000)	= 'Used WebAPI for developing secure internal API endpoints';

	DECLARE @title2				VARCHAR(30)		= 'Digital Developer';
	DECLARE @employerName2		VARCHAR(30)		= 'Gallagher';
	DECLARE @employerLink2		VARCHAR(50)		= 'https://www.ajg.com';
	DECLARE @text21				NVARCHAR(1000)	= 'Designed, developed, tested and maintained C# .NET MVC CMS Websites and Web Applications (HTML/JavaScript/CSS) predominantly using Sitecore';
	DECLARE @text22				NVARCHAR(1000)	= 'Source Control: Bitbucket, Azure DevOps and TFS';

	EXEC [tSQLt].[FakeTable] '[Experience].[Role]';
	INSERT INTO [Experience].[Role] ([Id], [Title], [EmployerName], [EmployerLink])
	VALUES	(1, @title1, @employerName1, @employerLink1),
			(2, @title2, @employerName2, @employerLink2);

	EXEC [tSQLt].[FakeTable] '[Experience].[RoleDescription]';
	INSERT INTO [Experience].[RoleDescription] ([ParentId], [Text])
	VALUES	(1, @text11),
			(1, @text12),
			(2, @text21),
			(2, @text22);

	INSERT INTO #Expected_RolesWithDescription_Projects ([Title], [EmployerName], [EmployerLink], [DescriptionRow])
	VALUES	(@title1, @employerName1, @employerLink1, @text11),
			(@title1, @employerName1, @employerLink1, @text12),
			(@title2, @employerName2, @employerLink2, @text21),
			(@title2, @employerName2, @employerLink2, @text22);

	INSERT INTO #Actual_RolesWithDescription_Projects
	EXEC [Experience].[uspGetRolesWithDescription];

	EXEC [tSQLt].[AssertEqualsTable] '#Expected_RolesWithDescription_Projects', '#Actual_RolesWithDescription_Projects';

	DROP TABLE #Expected_RolesWithDescription_Projects;
	DROP TABLE #Actual_RolesWithDescription_Projects;
END