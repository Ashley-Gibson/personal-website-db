CREATE PROCEDURE [Experience].[uspGetRolesWithDescription]
AS
BEGIN
	SELECT
		er.[Title],
		er.[EmployerName],
		er.[EmployerLink],
		erd.[Text] AS [DescriptionRow]
	FROM [Experience].[Role] er
	INNER JOIN [Experience].[RoleDescription] erd ON erd.[ParentId] = er.[Id];
END