INSERT INTO HikingTrails (TrailID, MountainID, TrailName, DifficultyLevel, Length)
VALUES 
(1, 1, 'Mountain Trail', 3, '5 miles'),
(2, 1, 'Forest Path', 2, '3 miles'),
(3, 2, 'Rocky Ridge Trail', 4, '7 miles'),
(4, 2, 'Valley View Trail', 1, '2 miles'),
(5, 3, 'Riverfront Trail', 3, '4 miles');

Go

INSERT INTO Mountain (MountainID, MountainName, StreetLine, Country, City, ZipCode, Elevation, MountainRatings)
VALUES 
(1, 'Mount Everest', 'Sagarmatha', 'Nepal', 'Kathmandu', '00977', '8848 meters', '5/5'),
(2, 'K2', 'Mount Godwin-Austen', 'Pakistan', 'Skardu', '91100', '8611 meters', '4/5'),
(3, 'Kangchenjunga', 'Kangchenjunga', 'Nepal', 'Taplejung', '57412', '8586 meters', '4/5');

go 

INSERT INTO [User] (UserID, UserName, Email, RegistrationDate)
VALUES 
(1, 'JohnDoe', 'johndoe@example.com', '2020-06-11'),
(2, 'JaneSmith', 'janesmith@example.com', '2022-10-03'),
(3, 'AliceJones', 'alicejones@example.com', '2023-02-21');

go

INSERT INTO MountainRating (MountainRatingID, MountainID, UserID, Rating, DatedRated)
VALUES 
('1', '1', '2', 5, '2024-02-14'),
('2', '3', '1', 4, '2024-02-14'),
('3', '2', '3', 5, '2024-02-14'),
('4', '1', '1', 4, '2024-02-19'),
('5', '3', '2', 5, '2024-02-20'),
('6', '3', '3', 3, '2024-02-21'),
('7', '2', '1', 4, '2024-02-22'),
('8', '1', '3', 2, '2024-02-23');

go 



INSERT INTO Payment (PaymentID, UserID, Amount, PaymentDate)
VALUES
('1', '1', 50.00, '2024-02-19'),
('2', '2', 75.50, '2024-02-20'),
('3', '3', 30.25, '2024-02-21'),
('4', '2', 100.00, '2024-02-22'),
('5', '1', 45.75, '2024-02-23');

go



INSERT INTO [WeatherHistory] (WeatherHistoryID, WeatherHistoryMonth, WeatherHistoryAvgTemp, MountainID, WeatherHisotryAvgRainfall)
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
('10', 'January', '−30°C', '2', '12mm');

go


