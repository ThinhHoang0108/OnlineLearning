<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <center>
        <h1>List of user</h1>
        <h3><a href="addUser.jsp">Add new</a></h3>
        <table border="1px" width="40%">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>DOB</th>
                <th>Phone</th>
                <th>Username</th>
                <th>Password</th>
            </tr>


            <c:forEach items="${requestScope.listUsers}" var="o" >
                <tr>
                    <td>${o.userID}</td>
                    <td>${o.name}</td>
                    <td>${o.dob}</td>
                    <td>${o.phone}</td>
                    <td>${o.username}</td>
                    <td>${o.password}</td>
                </tr>

            </c:forEach>

        </table>
    </center>


</body>