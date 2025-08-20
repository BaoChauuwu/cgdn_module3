<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Kết quả tìm kiếm danh mục</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        table { border-collapse: collapse; width: 100%; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 12px; text-align: left; }
        th { background-color: #f2f2f2; font-weight: bold; }
        tr:nth-child(even) { background-color: #f9f9f9; }
        .search-info { background-color: #e7f3ff; padding: 10px; margin-bottom: 20px; border-radius: 5px; }
        .btn { 
            background-color: #4CAF50; color: white; padding: 8px 15px; 
            text-decoration: none; border: none; border-radius: 4px; cursor: pointer; margin-right: 5px;
        }
        .btn:hover { background-color: #45a049; }
        .btn-danger { background-color: #f44336; }
        .btn-danger:hover { background-color: #da190b; }
        .btn-warning { background-color: #ff9800; }
        .btn-warning:hover { background-color: #e68900; }
        .btn-secondary { background-color: #2196F3; }
        .btn-secondary:hover { background-color: #0b7dda; }
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

<h1>Kết quả tìm kiếm danh mục</h1>

<!-- Hiển thị thông tin tìm kiếm -->
<c:if test="${not empty searchKeyword}">
    <div class="search-info">
        <strong>Từ khóa tìm kiếm:</strong> "${searchKeyword}"
    </div>
</c:if>

<!-- Hiển thị kết quả tìm kiếm theo ID (findCategory) -->
<c:if test="${not empty findCategory}">
    <h3>Danh mục tìm thấy theo ID:</h3>
    <table>
        <tr>
            <th>ID</th>
            <th>Tên danh mục</th>
            <th>Mô tả</th>
            <th>Thao tác</th>
        </tr>
        <tr>
            <td>${findCategory.getId()}</td>
            <td>${findCategory.getName()}</td>
            <td>${findCategory.getDescription()}</td>
            <td>
                <a href="/category?action=edit&id=${findCategory.getId()}" class="btn btn-warning">Sửa</a>
                <a href="/category?action=delete&id=${findCategory.getId()}" 
                   class="btn btn-danger"
                   onclick="return confirm('Bạn có chắc chắn muốn xóa danh mục ${findCategory.getName()}?')">Xóa</a>
            </td>
        </tr>
    </table>
</c:if>

<!-- Hiển thị kết quả tìm kiếm theo tên (searchResults) -->
<c:if test="${not empty searchResults}">
    <h3>Kết quả tìm kiếm theo tên:</h3>
    <p>Tìm thấy ${searchResults.size()} kết quả</p>
    
    <table>
        <tr>
            <th>ID</th>
            <th>Tên danh mục</th>
            <th>Mô tả</th>
            <th>Thao tác</th>
        </tr>
        <c:forEach var="category" items="${searchResults}">
            <tr>
                <td>${category.getId()}</td>
                <td>${category.getName()}</td>
                <td>${category.getDescription()}</td>
                <td>
                    <a href="/category?action=edit&id=${category.getId()}" class="btn btn-warning">Sửa</a>
                    <a href="/category?action=delete&id=${category.getId()}" 
                       class="btn btn-danger"
                       onclick="return confirm('Bạn có chắc chắn muốn xóa danh mục ${category.getName()}?')">Xóa</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</c:if>

<!-- Thông báo không tìm thấy kết quả -->
<c:if test="${empty findCategory and empty searchResults and (not empty param.action)}">
    <div class="search-info" style="background-color: #fff3cd; border: 1px solid #ffecb5; color: #856404;">
        <strong>Không tìm thấy kết quả nào!</strong>
    </div>
</c:if>

<p style="margin-top: 30px;">
    <a href="/category" class="btn btn-secondary">← Quay lại danh sách danh mục</a>
    <a href="/category?action=add" class="btn">+ Thêm danh mục mới</a>
</p>

</body>
</html> 