<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quản lý danh mục</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        table { border-collapse: collapse; width: 100%; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 12px; text-align: left; }
        th { background-color: #f2f2f2; font-weight: bold; }
        tr:nth-child(even) { background-color: #f9f9f9; }
        .search-container { display: flex; gap: 20px; margin: 20px 0; padding: 15px; background-color: #f5f5f5; border-radius: 5px; }
        .search-form { flex: 1; }
        .search-form input[type="text"], .search-form input[type="number"] { 
            width: 200px; padding: 8px; margin-right: 10px; border: 1px solid #ddd; border-radius: 4px; 
        }
        .btn { 
            background-color: #4CAF50; color: white; padding: 8px 15px; 
            text-decoration: none; border: none; border-radius: 4px; cursor: pointer; 
        }
        .btn:hover { background-color: #45a049; }
        .btn-danger { background-color: #f44336; }
        .btn-danger:hover { background-color: #da190b; }
        .btn-warning { background-color: #ff9800; }
        .btn-warning:hover { background-color: #e68900; }
        .actions { display: inline-block; }
        .header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px; }
        .nav-links { margin-bottom: 20px; }
        .nav-links a { margin-right: 15px; padding: 8px 15px; text-decoration: none; background-color: #2196F3; color: white; border-radius: 4px; }
        .nav-links a:hover { background-color: #0b7dda; }
    </style>
</head>
<body>

<div class="nav-links">
    <a href="/product">Quản lý Sản phẩm</a>
    <a href="/category">Quản lý Danh mục</a>
</div>

<div class="header">
    <h1>Quản lý danh mục</h1>
    <a href="/category?action=add" class="btn">+ Thêm danh mục mới</a>
</div>

<div class="search-container">
    <div class="search-form">
        <form action="/category" method="post" style="display: inline;">
            <input type="hidden" name="action" value="find">
            <label><strong>Tìm kiếm theo ID:</strong></label><br>
            <input type="number" name="id" placeholder="Nhập ID danh mục" min="1">
            <button type="submit" class="btn">Tìm theo ID</button>
        </form>
    </div>
    
    <div class="search-form">
        <form action="/category" method="post" style="display: inline;">
            <input type="hidden" name="action" value="search">
            <label><strong>Tìm kiếm theo tên:</strong></label><br>
            <input type="text" name="name" placeholder="Nhập tên danh mục">
            <button type="submit" class="btn">Tìm theo tên</button>
        </form>
    </div>
</div>

<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Tên danh mục</th>
        <th>Mô tả</th>
        <th>Thao tác</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="category" items="${categoryList}">
        <tr>
            <td>${category.getId()}</td>
            <td>${category.getName()}</td>
            <td>${category.getDescription()}</td>
            <td class="actions">
                <a href="/category?action=edit&id=${category.getId()}" class="btn btn-warning">Sửa</a>
                <a href="/category?action=delete&id=${category.getId()}" 
                   class="btn btn-danger"
                   onclick="return confirm('Bạn có chắc chắn muốn xóa danh mục ${category.getName()}?')">Xóa</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<c:if test="${empty categoryList}">
    <p style="text-align: center; margin-top: 50px; font-size: 18px; color: #888;">
        Không có danh mục nào. <a href="/category?action=add" class="btn">Thêm danh mục đầu tiên</a>
    </p>
</c:if>

</body>
</html> 