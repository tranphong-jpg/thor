ALTER TABLE Customer ADD Ngaysinh date;

ALTER TABLE Customer DROP COLUMN Ngaysinh;

ALTER TABLE Customer ALTER COLUMN PhoneNumber char(30);

ALTER TABLE Customer ADD check(PhoneNumber LIKE '09%');

ALTER TABLE Product ADD check(Price>10);

ALTER TABLE Customer DROP CONSTRAINT ten_constraint

CREATE clustered INDEX qty_index ON OrderProduct(Qty);

CREATE INDEX phone_index ON Customer(PhoneNumber);

CREATE VIEW all_data AS 
SELECT  Product.*,Orders.*,OrderProduct.Qty,OrderProduct.Subtotal
FROM OrderProduct 
LEFT JOIN Orders ON Orders.OrderId = OrderProduct.OrderId
LEFT JOIN Product ON Product.ProductId = OrderProduct.ProductId;

SELECT * FROM all_data WHERE OrderId = 2;

CREATE VIEW orders_data AS SELECT * FROM Orders;