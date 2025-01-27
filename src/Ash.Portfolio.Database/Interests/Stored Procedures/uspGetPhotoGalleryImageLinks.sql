CREATE PROCEDURE [Interests].[uspGetPhotoGalleryImageLinks]
AS
BEGIN
	SELECT
		[ImageLink]
	FROM [Interests].[PhotoGallery];
END