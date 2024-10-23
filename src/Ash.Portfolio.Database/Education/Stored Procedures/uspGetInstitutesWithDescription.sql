CREATE PROCEDURE [Education].[uspGetInstitutesWithDescription]
AS
BEGIN
	SELECT
		ei.[Title],
		ei.[Name],
		ei.[Link],
		eid.[Text] AS [DescriptionRow]
	FROM [Education].[Institute] ei
	INNER JOIN [Education].[InstituteDescription] eid ON eid.[ParentId] = ei.[Id];
END