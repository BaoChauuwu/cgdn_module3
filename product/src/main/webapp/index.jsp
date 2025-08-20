<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
    <title>Hệ thống quản lý sản phẩm</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; text-align: center; }
        .welcome-container { max-width: 600px; margin: 0 auto; padding: 20px; }
        .nav-buttons { margin-top: 30px; }
        .btn { 
            background-color: #4CAF50; color: white; padding: 15px 30px; 
            text-decoration: none; border-radius: 8px; margin: 10px; 
            display: inline-block; font-size: 16px;
        }
        .btn:hover { background-color: #45a049; }
        .btn-secondary { background-color: #2196F3; }
        .btn-secondary:hover { background-color: #0b7dda; }
    </style>
</head>
<body>
<div class="welcome-container">
    <h1>Chào mừng đến với Hệ thống Quản lý</h1>
    <p>Hệ thống quản lý sản phẩm và danh mục</p>
    
    <div class="nav-buttons">
        <a href="/product" class="btn">Quản lý Sản phẩm</a>
        <a href="/category" class="btn btn-secondary">Quản lý Danh mục</a>
    </div>
</div>
</body>
</html>