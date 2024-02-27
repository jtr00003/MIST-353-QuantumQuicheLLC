CREATE PROCEDURE RateMountain
    @MountainID INT,
    @UserID INT,
    @Rating INT,
    @DateRated DATE
AS
BEGIN
    -- Check if the user has already rated the mountain, update if exists, insert otherwise
    IF EXISTS (SELECT 1 FROM MountainRating WHERE MountainID = @MountainID AND UserID = @UserID)
    BEGIN
        UPDATE MountainRating
        SET Rating = @Rating, DatedRated = @DateRated
        WHERE MountainID = @MountainID AND UserID = @UserID;
    END
    ELSE
    BEGIN
        -- Insert a new rating
        INSERT INTO MountainRating (MountainID, UserID, Rating, DatedRated)
        VALUES (@MountainID, @UserID, @Rating, @DateRated);
    END
END;

EXEC RateMountain '1','1',4,'2024-02-16'
GO



CREATE PROCEDURE GetPaymentDetailsWithUser
    @UsersID INT
AS
BEGIN
    SELECT
        P.PaymentID,
        P.UserID,
        P.Amount,
        P.PaymentDate,
        U.UserName,
        U.Email
    FROM Payment P INNER JOIN [User] U ON P.UserID = U.UserID
    WHERE P.UserID = @UsersID;
END;

EXEC GetPaymentDetailsWithUser 3
GO
