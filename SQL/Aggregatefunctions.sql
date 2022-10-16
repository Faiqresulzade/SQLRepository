CREATE DATABASE DemoApp
USE DemoApp
DROP TABLE People
DROP TABLE Countries
DROP TABLE Cities
CREATE TABLE People(
Id int PRIMARY KEY IDENTITY,
Name nvarchar(55) NOT NULL,
Surname nvarchar(55) NOT NULL,
PhoneNumber nvarchar(55) NOT NULL,
Email Nvarchar(70) NOT NULL UNIQUE,
Age int CHECK(Age>=18) NOT NULL,
Gender nvarchar(20) NOT NULL,
HasCitizenship bit NOT  NULL,
CityID int FOREIGN KEY REFERENCES Cities(Id),
CountryID int FOREIGN KEY REFERENCES Countries(Id)
)
CREATE TABLE  Countries(
Id int PRIMARY KEY IDENTITY,
Name nvarchar(55) NOT NULL,
Area decimal NOT NULL
)
CREATE TABLE Cities(
Id int PRIMARY KEY IDENTITY,
Name nvarchar(55) NOT NULL,
Area decimal NOT NULL,
CountryID int FOREIGN KEY REFERENCES Countries(Id)
)
INSERT INTO People
VALUES('Faiq','Resulzade','9999999999','faigresulzade@gmail.com',20,'kishi',1,1,1)
INSERT INTO Countries
VALUES('Azerbaijan',86566)
INSERT INTO Cities
VALUES('Berde','12345',1)
----1
CREATE VIEW JoinTable
AS
SELECT People.Name AS PeopleName, Countries.Name AS CountriesName, Cities.Name AS CitiesName FROM Countries
INNER JOIN Cities
ON Countries.Id=Cities.CountryID
INNER JOIN People
ON People.Id=People.CityID
SELECT * FROM JoinTable
----2
SELECT *FROM People
SELECT * FROM Countries
SELECT * FROM Cities
INSERT INTO Countries
VALUES('Turkiye',1234567),
	  ('ABS',123456789),
	  ('Rusiya',2345)
INSERT INTO Cities
VALUES('Agdam',9854,2),
      ('Ankara',2356,2),
	  ('Istanbul',32343,2)
SELECT * FROM Countries
ORDER BY Area
SELECT * FROM Cities
ORDER BY Name DESC
-----3
INSERT INTO Countries
VALUES('Iran',123456),
	  ('Italya',4567)
SELECT COUNT(*)
FROM Countries
WHERE Area>20.000
SELECT MAX(Area) 
FROM Countries
WHERE Name LIKE '%I%'
-----4
SELECT Name FROM Countries
UNION
SELECT Name FROM Cities
----5
INSERT INTO People
VALUES('Mirdubag','Ekberli','9876598765','miri@gmail.com',26,'kishi',1,2,2),
	  ('Tamerlan','Alimardanli','1234567','Tima@gmail.com',31,'kishi',1,3,3)

SELECT Ct.Name,COUNT(CityId) AS Counts FROM Cities AS Ct
INNER JOIN People
ON Ct.Id=People.CityID
GROUP BY Ct.Name


----------------------------------------------------------------
SELECT Ct.Name,COUNT(CityId) AS Counts FROM Cities AS Ct
INNER JOIN People
ON Ct.Id=People.CityID
GROUP BY Ct.Name
HAVING COUNT(CityId)>5
