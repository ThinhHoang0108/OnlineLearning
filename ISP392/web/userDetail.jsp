<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap CRUD Data Table for Database with Modal Form</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="csslogin/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    </head>
    <body>
        <a href="manageUser"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button></a>
        <h4 class="modal-title">User Detail of ${acc.name} </h4>
          
    </div>
    <div class="modal-body">
        <div class="form-group">
            <label> Name: </label>
            <input value="${acc.name}" name="sliderID" type="text" class="form-control" readonly required>
            <p></p>
        </div>
        <div class="form-group">
            <label>DOB:</label>
            <input value="${acc.dob}" name="sliderUrl" type="text" class="form-control" readonly required>
        </div>
        <div class="form-group">
            <label>Phone:</label>
            <input value="${acc.phone}" name="title" type="text" class="form-control" readonly required>
        </div>
        <div class="form-group">
            <label>Email:</label>
            <input value="${acc.email}" name="title" type="text" class="form-control" readonly required>
        </div>
        <div class="form-group">
            <label>Username:</label>
            <input value="${acc.username}" name="content" type="text" class="form-control" readonly required>
        </div>
        <div class="form-group">
            <label>Password:</label>
            <input value="${acc.password}" name="notes" type="password" class="form-control" readonly required>
        </div>                                                   
    </div>




</body>
</html>
