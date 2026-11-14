USE ASSIGNMENT2_GAMES

SELECT * FROM dbo.games_dataset;

SELECT TOP 5
    Platform,
    AVG(User_Rating) AS AverageRating
FROM dbo.games_dataset
WHERE User_Rating IS NOT NULL
GROUP BY Platform
ORDER BY AverageRating DESC;
------------------------------------------------------------------
WITH GenreRatings AS
(
    SELECT
        Genre,
        AVG(User_Rating) AS AverageRating
    FROM dbo.games_dataset
    WHERE User_Rating IS NOT NULL
    GROUP BY Genre
)
SELECT
    Genre,
    AverageRating
FROM GenreRatings
WHERE AverageRating > 5.6
ORDER BY AverageRating DESC;
------------------------------------------------------------------
ALTER TABLE dbo.games_dataset
ADD Rating_Category VARCHAR(10);

CREATE PROCEDURE UpdateGameRatings
AS
BEGIN
    UPDATE dbo.games_dataset
    SET Rating_Category =
        CASE
            WHEN User_Rating >= 7.0 THEN 'High'
            WHEN User_Rating >= 4.0 THEN 'Medium'
            WHEN User_Rating < 4.0 THEN 'Low'
            ELSE NULL
        END;
END;

EXEC UpdateGameRatings;
------------------------------------------------------------------
CREATE TRIGGER SetDefaultUserRating
ON dbo.games_dataset
AFTER INSERT
AS
BEGIN
    UPDATE G
    SET User_Rating = 5.0
    FROM dbo.games_dataset AS G
    INNER JOIN inserted AS I
        ON G.Game_Name = I.Game_Name
    WHERE I.User_Rating IS NULL;
END;
------------------------------------------------------------------
CREATE VIEW vw_CompleteGameRatings
AS
SELECT
    Game_Name,
    Genre,
    Platform,
    Release_Year,
    User_Rating
FROM dbo.games_dataset
WHERE Game_Name IS NOT NULL
  AND Genre IS NOT NULL
  AND Platform IS NOT NULL
  AND Release_Year IS NOT NULL
  AND User_Rating IS NOT NULL;

SELECT * FROM vw_CompleteGameRatings;
------------------------------------------------------------------