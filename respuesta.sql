SELECT p.ProductName
FROM Products p
WHERE (
    SELECT COUNT(DISTINCT o.EmployeeID)
    FROM OrderDetails od
    JOIN Orders o ON od.OrderID = o.OrderID
    WHERE od.ProductID = p.ProductID
) = (SELECT COUNT(*) FROM Employees);

SELECT c.ContactName
FROM Customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM Orders o
    JOIN OrderDetails od ON o.OrderID = od.OrderID
    JOIN Products p ON od.ProductID = p.ProductID
    WHERE o.CustomerID = c.CustomerID
      AND p.UnitPrice >= 50
);

SELECT DISTINCT e.Title, CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName
FROM Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE p.ProductName IN ('Gravad Lax', 'Mishi Kobe Niku');

SELECT CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName,
       c.ContactName AS CustomerName
FROM Orders o
JOIN Employees e ON o.EmployeeID = e.EmployeeID
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Shippers s ON o.ShipVia = s.ShipperID
WHERE s.CompanyName = 'Speedy Express'
  AND c.City = 'Bruxelles';
  
  SELECT DISTINCT CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName,
       e.Address,
       e.City,
       e.Region
FROM Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID
WHERE o.ShipCountry = 'Belgium';



