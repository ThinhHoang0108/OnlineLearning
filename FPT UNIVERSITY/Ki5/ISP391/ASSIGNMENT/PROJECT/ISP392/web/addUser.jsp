<%-- 
    Document   : addUser
    Created on : Feb 13, 2023, 8:59:07 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Add new User</h1>
        <form action="addUser">
            Enter Name:<input type="text" name="name"/><br/>
            Enter Dob:<input type="text" name="Dob"/><br/>
            Enter phone:<input type="text" name="phone"/><br/>
            Enter username:<input type="text" name="username"/><br/>
            Enter password:<input type="text" name="password"/><br/>
            <input type="submit" value="SAVE"/>
        </form>
    </body>
</html>
