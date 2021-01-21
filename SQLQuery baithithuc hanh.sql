SELECT CustomerId,CustomerName,CustomerAddress,PhoneNumber
	FROM Customer;
SELECT * FROM Customer;	

SELECT CustomerName AS name,CustomerAddress,PhoneNumber
	FROM Customer;

SELECT top 1 * FROM Customer;

SELECT top 50 percent * FROM Customer;
-- sap xep du lieu
SELECT top 1 * FROM Product ORDER BY Price DESC;
SELECT top 1 * FROM Product ORDER BY Price ASC;
SELECT * FROM Product ORDER BY Price DESC;
-- loc du lieu
SELECT * FROM Product WHERE Price >= 500 AND Price <=1000;
SELECT * FROM Product WHERE Price = 1000;
SELECT * FROM Product WHERE ProductId = 3 OR ProductId = 2;
SELECT * FROM Product WHERE ProductId IN (1,3,4,7,12);
-- tim kiem
SELECT * FROM Product WHERE ProductName like 'ideapad';
SELECT * FROM Product WHERE ProductName like 'ideapad%';
SELECT * FROM Product WHERE ProductName like '%ideapad';
SELECT * FROM Product WHERE ProductName like '%ideapad%';
-- thong ke du lieu
SELECT count(*) FROM Orders;
SELECT sum(GrandTotal) FROM Orders WHERE CId = 2;
SELECT avg(GrandTotal) FROM Orders WHERE CId = 1;
-- thong ke theo nhom
SELECT sum(GrandTotal) AS tongtien,CId FROM Orders GROUP BY CId;
-- truy van con (subquery)
DECLARE @x int;
SET @x = SELECT CustomerId FROM Customer 
	WHERE PhoneNumber like '0987654321';
SELECT * FROM Orders WHERE CId = @x;
--> truy van con
SELECT * FROM Orders WHERE CId IN 
(SELECT CustomerId FROM Customer 
	WHERE PhoneNumber like '0987654321');
--> liet ke san pham cua kh da mua theo sdt
SELECT * FROM Product WHERE ProductId IN 
	(SELECT ProductId FROM OrderProduct WHERE OrderId IN 
		(SELECT OrderId FROM Orders WHERE CId IN 
			(SELECT CustomerId FROM Customer WHERE PhoneNumber LIKE '0987654321')
		)
	);

-- noi bang - join table
SELECT * FROM Orders;

SELECT * FROM Orders 
INNER JOIN Customer ON Orders.CId = Customer.CustomerId;

SELECT * FROM Orders 
LEFT JOIN Customer ON Orders.CId = Customer.CustomerId;

SELECT * FROM Orders
RIGHT JOIN Customer ON Orders.CId = Customer.CustomerId;

SELECT  * FROM OrderProduct 
LEFT JOIN Orders ON Orders.OrderId = OrderProduct.OrderId
LEFT JOIN Product ON Product.ProductId = OrderProduct.ProductId
LEFT JOIN Customer ON Customer.CustomerId = Orders.CId;

SELECT  * FROM OrderProduct a
LEFT JOIN Orders b ON b.OrderId = a.OrderId
LEFT JOIN Product c ON c.ProductId = a.ProductId
LEFT JOIN Customer d ON d.CustomerId = a.CId;

SELECT * FROM Orders a
INNER JOIN (SELECT * FROM Customer WHERE PhoneNumber LIKE '0987654321') b 
	ON a.CId = b.CustomerId
WHERE PhoneNumber LIKE '0987654321';
