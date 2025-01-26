CREATE PROCEDURE [test_Interests_uspGetPhotoGalleryImageLinks].[test_photo_gallery_image_links_returned_successfully]
AS
BEGIN
	DROP TABLE IF EXISTS #Expected_Interests_PhotoGallery_ImageLinks;
	DROP TABLE IF EXISTS #Actual_Interests_PhotoGallery_ImageLinks;

	CREATE TABLE #Expected_Interests_PhotoGallery_ImageLinks
	(
		[ImageLink]			VARCHAR(100)	NOT NULL
	);

	CREATE TABLE #Actual_Interests_PhotoGallery_ImageLinks
	(
		[ImageLink]			VARCHAR(100)	NOT NULL
	);

	DECLARE @imageLink1			VARCHAR(100)	= 'img/experience/asos.jpg';

	DECLARE @imageLink2			VARCHAR(100)	= 'img/experience/gallagher.jpg';

	INSERT INTO [Interests].[PhotoGallery] ([ImageLink])
	VALUES	(@imageLink1),
			(@imageLink2);

	INSERT INTO #Expected_Interests_PhotoGallery_ImageLinks ([ImageLink])
	VALUES	(@imageLink1),
			(@imageLink2);

	INSERT INTO #Actual_Interests_PhotoGallery_ImageLinks
	EXEC [Interests].[uspGetPhotoGalleryImageLinks];

	EXEC [tSQLt].[AssertEqualsTable] '#Expected_Interests_PhotoGallery_ImageLinks', '#Actual_Interests_PhotoGallery_ImageLinks';

	DROP TABLE #Expected_Interests_PhotoGallery_ImageLinks;
	DROP TABLE #Actual_Interests_PhotoGallery_ImageLinks;
END