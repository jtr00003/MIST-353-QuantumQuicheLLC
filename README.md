# Quantum Quiche LLC

## James Risso, Rance Blakney and Dalton Knippel

Quantum Quiche LLC has decided to merge together and continue a new idea together as a team! This idea has to do with locating mountains around the world and allowing a user to view hiking trails. It also allows the user to rate, check length, location and even difficulty of the trail, all these features will be offered with the paid version of the application! With a small price of $20 a year users will gain access to all of this amazing information that will enhance their hiking expereinces
 


# Chat GPT Prompt 

## James Risso

* Can you make tables out of these names.    
 "Mountain ratings,
 Payment, 
 User, 
 Mountain, 
 Weather history, 
 Hiking Trails,"

* Can you fill these tables with mock data
  "Mountain ratings,
  Payment, 
  User, 
  Mountain, 
  Weather history, 
  Hiking Trails,"

## Dalton Knippel

Working in SQL Server, write me a query to fill this table with mock data:

```sql
CREATE TABLE [dbo].[Mountain](
	[MountainID] [nvarchar](50) NOT NULL,
	[MountainName] [nvarchar](max) NULL,
	[MountainLongitude] [nvarchar](13) NOT NULL,
	[MountainLatitude] [nvarchar](12) NOT NULL,
	[MountainElevationFT] [nvarchar](max) NOT NULL,
	[MountainRatings] [nvarchar](max) NULL,
 CONSTRAINT [PK_Mountain] PRIMARY KEY CLUSTERED
```

ChatGPT
You can use the following SQL query to insert mock data into the Mountain table:

sql
Copy code
-- Inserting mock data into Mountain table
INSERT INTO [dbo].[Mountain] ([MountainID], [MountainName], [MountainLongitude], [MountainLatitude], [MountainElevationFT], [MountainRatings])
VALUES 
('1', 'Mount Everest', '86.9250° E', '27.9881° N', '29,032 ft', '5/5'),
('2', 'K2', '76.5133° E', '35.8814° N', '28,251 ft', '4.5/5'),
('3', 'Kangchenjunga', '88.1475° E', '27.7025° N', '28,169 ft', '4.7/5'),
('4', 'Lhotse', '86.9336° E', '27.9619° N', '27,940 ft', '4.3/5'),
('5', 'Makalu', '87.0889° E', '27.8894° N', '27,838 ft', '4.2/5'),
('6', 'Cho Oyu', '86.6608° E', '28.0942° N', '26,864 ft', '4.4/5');
This query inserts data for six different mountains into the Mountain table, providing values for MountainID, MountainName, MountainLongitude, MountainLatitude, MountainElevationFT, and MountainRatings. Adjust the values as needed or add more rows to insert additional mock data.

User
Working in SQL Server, write me a query to fill this table with mock data:

```sql
CREATE TABLE [dbo].[WeatherHistory](
	[WeatherHistoryID] [nvarchar](50) NOT NULL,
	[WeatherHistoryMonth] [nvarchar](50) NOT NULL,
	[WeatherHistoryAvgTemp] [nvarchar](50) NOT NULL,
	[MountainID] [nvarchar](50) NOT NULL,
	[WeatherHistoryAvgPrec] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_WeatherHistory] PRIMARY KEY CLUSTERED 
(
```
ChatGPT
Below is an example SQL query to insert mock data into the WeatherHistory table:

sql
Copy code
-- Inserting mock data into WeatherHistory table
INSERT INTO [dbo].[WeatherHistory] ([WeatherHistoryID], [WeatherHistoryMonth], [WeatherHistoryAvgTemp], [MountainID], [WeatherHistoryAvgPrec])
VALUES 
('1', 'January', '10°C', '1', '20mm'),
('2', 'February', '8°C', '1', '25mm'),
('3', 'March', '6°C', '1', '30mm'),
('4', 'January', '−36°C', '2', '10mm'),
('5', 'February', '−38°C', '2', '15mm'),
('6', 'March', '−40°C', '2', '12mm'),
('7', 'January', '−20°C', '3', '5mm'),
('8', 'February', '−22°C', '3', '8mm'),
('9', 'March', '−25°C', '3', '10mm'),
('10', 'January', '−30°C', '4', '12mm'),
('11', 'February', '−32°C', '4', '14mm'),
('12', 'March', '−35°C', '4', '18mm'),
('13', 'January', '−25°C', '5', '8mm'),
('14', 'February', '−28°C', '5', '10mm'),
('15', 'March', '−30°C', '5', '12mm'),
('16', 'January', '−20°C', '6', '15mm'),
('17', 'February', '−22°C', '6', '18mm'),
('18', 'March', '−25°C', '6', '20mm');
This query inserts mock data into the WeatherHistory table, providing values for WeatherHistoryID, WeatherHistoryMonth, WeatherHistoryAvgTemp, MountainID, and WeatherHistoryAvgPrec. Adjust the values as needed or add more rows to insert additional mock data.

User
Create a stored procedure from these two tables that shows all details for a mountain that has an average temp of over 0°C
ChatGPT
You can create a stored procedure in SQL Server that retrieves all details for a mountain with an average temperature above 0°C using a JOIN between the Mountain and WeatherHistory tables. Below is the SQL code to create such a stored procedure:

sql
Copy code
CREATE PROCEDURE GetMountainsWithPositiveAvgTemp
AS
BEGIN
    SET NOCOUNT ON;

    SELECT m.*, wh.*
    FROM dbo.Mountain m
    INNER JOIN dbo.WeatherHistory wh ON m.MountainID = wh.MountainID
    WHERE CAST(REPLACE(WeatherHistoryAvgTemp, '°C', '') AS DECIMAL(5, 2)) > 0;
END;
This stored procedure is named GetMountainsWithPositiveAvgTemp. It retrieves all columns from both the Mountain and WeatherHistory tables for mountains with an average temperature above 0°C. The REPLACE function is used to remove the '°C' suffix from the temperature values before casting them to a numeric format for comparison.

You can execute this stored procedure using the following SQL command:

sql
Copy code
EXEC GetMountainsWithPositiveAvgTemp;
This will return all details for mountains with an average temperature above 0°C.

User
I only want the mountain details not weather details 
ChatGPT
Apologies for the oversight. Here's the revised stored procedure that returns only the details of mountains with an average temperature above 0°C:

sql
Copy code
CREATE PROCEDURE GetMountainsWithPositiveAvgTemp
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
This stored procedure selects all details from the Mountain table where the MountainID appears in the subquery, which filters WeatherHistory for average temperatures above 0°C. The subquery ensures that only mountains meeting the temperature criterion are included in the result.

You can execute this stored procedure in the same way:

sql
Copy code
EXEC GetMountainsWithPositiveAvgTemp;
User
Create a stored procedure that gives me all the details for a mountain with an elevation of over 28000 ft
ChatGPT
Certainly! Here's the stored procedure that retrieves all details for a mountain with an elevation greater than 28,000 feet:

sql
Copy code
CREATE PROCEDURE GetMountainsWithHighElevation
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM dbo.Mountain
    WHERE CAST(REPLACE(MountainElevationFT, ' ft', '') AS INT) > 28000;
END;
This stored procedure selects all details from the Mountain table where the elevation is greater than 28,000 feet. It achieves this by using the CAST function to convert the elevation from a string to an integer, after removing the ' ft' suffix.

You can execute this stored procedure like so:

sql
Copy code
EXEC GetMountainsWithHighElevation;


## Rance Blakney 

ChatGPT Prompt for mock data: 
I have 2 tables in my database 

1. Payment 
PaymentID (PK)
UserID(FK to the User table)
Amount 
PaymentDate


2. Mountain Ratings 
MountainRatingID (PK)
MountainID (FK to the mountain table)
Rating (e.g 1-5)
DateRated

working in SQL server, 
write me queries to fill both of these tables with mock data 


ChatGPT Stored procedures prompt:
1. Rate Mountain -->
"Write me a stored procedure that would allow a user to enter a rate for a mountain"

2. Payment information -->
"Write me a stored procedure that shows the user payment details" 





