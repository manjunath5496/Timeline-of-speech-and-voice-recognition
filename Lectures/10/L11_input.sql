
CREATE DATABASE MIT1264
GO

USE MIT1264

CREATE TABLE Offices 
(OfficeNbr NCHAR(2) NOT NULL PRIMARY KEY,
 City NVARCHAR(20) NOT NULL,
 State NCHAR(2) NOT NULL,
 Region NCHAR(5) NOT NULL,
 Target MONEY NOT NULL,
 Sales MONEY NOT NULL,
 Phone NVARCHAR(15) NOT NULL)

INSERT INTO Offices
VALUES('1', 'Denver', 'CO', 'West', 3000000, 130000, '970.586.3341')
INSERT INTO Offices
VALUES('2', 'New York', 'NY', 'East', 200000, 300000, '212.942.5574')
INSERT INTO Offices
VALUES('57', 'Dallas', 'TX', 'West', 0, 0, '214.781.5342')

CREATE TABLE SalesReps
(RepNbr NCHAR(3) NOT NULL PRIMARY KEY,
 Name NVARCHAR(20) NOT NULL,
 RepOffice NCHAR(2) NOT NULL REFERENCES Offices(OfficeNbr),
 Quota MONEY,   --Allow NULLs 
 Sales MONEY NOT NULL)

INSERT INTO SalesReps
VALUES('53', 'Bill Smith', '1', 100000, 0)
INSERT INTO SalesReps
VALUES('89', 'Jen Jones', '2', 50000, 130000)

CREATE TABLE Customers
(CustNbr NCHAR(3) NOT NULL PRIMARY KEY,
 Company NVARCHAR(30) NOT NULL,
 CustRep NCHAR(3) NOT NULL REFERENCES SalesReps(RepNbr),
 CreditLimit MONEY NOT NULL)

INSERT INTO Customers
VALUES('211', 'Connor Co', '89', 50000)
INSERT INTO Customers
VALUES('522', 'Amaratunga Enterprises', '89', 40000)
INSERT INTO Customers
VALUES('890', 'Feni Fabricators', '53', 1000000)

CREATE TABLE Orders
(OrderNbr INT NOT NULL PRIMARY KEY IDENTITY,
 Cust NCHAR(3) NOT NULL REFERENCES Customers(CustNbr),
 Prod NVARCHAR(20) NOT NULL,
 Qty INT NOT NULL,
 Amt MONEY NOT NULL,
 Disc DECIMAL(3,1) NOT NULL)

INSERT INTO Orders
VALUES('211', 'Bulldozer', 7, 31000, 0.2)
INSERT INTO Orders
VALUES('522', 'Riveter', 2, 4000, 0.3)
INSERT INTO Orders
VALUES('522', 'Crane', 1, 500000, 0.4)

CREATE TABLE Parts
(PartID NCHAR(4) NOT NULL PRIMARY KEY,
 Vendor NCHAR(4) NOT NULL)

INSERT INTO Parts
VALUES('123', 'A')
INSERT INTO Parts
VALUES('234', 'A')
INSERT INTO Parts
VALUES('345', 'B')
INSERT INTO Parts
VALUES('362', 'A')
INSERT INTO Parts
VALUES('2345', 'C')
INSERT INTO Parts
VALUES('3464', 'A')
INSERT INTO Parts
VALUES('4533', 'C')

CREATE TABLE Employees
(EmpNbr NCHAR(5) NOT NULL PRIMARY KEY,
 Name NVARCHAR(20) NOT NULL,
 Title NVARCHAR(20) NOT NULL,
 Mgr NCHAR(5))

INSERT INTO Employees
VALUES('105', 'Mary Smith', 'Analyst', '104')
INSERT INTO Employees
VALUES('109', 'Jill Jones', 'Sr Analyst', '107')
INSERT INTO Employees
VALUES('104', 'Sally Silver', 'Manager', '111')
INSERT INTO Employees
VALUES('107', 'Pat Brown', 'Manager', '111')
INSERT INTO Employees (EmpNbr, Name, Title)
VALUES('111', 'Eileen Howe', 'President')

