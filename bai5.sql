CREATE DATABASE demo;
USE demo;
CREATE TABLE Products (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    productCode VARCHAR(50) NOT NULL,
    productName VARCHAR(100),
    productPrice DECIMAL(10,2),
    productAmount INT,
    productDescription TEXT,
    productStatus BOOLEAN
);
INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
VALUES 
('P001', 'Laptop', 1500.00, 10, 'High-end laptop', 1),
('P002', 'Mouse', 20.50, 100, 'Wireless mouse', 1),
('P003', 'Keyboard', 35.00, 50, 'Mechanical keyboard', 1),
('P004', 'Monitor', 250.00, 20, '24-inch monitor', 1),
('P005', 'Webcam', 45.00, 30, 'HD webcam', 1);

CREATE UNIQUE INDEX idx_product_code ON Products(productCode);
CREATE INDEX idx_name_price ON Products(productName, productPrice);

EXPLAIN SELECT * FROM Products WHERE productCode = 'P001';
EXPLAIN SELECT * FROM Products WHERE productName = 'Mouse' AND productPrice = 20.50;

CREATE VIEW view_products AS
SELECT productCode, productName, productPrice, productStatus
FROM Products;

ALTER VIEW view_products AS
SELECT productCode, productName, productPrice, productStatus, productAmount
FROM Products;

DROP VIEW IF EXISTS view_products;
DELIMITER //
CREATE PROCEDURE getAllProducts()
BEGIN
    SELECT * FROM Products;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE addProduct(
    IN p_code VARCHAR(50),
    IN p_name VARCHAR(100),
    IN p_price DECIMAL(10,2),
    IN p_amount INT,
    IN p_description TEXT,
    IN p_status BOOLEAN
)
BEGIN
    INSERT INTO Products(productCode, productName, productPrice, productAmount, productDescription, productStatus)
    VALUES (p_code, p_name, p_price, p_amount, p_description, p_status);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE updateProductById(
    IN p_id INT,
    IN p_name VARCHAR(100),
    IN p_price DECIMAL(10,2),
    IN p_amount INT,
    IN p_description TEXT,
    IN p_status BOOLEAN
)
BEGIN
    UPDATE Products
    SET productName = p_name,
        productPrice = p_price,
        productAmount = p_amount,
        productDescription = p_description,
        productStatus = p_status
    WHERE Id = p_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE deleteProductById(IN p_id INT)
BEGIN
    DELETE FROM Products WHERE Id = p_id;
END //
DELIMITER ;
