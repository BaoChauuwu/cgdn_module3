<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Product</title>
</head>
<body>
<h2>Chỉnh sửa sản phẩm</h2>
<form action="/product?action=update" method="post">
    <input type="hidden" name="id" value="${product.getId()}">
    <div>
        <label>Tên</label>
        <input type="text" name="name" value="${product.getName()}"/>
    </div>
    <div>
        <label>Mô tả</label>
        <input type="text" name="description" value="${product.getDescription()}"/>
    </div>
    <div>
        <label>Giá</label>
        <input type="text" name="price" value="${product.getPrice()}"/>
    </div>
    <button type="submit">Cập nhật</button>
    <a href="/product">Hủy</a>
</form>
</body>
</html> 