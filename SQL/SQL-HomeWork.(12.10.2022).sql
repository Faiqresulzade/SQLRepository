CREATE DATABASE DrugstoreApp
USE DrugstoreApp
DROP TABLE Druggists
CREATE TABLE Druggists(
Id int PRIMARY KEY IDENTITY,
Name nvarchar(55) NOT NULL,
Surname nvarchar(55) NOT NULL,
Age int NOT NULL CHECK(Age>=18),
Experience int CHECK(Experience>=2) NOT NULL,
)
DROP TABLE Drugs
CREATE TABLE Drugs(
Id int PRIMARY KEY IDENTITY,
Name varchar(55) NOT NULL,
Price int NOT NULL,
Count int NOT NULL
)
DROP TABLE DrugStores
CREATE TABLE DrugStores(
Id int PRIMARY KEY IDENTITY,
Name nvarchar(55) NOT NULL,
Adress nvarchar(100) NOT NULL,
ContactNumber nvarchar(55) NOT NULL UNIQUE,
CreationDate DATETIME NOT NULL,
DruggistID Int FOREIGN KEY REFERENCES Druggists(Id),
DrugId int FOREIGN KEY REFERENCES Drugs(Id)
)
DROP TABLE Owners
CREATE TABLE Owners(
Id int PRIMARY KEY IDENTITY,
Name nvarchar(55) NOT NULL,
Surname nvarchar(55) NOT NULL,
DrugStorieID int FOREIGN KEY REFERENCES DrugStores(Id),
)
SELECT * FROM DrugStores
SELECT * FROM Druggists
SELECT * FROM Drugs
SELECT * FROM Owners
INSERT INTO Druggists
VALUES('Mirdubag','Ekberov',26,12)
INSERT INTO Drugs
VALUES ('Parasdemol',20,100)
INSERT INTO DrugStores
VALUES ('Zeferan','Sheki','+994 99 999 98 98','10.10.2002',1,1)
INSERT INTO Owners
VALUES('Beyler','Sadiqpov',1)