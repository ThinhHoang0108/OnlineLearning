<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
       <head>
       <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Edit Profile</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    </head>
    <body>
         <div id="layoutSidenav_content">
                <div class="container-fluid px-4 px-lg-5 mb-5" style="margin-top: 91px">
                    <h1>User Detail of ${acc.name} </h1>
                    <div class="mb-3 mx-auto d-block shadow p-3 bg-white rounded" style="padding: 10px 0px 10px 10px; border-radius: 8px; width: 32%; margin-left: 10px; width: 100% !important">
                        
                        <table>                   

                            <tr><td colspan="2" id="error-fname"></td></tr>
                           
                            <tr>
                                <td> Name: </td>
                                <td>${acc.name}</td>
                            </tr>
                            <tr><td colspan="2" id="error-lname" ></td></tr>

                            <tr>
                                <td>DOB: </td>
                                <td>${acc.dob}</td>
                            </tr>
                            <tr><td colspan="2" ></td></tr>

                            <tr>
                                <td>Phone: </td>
                                <td>${acc.phone}</td>
                            </tr>
                            <tr><td colspan="2"></td></tr>

                            <tr>
                                <td>Username: </td>
                                <td>${acc.username}</td>
                            </tr>
                            <tr><td></td></tr>

                            <tr>
                                <td>Password: </td>
                                <td>*********</td>
                            </tr>
                            <tr><td colspan="2"></td></tr>


                        </table>
                    </div>
                </div>  
            </div>
        </div>

    
    </body>
</html>
