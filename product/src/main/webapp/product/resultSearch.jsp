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
<h1>Ket qua sao khi search</h1>
<c:forEach var="product" items="${findProduct}" >
    <tr>
    <td> ${product.getName()} </td>
    <td> ${product.getDescription()} </td>
    <td> ${product.getPrice()} </td>
    </tr>
</c:forEach>
</body>
</html>
