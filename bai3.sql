CREATE DATABASE IF NOT EXISTS banHang;
USE banHang;

CREATE TABLE Customer (
    cID INT PRIMARY KEY,
    cName NVARCHAR(100),
    cAge INT
);

CREATE TABLE Product (
    pID INT PRIMARY KEY,
    pName NVARCHAR(100),
    pPrice DECIMAL(18,2)
);

CREATE TABLE `Order` (
    oID INT PRIMARY KEY,
    cID INT,
    oDate DATE,
    oTotalPrice DECIMAL(18,2),
    FOREIGN KEY (cID) REFERENCES Customer(cID)
);

CREATE TABLE OrderDetail (
    oID INT,
    pID INT,
    odQTY INT,
    PRIMARY KEY (oID, pID),
    FOREIGN KEY (oID) REFERENCES `Order`(oID),
    FOREIGN KEY (pID) REFERENCES Product(pID)
);

-- Insert Customer
INSERT INTO Customer (cID, cName, cAge) VALUES
(1, 'Minh Quan', 10),
(2, 'Ngoc Oanh', 20),
(3, 'Hong Ha', 50);

-- Insert Product
INSERT INTO Product (pID, pName, pPrice) VALUES
(1, 'May Giat', 3),
(2, 'Tu Lanh', 5),
(3, 'Dieu Hoa', 7),
(4, 'Quat', 1),
(5, 'Bep Dien', 2);

-- Insert Order
INSERT INTO `Order` (oID, cID, oDate, oTotalPrice) VALUES
(1, 1, '2006-03-21', NULL),
(2, 2, '2006-03-23', NULL),
(3, 1, '2006-03-16', NULL);

-- Insert OrderDetail
INSERT INTO OrderDetail (oID, pID, odQTY) VALUES
(1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 1),
(2, 5, 8),
(3, 3, 3);

SELECT o.oID, o.oDate, o.oTotalPrice 
FROM `Order` AS o;


SELECT 
    c.cID,
    c.cName,
    p.pName,
    od.odQTY
FROM Customer AS c
JOIN `Order` AS o ON c.cID = o.cID
JOIN OrderDetail AS od ON o.oID = od.oID
JOIN Product AS p ON od.pID = p.pID;



SELECT c.cName 
FROM Customer AS c
LEFT JOIN `Order` AS o ON c.cID = o.cID
WHERE o.oID is NULL;


SELECT o.oID, o.oDate, SUM(od.odQTY * p.pPrice) AS total_price
FROM `Order` AS o
JOIN OrderDetail AS od ON o.oID = od.oID
JOIN Product AS p ON od.pID = p.pID
GROUP BY o.oID, o.oDate;



