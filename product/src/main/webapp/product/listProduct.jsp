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
    <title>Title</title>
</head>
<body>

<a href="/product?action=add"> Thêm mới </a>

<form action="/product?action=find" method="post">
    <p>Tìm kiếm theo id</p>
    <input type="text" name="id" placeholder="moi ban nhap id can tim">
    <button>Tim kiem</button>
</form>

<table>
    <tr>
    <th>STT</th>
    <th>Name</th>
    <th>Description</th>
    <th>Price</th>
    <th>Action</th>
    </tr>

    <c:forEach var="product" items="${productList}" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${product.getName()}</td>
            <td>${product.getDescription()}</td>
            <td>${product.getPrice()}</td>
            <td>
                <a href="/product?action=edit&id=${product.getId()}">Edit</a>
                <form action="/product?action=delete" method="post" style="display:inline">
                    <input type="hidden" name="id" value="${product.getId()}">
                    <button type="submit" onclick="return confirm('Xóa sản phẩm này?')">Delete</button>
                </form>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
