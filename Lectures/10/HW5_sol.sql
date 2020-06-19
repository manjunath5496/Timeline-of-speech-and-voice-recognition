use AircraftParts2 
Go

-- 1. MIDO
SELECT DISTINCT MIDO, MIDOStreet, MIDOCity, MIDOState, MIDOZip, MIDOPhone, MIDOFax INTO MIDO FROM PMAList;

-- 2. PMAHolder
SELECT DISTINCT PMAHolder, PMAStreet, PMACity, PMAState, PMAZip INTO PMAHolder FROM PMAList;

-- 3. Mfr
SELECT DISTINCT Manufacturer INTO Mfr FROM PMAList;

-- 4. OrigPart
SELECT DISTINCT Manufacturer, ReplacementFor, PartName INTO OrigPart FROM PMAList;

-- 5. ReplPart

SELECT DISTINCT PMAHolder, PartNumber, PartName, MIDO, ReplacementFor, ApprovalMeans, Manufacturer, 
EntryDate, Price, QuantityInStock
INTO ReplPart FROM PMAList

-- 6. ApprovalMeans

SELECT DISTINCT ApprovalMeans INTO ApprovalMeans FROM PMAList;

-- 7. Create relationships in client

-- 8. Create AircraftModel. Create temp table with Model1 column first

SELECT DISTINCT Manufacturer, Model1 INTO AircraftModelTemp
FROM PMAList WHERE PMAList.Model1 IS NOT NULL;

-- Then append to temp table for Models 2-5
INSERT INTO AircraftModelTemp (Manufacturer, Model1)
SELECT DISTINCT Manufacturer, Model2
FROM PMAList WHERE PMAList.Model2 IS NOT NULL;

INSERT INTO AircraftModelTemp (Manufacturer, Model1)
SELECT DISTINCT Manufacturer, Model3
FROM PMAList WHERE PMAList.Model3 IS NOT NULL;

INSERT INTO AircraftModelTemp (Manufacturer, Model1)
SELECT DISTINCT Manufacturer, Model4
FROM PMAList WHERE PMAList.Model4 IS NOT NULL;

INSERT INTO AircraftModelTemp (Manufacturer, Model1)
SELECT DISTINCT Manufacturer, Model5
FROM PMAList WHERE PMAList.Model5 IS NOT NULL;

SELECT DISTINCT Manufacturer, Model1 INTO AircraftModel 
FROM AircraftModelTemp;

-- 9. Create ReplPartAircraft. Create temp table first, as in step above

SELECT DISTINCT PMAHolder, Manufacturer, PartNumber, Model1 INTO ReplPartAircraftTemp
FROM PMAList WHERE PMAList.Model1 IS NOT NULL;

-- Then append to temp table for Models 2-5
INSERT INTO ReplPartAircraftTemp (PMAHolder, Manufacturer, PartNumber, Model1)
SELECT DISTINCT PMAHolder, Manufacturer, PartNumber, Model2
FROM PMAList WHERE PMAList.Model2 IS NOT NULL;

INSERT INTO ReplPartAircraftTemp (PMAHolder, Manufacturer, PartNumber, Model1)
SELECT DISTINCT PMAHolder, Manufacturer, PartNumber, Model3
FROM PMAList WHERE PMAList.Model3 IS NOT NULL;

INSERT INTO ReplPartAircraftTemp (PMAHolder, Manufacturer, PartNumber, Model1)
SELECT DISTINCT PMAHolder, Manufacturer, PartNumber, Model4
FROM PMAList WHERE PMAList.Model4 IS NOT NULL;

INSERT INTO ReplPartAircraftTemp (PMAHolder, Manufacturer, PartNumber, Model1)
SELECT DISTINCT PMAHolder, Manufacturer, PartNumber, Model5
FROM PMAList WHERE PMAList.Model5 IS NOT NULL;

SELECT DISTINCT PMAHolder, Manufacturer, PartNumber, Model1 INTO ReplPartAircraft 
FROM ReplPartAircraftTemp;

-- 10. Mode
--Students likley complete this section by hand using the user interface
--and therefore have no SQL statements shown here
CREATE TABLE Mode (
Mode NCHAR(10) NOT NULL PRIMARY KEY)

INSERT INTO Mode
VALUES('Highway')
INSERT INTO Mode
VALUES('Rail')
INSERT INTO Mode
VALUES('Air')
INSERT INTO Mode
VALUES('Water')

-- 11.	Put a primary key on the Carrier table. Done by hand in client

--12a. Done by hand in client
--12b. 
UPDATE Carrier SET HighwayMode= 'Highway' WHERE ModeTrans LIKE '1___'
UPDATE Carrier SET RailMode= 'Rail' WHERE ModeTrans LIKE '_1__'
UPDATE Carrier SET WaterMode= 'Water' WHERE ModeTrans LIKE '__1_'
UPDATE Carrier SET AirMode= 'Air' WHERE ModeTrans LIKE '___1'

--12c.
--No work to show 

--12d.
SELECT DISTINCT Carrier.CERTNO, Carrier.HighwayMode INTO CarrierMode
FROM Carrier
WHERE (Carrier.HighwayMode Is Not Null);

INSERT INTO CarrierMode (CERTNO, HighwayMode)
SELECT DISTINCT Carrier.CERTNO, Carrier.RailMode 
FROM Carrier
WHERE (Carrier.RailMode Is Not Null);

INSERT INTO CarrierMode (CERTNO, HighwayMode)
SELECT DISTINCT Carrier.CERTNO, Carrier.WaterMode 
FROM Carrier
WHERE (Carrier.WaterMode Is Not Null);

INSERT INTO CarrierMode (CERTNO, HighwayMode)
SELECT DISTINCT Carrier.CERTNO, Carrier.AirMode 
FROM Carrier
WHERE (Carrier.AirMode Is Not Null);

--12e.
--done by hand in client

-- 13. 
--Students have option to use Airline database or create their own 'Customer' table

CREATE TABLE Customer (
  CustomerID INT IDENTITY NOT NULL PRIMARY KEY,
  CustName varchar(50),
  CustAddr varchar(50),
  CustCity varchar(50),
  CustState char(2),
  CustCountry varchar(50)
)
-- Data entered manually in client

-- 14. 
CREATE TABLE OrderHeader (
  OrderID INT IDENTITY NOT NULL PRIMARY KEY,
  OrderStatus varchar(10),
  DatePlaced datetime,
  TotalCost money,
  CreditCardOrPO varchar(25),
  CertNo nvarchar(13),
  Mode char(10),
  CustomerID int,
  Comments varchar(100)
)

-- 15. Created in client. Relationships created in client

-- D.1

SELECT Manufacturer, Count(*) AS PartsCount
FROM ReplPart
GROUP BY Manufacturer
ORDER BY Count(*) DESC;

-- D.2

SELECT DISTINCT ReplPart.MIDO, ReplPartAircraft.Model, ReplPartAircraft.Manufacturer
FROM ReplPart
INNER JOIN ReplPartAircraft ON 
ReplPart.PartNumber = ReplPartAircraft.PartNumber AND ReplPart.PMAHolder= ReplPartAircraft.PMAHolder
WHERE ReplPartAircraft.Manufacturer= 'McDonnell Douglas';

-- D.3

-- a States with modes
CREATE VIEW D3 AS (
  SELECT DISTINCT Carrier.STATE, CarrierMode.Mode
  FROM Carrier INNER JOIN CarrierMode ON Carrier.CERTNO = CarrierMode.CERTNO
)

-- b States without modes

SELECT D3.STATE, Count(*) AS NbrModes
FROM D3
GROUP BY D3.STATE
HAVING (Count(*)<4);

-- D.4

SELECT ReplPart.Manufacturer, ReplPart.ReplacementFor, Count(*) AS MultipleReplacements
FROM ReplPart
GROUP BY ReplPart.Manufacturer, ReplPart.ReplacementFor
HAVING (Count(*)>1)
ORDER BY Count(*) DESC;

-- D.5

SELECT Avg(ReplPart.Price) AS AvgPrice, ReplPart.PMAHolder
FROM ReplPart
GROUP BY ReplPart.PMAHolder
ORDER BY Avg(ReplPart.Price) DESC;