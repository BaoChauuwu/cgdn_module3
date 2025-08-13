<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 8/8/2025
  Time: 8:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/product?action=add" method="post">
    <input type="text" placeholder="Mời bạn nhập tên" name="name">
    <input type="text" placeholder="Mời bạn nhập mô tả" name="description">
    <input type="text" placeholder="Mời bạn nhập giá" name="price">
    <button type="submit"> Add Product</button>
</form>
<p><a href="/product">Quay lại danh sách</a></p>
</body>
</html>
