CREATE PROCEDURE [test_Education_uspGetInstitutesWithDescription].[test_institutes_returned_with_description_rows_successfully]
AS
BEGIN
	DROP TABLE IF EXISTS #Expected_Education_InstitutesWithDescription;
	DROP TABLE IF EXISTS #Actual_Education_InstitutesWithDescription;

	CREATE TABLE #Expected_Education_InstitutesWithDescription
	(
		[Title]				VARCHAR(30)		NOT NULL,
		[Name]				VARCHAR(30)		NOT NULL,
		[Link]				VARCHAR(50)		NOT NULL,
		[DescriptionRow]	NVARCHAR(1000)	NOT NULL
	);

	CREATE TABLE #Actual_Education_InstitutesWithDescription
	(
		[Title]				VARCHAR(30)		NOT NULL,
		[Name]				VARCHAR(30)		NOT NULL,
		[Link]				VARCHAR(50)		NOT NULL,
		[DescriptionRow]	NVARCHAR(1000)	NOT NULL
	);

	DECLARE @title1				VARCHAR(30)		= 'Coding Courses';
	DECLARE @name1				VARCHAR(30)		= 'PluralSight';
	DECLARE @link1				VARCHAR(50)		= 'https://www.pluralsight.com/';
	DECLARE @text11				NVARCHAR(1000)	= 'Topics studied: C#, .NET, Security, Docker, Kubernetes, Jenkins and Sitecore';
	DECLARE @text12				NVARCHAR(1000)	= 'Courses completed: 15
';

	DECLARE @title2				VARCHAR(30)		= 'BSc (Hons) Computer Science for Games';
	DECLARE @name2				VARCHAR(30)		= 'Sheffield Hallam University';
	DECLARE @link2				VARCHAR(50)		= 'https://www.shu.ac.uk/';
	DECLARE @text21				NVARCHAR(1000)	= 'Programming languages: C++, C#, C for Robotics, VB, JavaScript, HTML, CSS, PHP, SQL, Python and Assembly';
	DECLARE @text22				NVARCHAR(1000)	= 'Software used: Visual Studio, Unity';

	EXEC [tSQLt].[FakeTable] '[Education].[Institute]';
	INSERT INTO [Education].[Institute] ([Id], [Title], [Name], [Link])
	VALUES	(1, @title1, @name1, @link1),
			(2, @title2, @name2, @link2);

	EXEC [tSQLt].[FakeTable] '[Education].[InstituteDescription]';
	INSERT INTO [Education].[InstituteDescription] ([ParentId], [Text])
	VALUES	(1, @text11),
			(1, @text12),
			(2, @text21),
			(2, @text22);

	INSERT INTO #Expected_Education_InstitutesWithDescription ([Title], [Name], [Link], [DescriptionRow])
	VALUES	(@title1, @name1, @link1, @text11),
			(@title1, @name1, @link1, @text12),
			(@title2, @name2, @link2, @text21),
			(@title2, @name2, @link2, @text22);

	INSERT INTO #Actual_Education_InstitutesWithDescription
	EXEC [Education].[uspGetInstitutesWithDescription];

	EXEC [tSQLt].[AssertEqualsTable] '#Expected_Education_InstitutesWithDescription', '#Actual_Education_InstitutesWithDescription';

	DROP TABLE #Expected_Education_InstitutesWithDescription;
	DROP TABLE #Actual_Education_InstitutesWithDescription;
END