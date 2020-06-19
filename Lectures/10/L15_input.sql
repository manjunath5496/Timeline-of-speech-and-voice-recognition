USE MIT1264
GO

--Independent INSERTs

INSERT Customers VALUES (212, 'Smith Co', 89, 20000)
INSERT Orders VALUES (212, 'Lathe', 3, 20000, 0.1)
INSERT Orders VALUES (212, 'Latte', 10, 2, 0.0)

-- INSERTs as a transaction

BEGIN TRAN
INSERT Customers VALUES (213, 'Wang Co', 53, 100000)
IF @@ERROR = 0
  BEGIN
    INSERT Orders VALUES (213, 'Mill', 1, 50000, 0.2)
    IF @@ERROR = 0 
      BEGIN
        --INSERT Orders VALUES (213, 'Malt', 1, 2, 0.0)
        INSERT Orders VALUES (213, 'Malt', 1)
        IF @@ERROR = 0
          COMMIT TRAN
        ELSE
          ROLLBACK TRAN
      END
    ELSE
      ROLLBACK TRAN
  END
ELSE
  ROLLBACK TRAN
  
GRANT INSERT ON Customers TO PUBLIC WITH GRANT OPTION
REVOKE INSERT ON Customers FROM PUBLIC CASCADE

CREATE INDEX IX_Orders ON Orders (Cust, OrderNbr)
DROP INDEX IX_Orders ON Orders