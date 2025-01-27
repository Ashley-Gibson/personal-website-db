CREATE PROCEDURE [test_Education_uspGetInstitutes].[test_institutes_returned_successfully]
AS
BEGIN
	DROP TABLE IF EXISTS #Expected_Education_Institutes;
	DROP TABLE IF EXISTS #Actual_Education_Institutes;

	CREATE TABLE #Expected_Education_Institutes
	(
		[Id]				INT				NOT NULL,
		[Title]				VARCHAR(50)		NOT NULL,
		[Name]				VARCHAR(50)		NOT NULL,
		[Link]				VARCHAR(100)	NOT NULL,
		[ImageLink]			VARCHAR(100)	NOT NULL
	);

	CREATE TABLE #Actual_Education_Institutes
	(
		[Id]				INT				NOT NULL,
		[Title]				VARCHAR(50)		NOT NULL,
		[Name]				VARCHAR(50)		NOT NULL,
		[Link]				VARCHAR(100)	NOT NULL,
		[ImageLink]			VARCHAR(100)	NOT NULL
	);

	DECLARE @title1				VARCHAR(50)		= 'Coding Courses';
	DECLARE @name1				VARCHAR(50)		= 'PluralSight';
	DECLARE @link1				VARCHAR(100)	= 'https://www.pluralsight.com/';
	DECLARE @imageLink1			VARCHAR(100)	= 'img/education/pluralsight.jpg';

	DECLARE @title2				VARCHAR(50)		= 'BSc (Hons) Computer Science for Games';
	DECLARE @name2				VARCHAR(50)		= 'Sheffield Hallam University';
	DECLARE @link2				VARCHAR(100)	= 'https://www.shu.ac.uk/';
	DECLARE @imageLink2			VARCHAR(100)	= 'img/education/shu.jpg';

	EXEC [tSQLt].[FakeTable] '[Education].[Institute]';
	INSERT INTO [Education].[Institute] ([Id], [Title], [Name], [Link], [ImageLink])
	VALUES	(1, @title1, @name1, @link1, @imageLink1),
			(2, @title2, @name2, @link2, @imageLink2);

	INSERT INTO #Expected_Education_Institutes ([Id], [Title], [Name], [Link], [ImageLink])
	VALUES	(1, @title1, @name1, @link1, @imageLink1),
			(2, @title2, @name2, @link2, @imageLink2);

	INSERT INTO #Actual_Education_Institutes
	EXEC [Education].[uspGetInstitutes];

	EXEC [tSQLt].[AssertEqualsTable] '#Expected_Education_Institutes', '#Actual_Education_Institutes';

	DROP TABLE #Expected_Education_Institutes;
	DROP TABLE #Actual_Education_Institutes;
END