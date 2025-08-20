<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Chỉnh sửa sản phẩm</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .form-container { max-width: 500px; margin: 0 auto; padding: 20px; border: 1px solid #ddd; border-radius: 8px; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; font-weight: bold; }
        input[type="text"], input[type="number"], select, textarea { 
            width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 4px; box-sizing: border-box; 
        }
        select { height: 40px; }
        .btn { 
            background-color: #4CAF50; color: white; padding: 10px 20px; 
            border: none; border-radius: 4px; cursor: pointer; margin-right: 10px;
        }
        .btn:hover { background-color: #45a049; }
        .btn-secondary { background-color: #6c757d; }
        .btn-secondary:hover { background-color: #5a6268; }
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

<div class="form-container">
    <h2>Chỉnh sửa sản phẩm</h2>
    <form action="/product?action=update" method="post">
        <input type="hidden" name="id" value="${product.getId()}">
        
        <div class="form-group">
            <label for="name">Tên sản phẩm:</label>
            <input type="text" id="name" name="name" value="${product.getName()}" required>
        </div>
        
        <div class="form-group">
            <label for="description">Mô tả:</label>
            <textarea id="description" name="description">${product.getDescription()}</textarea>
        </div>
        
        <div class="form-group">
            <label for="price">Giá ($):</label>
            <input type="number" id="price" name="price" value="${product.getPrice()}" step="0.01" min="0" required>
        </div>
        
        <div class="form-group">
            <label for="categoryId">Danh mục:</label>
            <select id="categoryId" name="categoryId">
                <option value="">-- Chọn danh mục --</option>
                <c:forEach var="category" items="${categories}">
                    <option value="${category.getId()}" 
                        <c:if test="${category.getId() == product.getCategoryId()}">selected</c:if>>
                        ${category.getName()}
                    </option>
                </c:forEach>
            </select>
        </div>
        
        <button type="submit" class="btn">Cập nhật</button>
        <a href="/product" class="btn btn-secondary">Hủy</a>
    </form>
</div>

</body>
</html> 