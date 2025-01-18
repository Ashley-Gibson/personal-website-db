CREATE PROCEDURE [test_Portfolio_uspGetProjects].[test_projects_returned_successfully]
AS
BEGIN
	DROP TABLE IF EXISTS #Expected_Portfolio_Projects;
	DROP TABLE IF EXISTS #Actual_Portfolio_Projects;

	CREATE TABLE #Expected_Portfolio_Projects
	(
		[Name]				VARCHAR(50)		NOT NULL,
		[Technology]		VARCHAR(20)		NOT NULL,
		[RepositoryLink]	VARCHAR(100)	NOT NULL,
		[Status]			VARCHAR(20)		NOT NULL
	);

	CREATE TABLE #Actual_Portfolio_Projects
	(
		[Name]				VARCHAR(50)		NOT NULL,
		[Technology]		VARCHAR(20)		NOT NULL,
		[RepositoryLink]	VARCHAR(100)	NOT NULL,
		[Status]			VARCHAR(20)		NOT NULL
	);

	DECLARE @name1				VARCHAR(50)		= 'Number Manipulator';
	DECLARE @technology1		VARCHAR(20)		= 'C# .NET';
	DECLARE @repositoryLink1	VARCHAR(100)	= 'https://github.com/Ashley-Gibson/Number-Manipulator';
	DECLARE @status1			VARCHAR(20)		= 'Complete';

	DECLARE @name2				VARCHAR(50)		= 'Web Quiz';
	DECLARE @technology2		VARCHAR(20)		= 'C# .NET Core';
	DECLARE @repositoryLink2	VARCHAR(100)	= 'https://github.com/Ashley-Gibson/Web-Quiz';
	DECLARE @status2			VARCHAR(20)		= 'In Progress';

	EXEC [tSQLt].[FakeTable] '[Portfolio].[Project]';
	INSERT INTO [Portfolio].[Project] ([Name], [Technology], [RepositoryLink], [Status])
	VALUES	(@name1, @technology1, @repositoryLink1, @status1),
			(@name2, @technology2, @repositoryLink2, @status2);

	INSERT INTO #Expected_Portfolio_Projects ([Name], [Technology], [RepositoryLink], [Status])
	VALUES	(@name1, @technology1, @repositoryLink1, @status1),
			(@name2, @technology2, @repositoryLink2, @status2);

	INSERT INTO #Actual_Portfolio_Projects
	EXEC [Portfolio].[uspGetProjects];

	EXEC [tSQLt].[AssertEqualsTable] '#Expected_Portfolio_Projects', '#Actual_Portfolio_Projects';

	DROP TABLE #Expected_Portfolio_Projects;
	DROP TABLE #Actual_Portfolio_Projects;
END