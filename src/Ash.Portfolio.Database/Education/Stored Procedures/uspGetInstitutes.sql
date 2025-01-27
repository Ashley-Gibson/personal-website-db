CREATE PROCEDURE [Education].[uspGetInstitutes]
AS
BEGIN
	SELECT
		ei.[Id],
		ei.[Title],
		ei.[Name],
		ei.[Link],
		ei.[ImageLink]
	FROM [Education].[Institute] ei
END