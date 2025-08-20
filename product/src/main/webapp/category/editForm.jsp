<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Chỉnh sửa danh mục</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .form-container { max-width: 500px; margin: 0 auto; padding: 20px; border: 1px solid #ddd; border-radius: 8px; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; font-weight: bold; }
        input[type="text"], textarea { 
            width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 4px; box-sizing: border-box; 
        }
        textarea { height: 80px; resize: vertical; }
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
    <h2>Chỉnh sửa danh mục</h2>
    <form action="/category?action=update" method="post">
        <input type="hidden" name="id" value="${category.getId()}">
        
        <div class="form-group">
            <label for="name">Tên danh mục:</label>
            <input type="text" id="name" name="name" value="${category.getName()}" required>
        </div>
        
        <div class="form-group">
            <label for="description">Mô tả:</label>
            <textarea id="description" name="description">${category.getDescription()}</textarea>
        </div>
        
        <button type="submit" class="btn">Cập nhật</button>
        <a href="/category" class="btn btn-secondary">Hủy</a>
    </form>
</div>

</body>
</html> 