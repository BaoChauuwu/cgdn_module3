<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 8/8/2025
  Time: 9:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Kết quả tìm kiếm</title>
    <style>
        table { border-collapse: collapse; width: 100%; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
        .search-info { background-color: #e7f3ff; padding: 10px; margin-bottom: 20px; border-radius: 5px; }
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

<h1>Kết quả tìm kiếm</h1>

<!-- Hiển thị thông tin tìm kiếm -->
<c:if test="${not empty searchKeyword}">
    <div class="search-info">
        <strong>Từ khóa tìm kiếm:</strong> "${searchKeyword}"
    </div>
</c:if>

<!-- Hiển thị kết quả tìm kiếm theo ID (findProduct) -->
<c:if test="${not empty findProduct}">
    <h3>Sản phẩm tìm thấy theo ID:</h3>
    <table>
        <tr>
            <th>ID</th>
            <th>Tên sản phẩm</th>
            <th>Mô tả</th>
            <th>Giá</th>
            <th>Danh mục</th>
            <th>Thao tác</th>
        </tr>
        <tr>
            <td>${findProduct.getId()}</td>
            <td>${findProduct.getName()}</td>
            <td>${findProduct.getDescription()}</td>
            <td>$${findProduct.getPrice()}</td>
            <td>
                <c:choose>
                    <c:when test="${not empty findProduct.getCategoryName()}">
                        ${findProduct.getCategoryName()}
                    </c:when>
                    <c:otherwise>
                        <em>Chưa phân loại</em>
                    </c:otherwise>
                </c:choose>
            </td>
            <td>
                <a href="/product?action=edit&id=${findProduct.getId()}">Sửa</a> |
                <a href="/product?action=delete&id=${findProduct.getId()}" 
                   onclick="return confirm('Bạn có chắc muốn xóa sản phẩm này?')">Xóa</a>
            </td>
        </tr>
    </table>
</c:if>

<!-- Hiển thị kết quả tìm kiếm theo tên (searchResults) -->
<c:if test="${not empty searchResults}">
    <h3>Sản phẩm tìm thấy theo tên (${searchResults.size()} kết quả):</h3>
    <table>
        <tr>
            <th>ID</th>
            <th>Tên sản phẩm</th>
            <th>Mô tả</th>
            <th>Giá</th>
            <th>Danh mục</th>
            <th>Thao tác</th>
        </tr>
        <c:forEach var="product" items="${searchResults}">
            <tr>
                <td>${product.getId()}</td>
                <td>${product.getName()}</td>
                <td>${product.getDescription()}</td>
                <td>$${product.getPrice()}</td>
                <td>
                    <c:choose>
                        <c:when test="${not empty product.getCategoryName()}">
                            ${product.getCategoryName()}
                        </c:when>
                        <c:otherwise>
                            <em>Chưa phân loại</em>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <a href="/product?action=edit&id=${product.getId()}">Sửa</a> |
                    <a href="/product?action=delete&id=${product.getId()}" 
                       onclick="return confirm('Bạn có chắc muốn xóa sản phẩm này?')">Xóa</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</c:if>

<!-- Hiển thị thông báo không tìm thấy -->
<c:if test="${empty findProduct && empty searchResults}">
    <div class="search-info">
        <p><strong>Không tìm thấy sản phẩm nào!</strong></p>
        <c:if test="${not empty searchKeyword}">
            <p>Không có sản phẩm nào chứa từ khóa "${searchKeyword}"</p>
        </c:if>
    </div>
</c:if>

<div style="margin-top: 20px;">
    <a href="/product" style="background-color: #4CAF50; color: white; padding: 10px 15px; text-decoration: none; border-radius: 4px;">← Quay lại danh sách sản phẩm</a>
</div>
</body>
</html>
