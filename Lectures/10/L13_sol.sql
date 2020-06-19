
USE MIT1264

SELECT OrderNbr, Amt, Company, CreditLimit 
FROM Customers, Orders WHERE Cust = CustNbr;

SELECT OrderNbr, Amt, Company, CreditLimit 
FROM Customers INNER JOIN Orders ON Customers.CustNbr = Orders.Cust;

SELECT OrderNbr, Amt, Company, Name 
FROM Orders, Customers, SalesReps 
WHERE Cust = CustNbr AND CustRep = RepNbr AND Amt >= 25000

SELECT OrderNbr, Amt, Company, Name FROM SalesReps 
	INNER JOIN Customers ON SalesReps.RepNbr = Customers.CustRep 
	INNER JOIN Orders ON Customers.CustNbr = Orders.Cust 
	WHERE Amt >= 25000;

SELECT * FROM Employees

--List, for each customer: customer name, credit limit, 
--rep name serving the customer and the rep sales (of that rep)
SELECT Company, CreditLimit, Name, Sales FROM Customers, SalesReps
WHERE CustRep= RepNbr

--List, for each customer: customer name, their rep name, their rep’s office
SELECT Company, Name, City FROM Customers, SalesReps, Offices
WHERE CustRep= RepNbr AND RepOffice= OfficeNbr

--Self join
SELECT Emp.Name, Manager.Name FROM Employees Emp, Employees Manager 
WHERE Emp.Mgr = Manager.EmpNbr	

SELECT Emp.Name, Manager.Name 
FROM Employees AS Emp INNER JOIN Employees AS Manager ON Emp.Mgr = Manager.EmpNbr 	

SELECT Employees.Name, Manager.Name 
FROM Employees INNER JOIN Employees AS Manager ON Employees.Mgr = Manager.EmpNbr

--Subquery example (not covered in lecture)
SELECT City FROM Offices WHERE Target >
(SELECT SUM(Quota) FROM SalesReps WHERE RepOffice = OfficeNbr);

--List customer names whose credit limit is greater than their sales rep’s quota. Also list the credit limit and quota
SELECT CreditLimit, Quota, Company 
FROM SalesReps INNER JOIN Customers ON SalesReps.RepNbr = Customers.CustRep 
WHERE CreditLimit>Quota;

--List each rep’s name and phone number
SELECT Name, Phone 
FROM Offices INNER JOIN SalesReps ON Offices.OfficeNbr = SalesReps.RepOffice

-- Display all customers with orders > 50000 or credit limit > 50000
SELECT DISTINCT CustNbr, Company FROM Customers LEFT JOIN Orders ON CustNbr = Cust
	WHERE (CreditLimit > 50000 OR Amt > 50000);

-- Delete reps in sales offices in NY with quotas > 40000
-- Not covered in class (subquery)

DELETE FROM SalesReps WHERE RepNbr IN  
(SELECT RepNbr FROM SalesReps, Offices 
WHERE OfficeNbr = RepOffice AND Quota>40000 AND State='NY');

GO

-- View
CREATE VIEW CustomerOrders AS 
SELECT CustNbr, Company, Name, OrderNbr, Prod, Qty, Amt 
FROM Customers, SalesReps, Orders 
WHERE CustRep = RepNbr AND CustNbr = Cust 