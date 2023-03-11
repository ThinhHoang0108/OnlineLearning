<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="author" content="Kodinger">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <title>My Login Page &mdash; Bootstrap 4 Login Page Snippet</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="csslogin/my-login.css">
    </head>
    <body class="my-login-page">
        <section class="h-100">
            <div class="container h-100">
                <div class="row justify-content-md-center h-100">
                    <div class="card-wrapper">
                        <div class="brand">
                        </div>
                        <div class="card fat">
                            <div class="card-body">
                                <h4 class="card-title">Register</h4>
                                <form method="post" class="my-login-validation" novalidate="" action="register">
                                    <div class="form-group">
                                        <label for="username">User Name</label>
                                        <input id="username" type="text" class="form-control" name="username" required>
                                    </div>

                                    <div class="form-group">
                                        <label for="password">Password</label>
                                        <input id="password" type="password" class="form-control" name="password" required data-eye maxlength="50">
                                    </div>
                                    <div class="form-group">
                                        <label for="email">E-Mail Address</label>
                                        <input id="email" type="text" class="form-control" name="email" required>
                                        <div class="invalid-feedback">
                                            Your email is invalid
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="phone">Phone Number</label>
                                        <input id="password" type="text" class="form-control" name="phone" required>
                                    </div>
                                    <div class="form-group">
                                        <div class="custom-checkbox custom-control">
                                            <input type="checkbox" name="agree" id="agree" class="custom-control-input" required="">
                                            <label for="agree" class="custom-control-label">I agree to the <a href="#">Terms and Conditions</a></label>
                                            <div class="invalid-feedback">
                                                You must agree with our Terms and Conditions
                                            </div>
                                        </div>
                                    </div>
                                    <h4 class=" text-danger">
                                        ${msg}
                                    </h4><br/>
                                    <div class="form-group m-0">
                                        <button type="submit" class="btn btn-primary btn-block">
                                            Register
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