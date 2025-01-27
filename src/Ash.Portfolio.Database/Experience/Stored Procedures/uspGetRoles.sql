CREATE PROCEDURE [Experience].[uspGetRoles]
AS
BEGIN
	SELECT
		er.[Id],
		er.[Title],
		er.[EmployerName],
		er.[EmployerLink],
		er.[ImageLink]
	FROM [Experience].[Role] er
END