CREATE PROCEDURE [test_Education_uspGetInstituteDescriptions].[test_institute_descriptions_returned_successfully]
AS
BEGIN
	DROP TABLE IF EXISTS #Expected_Education_InstituteDescriptions;
	DROP TABLE IF EXISTS #Actual_Education_InstituteDescriptions;

	CREATE TABLE #Expected_Education_InstituteDescriptions
	(
		[ParentId]			INT				NOT NULL,
		[Text]				NVARCHAR(1000)	NOT NULL
	);

	CREATE TABLE #Actual_Education_InstituteDescriptions
	(
		[ParentId]			INT				NOT NULL,
		[Text]				NVARCHAR(1000)	NOT NULL
	);

	DECLARE @text11				NVARCHAR(1000)	= 'Topics studied: C#, .NET, Security, Docker, Kubernetes, Jenkins and Sitecore';
	DECLARE @text12				NVARCHAR(1000)	= 'Courses completed: 15';

	DECLARE @text21				NVARCHAR(1000)	= 'Programming languages: C++, C#, C for Robotics, VB, JavaScript, HTML, CSS, PHP, SQL, Python and Assembly';
	DECLARE @text22				NVARCHAR(1000)	= 'Software used: Visual Studio, Unity';

	EXEC [tSQLt].[FakeTable] '[Education].[InstituteDescription]';
	INSERT INTO [Education].[InstituteDescription] ([ParentId], [Text])
	VALUES	(1, @text11),
			(1, @text12),
			(2, @text21),
			(2, @text22);

	INSERT INTO #Expected_Education_InstituteDescriptions ([ParentId], [Text])
	VALUES	(1, @text11),
			(1, @text12),
			(2, @text21),
			(2, @text22);

	INSERT INTO #Actual_Education_InstituteDescriptions
	EXEC [Education].[uspGetInstituteDescriptions];

	EXEC [tSQLt].[AssertEqualsTable] '#Expected_Education_InstituteDescriptions', '#Actual_Education_InstituteDescriptions';

	DROP TABLE #Expected_Education_InstituteDescriptions;
	DROP TABLE #Actual_Education_InstituteDescriptions;
END