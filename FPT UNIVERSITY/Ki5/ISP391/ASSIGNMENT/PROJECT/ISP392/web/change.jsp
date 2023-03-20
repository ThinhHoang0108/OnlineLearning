
<%-- 
    Document   : change
    Created on : Feb 13, 2023, 1:32:33 AM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="author" content="Kodinger">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <title>Change Password</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="csslogin/my-login.css">
        <!--sdfsadf-->
    </head>
    <body class="my-login-page">
        <a href="changeProfile.jsp"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button></a>
        <section class="h-100">
            <div class="container h-100">
                <div class="row justify-content-md-center align-items-center h-100">
                    <div class="card-wrapper">
                        <div class="brand">
                            <a href="home"> <img src="assets/img/logo.jpeg" alt="bootstrap 4 login page"></a>
                        </div>
                        <div class="card fat">
                            <div class="card-body">
                                <h4 class="card-title">Change Password</h4>
                                <form action="ChangePasswordController" method="post" class="my-login-validation" novalidate="" >
                                    <div class="form-group">
                                        <label for="new-password">Old Password</label>
                                        <input  type="password" class="form-control" name="oldPassword" required autofocus data-eye>
                                        <label for="new-password">New Password</label>
                                        <input  type="password" class="form-control" name="password" required autofocus data-eye>
                                        <label for="new-password">Reset Password</label>
                                        <input type="password" class="form-control" name="twicePassword" required autofocus data-eye>
                                        <input type="hidden" class="form-control" name="email" value="${email}">
                                        <input type="hidden" class="form-control" name="username" value="${sessionScope.account.username}">

                                        <input type="hidden" class="form-control" name="action" value="change">
                                        <div style="color: red">${msg}</div>
                                        <div style="color: green">${msg1}</div>
                                        <div class="form-text text-muted">
                                            Make sure your password is strong and easy to remember
                                        </div>
                                    </div>

                                    <div class="form-group m-0">
                                        <button type="submit" class="btn btn-primary btn-block">
                                            Change Password
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="footer">
                            Copyright &copy; 2017 &mdash; Your Company 
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="js/my-login.js"></script>
    </body>
</html>

