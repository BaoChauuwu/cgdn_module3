<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 8/8/2025
  Time: 8:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quản lý sản phẩm</title>
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
    </style>
</head>
<body>

<div class="header">
    <h1>Quản lý sản phẩm</h1>
    <a href="/product?action=add" class="btn">+ Thêm sản phẩm mới</a>
</div>

<div class="search-container">
    <div class="search-form">
        <form action="/product" method="post" style="display: inline;">
            <input type="hidden" name="action" value="find">
            <label><strong>Tìm kiếm theo ID:</strong></label><br>
            <input type="number" name="id" placeholder="Nhập ID sản phẩm" min="1">
            <button type="submit" class="btn">Tìm theo ID</button>
        </form>
    </div>
    
    <div class="search-form">
        <form action="/product" method="post" style="display: inline;">
            <input type="hidden" name="action" value="search">
            <label><strong>Tìm kiếm theo tên:</strong></label><br>
            <input type="text" name="name" placeholder="Nhập tên sản phẩm">
            <button type="submit" class="btn">Tìm theo tên</button>
        </form>
    </div>
</div>

<c:choose>
    <c:when test="${not empty productList}">
        <table>
            <tr>
                <th>ID</th>
                <th>Tên sản phẩm</th>
                <th>Mô tả</th>
                <th>Giá ($)</th>
                <th>Thao tác</th>
            </tr>

            <c:forEach var="product" items="${productList}">
                <tr>
                    <td>${product.getId()}</td>
                    <td>${product.getName()}</td>
                    <td>${product.getDescription()}</td>
                    <td>$${product.getPrice()}</td>
                    <td class="actions">
                        <a href="/product?action=edit&id=${product.getId()}" class="btn btn-warning">Sửa</a>
                        <form action="/product" method="post" style="display:inline; margin-left: 5px;">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="id" value="${product.getId()}">
                            <button type="submit" class="btn btn-danger" onclick="return confirm('Bạn có chắc muốn xóa sản phẩm này?')">Xóa</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
        
        <div style="margin-top: 20px;">
            <p><strong>Tổng số sản phẩm:</strong> ${productList.size()}</p>
        </div>
    </c:when>
    <c:otherwise>
        <div style="text-align: center; padding: 40px; background-color: #f9f9f9; border-radius: 5px;">
            <h3>Chưa có sản phẩm nào</h3>
            <p>Hãy thêm sản phẩm đầu tiên để bắt đầu!</p>
            <a href="/product?action=add" class="btn">+ Thêm sản phẩm đầu tiên</a>
        </div>
    </c:otherwise>
</c:choose>

</body>
</html>
