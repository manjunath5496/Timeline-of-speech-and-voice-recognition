
USE MIT1264

SELECT Name, Sales, Quota FROM SalesReps;

SELECT Name, Sales, Quota, (Sales-Quota) AS Diff FROM SalesReps

SELECT Name, Sales, Quota, (Sales-Quota) FROM SalesReps 
WHERE Sales < Quota

SELECT AVG(Amt) FROM Orders

SELECT AVG(Amt) FROM Orders WHERE Cust = 211

INSERT INTO Offices 
(OfficeNbr, City, State, Region, Target, Sales, Phone) 
VALUES ('55', 'Dallas', 'TX', 'West', 200000, 0, '214.333.2222');

SELECT * FROM Offices

DELETE FROM Customers WHERE Company = 'Connor Co'

UPDATE Customers
SET CreditLimit = 75000 WHERE Company = 'Amaratunga Enterprises'

SELECT * FROM Customers

SELECT * FROM Offices

SELECT Region FROM Offices

SELECT DISTINCT Region FROM Offices

-- Insert and then delete an order
INSERT INTO Orders (Cust, Prod, Qty, Amt, Disc)
VALUES('211', 'Coffee maker', 1, 50, 0.2)

DELETE FROM Orders WHERE Prod= 'Coffee maker'

--Find the greatest positive difference between sales and target
SELECT MAX(Sales-Quota) FROM SalesReps WHERE Sales > Quota

