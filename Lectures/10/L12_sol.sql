
USE MIT1264F

SELECT Name, Sales, Quota FROM SalesReps;

SELECT Name, Sales, Quota, (Sales-Quota) FROM SalesReps

SELECT Name, Sales, Quota, (Sales-Quota) FROM SalesReps WHERE Sales < Quota

SELECT AVG(Amt) FROM Orders

SELECT AVG(Amt) FROM Orders WHERE Cust = 211

INSERT INTO Offices (OfficeNbr, City, State, Region, Target, Sales, Phone) VALUES ('55', 'Dallas', 'TX', 'West', 200000, 0, '214.333.2222');

SELECT * FROM Offices

DELETE FROM Customers WHERE Company = 'Connor Co'

UPDATE Customers
SET CreditLimit = 75000 WHERE Company = 'Amaratunga Enterprises'

SELECT * FROM Customers

SELECT * FROM Offices

SELECT Region FROM Offices

SELECT DISTINCT Region FROM Offices

INSERT INTO SalesReps (RepNbr, Name, RepOffice, Sales)
VALUES ('22', 'New Rep', '57', 1000)

SELECT * FROM SalesReps

SELECT * FROM SalesReps WHERE Quota > Sales
SELECT * FROM SalesReps WHERE Quota <= Sales
SELECT * FROM SalesReps WHERE Quota IS NULL
SELECT * FROM SalesReps WHERE Quota <> Sales

SELECT * FROM Orders WHERE Disc*Amt > 50000;

SELECT * FROM SalesReps WHERE Quota BETWEEN 50000 AND 100000;

SELECT * FROM Offices WHERE State IN ('CO', 'UT', 'TX');

SELECT * FROM SalesReps WHERE RepNbr IS NOT NULL;

SELECT * FROM Offices WHERE Phone NOT LIKE '21%';

SELECT COUNT(*) FROM Parts WHERE Vendor = 'A'

SELECT Vendor, COUNT(*) AS PartsCount FROM Parts GROUP BY Vendor 
HAVING COUNT(*) >2

--What is the average credit limit of customers whose credit limit is less than $1,000,000?
SELECT AVG(CreditLimit) FROM Customers WHERE CreditLimit < 1000000;

--How many sales offices are in the West region?
SELECT Count(*) FROM Offices WHERE Region= 'West';

--Increase the price of bulldozers by 30% in all orders
UPDATE Orders SET Amt= Amt*1.3 WHERE Prod= 'Bulldozer';

--Delete any sales rep with a NULL quota
DELETE FROM SalesReps WHERE Quota IS NULL;

