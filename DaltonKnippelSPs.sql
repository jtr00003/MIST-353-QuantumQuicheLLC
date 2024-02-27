	
CREATE PROCEDURE [dbo].[spGetMountainsWithPositiveAvgTemp]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM dbo.Mountain
    WHERE MountainID IN (
        SELECT DISTINCT MountainID
        FROM dbo.WeatherHistory
        WHERE CAST(REPLACE(WeatherHistoryAvgTemp, '°C', '') AS DECIMAL(5, 2)) > 0
    );
END;
GO


   

EXEC spGetMountainsWithPositiveAvgTemp
GO



create proc [dbo].[spGetMountainGetDetails]
AS
SELECT * FROM Mountain
WHERE MountainID = 1
GO

EXEC spGetMountainGetDetails
GO
