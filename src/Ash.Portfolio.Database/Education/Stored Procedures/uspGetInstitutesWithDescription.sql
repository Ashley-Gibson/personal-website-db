CREATE PROCEDURE [Education].[uspGetInstitutesWithDescription]
AS
BEGIN
	SELECT
		ei.[Name],
		ei.[Title],
		ei.[Link],
		eid.[Text] AS [DescriptionRow]
	FROM [Education].[Institute] ei
	INNER JOIN [Education].[InstituteDescription] eid ON eid.[ParentId] = ei.[Id];
END