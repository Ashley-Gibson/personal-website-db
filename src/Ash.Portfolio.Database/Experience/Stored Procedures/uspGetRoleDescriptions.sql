CREATE PROCEDURE [Experience].[uspGetRoleDescriptions]
AS
BEGIN
	SELECT
		erd.[ParentId],
		erd.[Text]
	FROM [Experience].[RoleDescription] erd
END