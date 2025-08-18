-- Tạo database nếu chưa tồn tại
CREATE DATABASE IF NOT EXISTS shop_db;
USE shop_db;

-- Tạo bảng products
CREATE TABLE IF NOT EXISTS products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Xóa dữ liệu cũ nếu có
TRUNCATE TABLE products;

-- Thêm dữ liệu mẫu
INSERT INTO products (name, description, price) VALUES 
('Laptop Dell XPS 13', 'Ultrabook cao cấp, mỏng nhẹ', 29999.99),
('iPhone 15 Pro', 'Smartphone cao cấp của Apple', 34999.00),
('Tai nghe Sony WH-1000XM5', 'Tai nghe chống ồn hàng đầu', 8999.50),
('Bàn phím cơ Keychron K8', 'Bàn phím cơ không dây, hot-swappable', 2599.00),
('Màn hình LG UltraWide 34"', 'Màn hình cong UltraWide cho đa nhiệm', 12999.99);

-- Kiểm tra dữ liệu
SELECT * FROM products; 