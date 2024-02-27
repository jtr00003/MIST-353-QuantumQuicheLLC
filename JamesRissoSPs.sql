CREATE PROCEDURE FindUsersRegisteredInYear2022
AS
BEGIN
    -- Declare a variable to store the year
    DECLARE @Year INT = 2022;

    -- Write the query to select users registered in the specified year
    SELECT *
    FROM [dbo].[User]
    WHERE YEAR(RegistrationDate) = @Year;
END;


Exec FindUsersRegisteredInYear2022
GO



CREATE PROCEDURE GetLongestHikingTrail
AS
BEGIN
    SELECT TOP 1
        TrailName,
        Length
    FROM
        HikingTrails
    ORDER BY
        Length DESC;
END;


Exec GetLongestHikingTrail
GO