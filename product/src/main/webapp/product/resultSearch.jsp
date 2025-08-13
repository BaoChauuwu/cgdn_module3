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
    <title>Title</title>
</head>
<body>
<h1>Kết quả sau khi search</h1>
<c:choose>
    <c:when test="${not empty findProduct}">
        <table>
            <tr>
                <th>Name</th>
                <th>Description</th>
                <th>Price</th>
            </tr>
            <tr>
                <td>${findProduct.getName()}</td>
                <td>${findProduct.getDescription()}</td>
                <td>${findProduct.getPrice()}</td>
            </tr>
        </table>
        <p>
            <a href="/product?action=edit&id=${findProduct.getId()}">Edit</a>
        </p>
    </c:when>
    <c:otherwise>
        <p>Không tìm thấy sản phẩm</p>
    </c:otherwise>
</c:choose>
<p><a href="/product">Quay lại danh sách</a></p>
</body>
</html>
