CREATE PROCEDURE [test_Experience_uspGetRoles].[test_roles_returned_successfully]
AS
BEGIN
	DROP TABLE IF EXISTS #Expected_Roles_Projects;
	DROP TABLE IF EXISTS #Actual_Roles_Projects;

	CREATE TABLE #Expected_Roles_Projects
	(
		[Id]				INT				NOT NULL,
		[Title]				VARCHAR(50)		NOT NULL,
		[EmployerName]		VARCHAR(50)		NOT NULL,
		[EmployerLink]		VARCHAR(100)	NOT NULL,
		[ImageLink]			VARCHAR(100)	NOT NULL
	);

	CREATE TABLE #Actual_Roles_Projects
	(
		[Id]				INT				NOT NULL,
		[Title]				VARCHAR(50)		NOT NULL,
		[EmployerName]		VARCHAR(50)		NOT NULL,
		[EmployerLink]		VARCHAR(100)	NOT NULL,
		[ImageLink]			VARCHAR(100)	NOT NULL
	);

	DECLARE @title1				VARCHAR(50)		= 'Senior Software Engineer';
	DECLARE @employerName1		VARCHAR(50)		= 'ASOS';
	DECLARE @employerLink1		VARCHAR(100)	= 'https://www.asos.com';
	DECLARE @imageLink1			VARCHAR(100)	= 'img/experience/asos.jpg';

	DECLARE @title2				VARCHAR(50)		= 'Digital Developer';
	DECLARE @employerName2		VARCHAR(50)		= 'Gallagher';
	DECLARE @employerLink2		VARCHAR(100)	= 'https://www.ajg.com';
	DECLARE @imageLink2			VARCHAR(100)	= 'img/experience/gallagher.jpg';

	EXEC [tSQLt].[FakeTable] '[Experience].[Role]';
	INSERT INTO [Experience].[Role] ([Id], [Title], [EmployerName], [EmployerLink], [ImageLink])
	VALUES	(1, @title1, @employerName1, @employerLink1, @imageLink1),
			(2, @title2, @employerName2, @employerLink2, @imageLink2);

	INSERT INTO #Expected_Roles_Projects ([Id], [Title], [EmployerName], [EmployerLink], [ImageLink])
	VALUES	(1, @title1, @employerName1, @employerLink1, @imageLink1),
			(2, @title2, @employerName2, @employerLink2, @imageLink2);

	INSERT INTO #Actual_Roles_Projects
	EXEC [Experience].[uspGetRoles];

	EXEC [tSQLt].[AssertEqualsTable] '#Expected_Roles_Projects', '#Actual_Roles_Projects';

	DROP TABLE #Expected_Roles_Projects;
	DROP TABLE #Actual_Roles_Projects;
END