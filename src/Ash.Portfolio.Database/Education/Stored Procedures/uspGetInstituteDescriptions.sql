CREATE PROCEDURE [Education].[uspGetInstituteDescriptions]
AS
BEGIN
	SELECT
		eid.[ParentId],
		eid.[Text]
	FROM [Education].[InstituteDescription] eid
END