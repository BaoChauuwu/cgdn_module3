<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Danh sách sinh viên là: </h1>
<table>
    <tr>
        <th>Tên</th>
        <th>Ngay sinh</th>
        <th>Địa chỉ</th>
    </tr>

    <c:forEach var="customer" items="${listCustomer}">
        <tr>
            <td>${customer.getName()}</td>
            <td>${customer.getDateofBrithday()}</td>
            <td>${customer.getAddress()}</td>
        </tr>
    </c:forEach>

</table>
</body>
</html>
