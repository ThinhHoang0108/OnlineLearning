<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Admin - Dashboard</title>
        <link href="dashboard/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="dashboard/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="dashboard/css/ruang-admin.min.css" rel="stylesheet">
    </head>

    <body id="page-top">
        <div id="wrapper">
            <!-- Sidebar -->
            <%@ include file="component/adminNvabar.jsp" %>
            <!-- Sidebar -->
            <div id="content-wrapper" class="d-flex flex-column">
                <div id="content">
                    <!-- TopBar -->
                    <nav class="navbar navbar-expand navbar-light bg-navbar topbar mb-4 static-top">
                        <button id="sidebarToggleTop" class="btn btn-link rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>
                    </nav>
                    <!-- Topbar -->
                    <!-- Container Fluid-->
                    <div class="container-fluid" id="container-wrapper">
                        <div class="d-sm-flex align-items-center justify-content-between mb-4">
                            <h1 class="h3 mb-0 text-gray-800">Manager Quiz</h1>
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="dashboard.jsp">Dashboard</a></li>
                                <li class="breadcrumb-item"><a href="QuizListController">Manage Quiz</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Add Quiz</li>
                            </ol>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 mb-4">
                                <div class="card mb-4">
                                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                        <h6 class="m-0 font-weight-bold text-primary">Add new Quiz</h6>
                                    </div>
                                    <div class="card-body">
                                        <form>
                                            <div class="form-group">
                                                <label for="exampleFormControlInput1">Email address</label>
                                                <input type="email" class="form-control" id="exampleFormControlInput1"
                                                       placeholder="name@example.com">
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleFormControlSelect1">Example select</label>
                                                <select class="form-control" id="exampleFormControlSelect1">
                                                    <option>1</option>
                                                    <option>2</option>
                                                    <option>3</option>
                                                    <option>4</option>
                                                    <option>5</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleFormControlSelect2">Example multiple select</label>
                                                <select multiple class="form-control" id="exampleFormControlSelect2">
                                                    <option>1</option>
                                                    <option>2</option>
                                                    <option>3</option>
                                                    <option>4</option>
                                                    <option>5</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleFormControlTextarea1">Example textarea</label>
                                                <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleFormControlReadonly">Readonly</label>
                                                <input class="form-control" type="text" placeholder="Readonly input here..."
                                                       id="exampleFormControlReadonly" readonly>
                                            </div>
                                            <div class="form-group">
                                                <label for="validationServer01">Input with Success</label>
                                                <input type="text" class="form-control is-valid" id="validationServer01"
                                                       placeholder="Input with Success" value="Mark" required>
                                                <div class="valid-feedback">
                                                    Looks good!
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="validationServer03">Input with Error</label>
                                                <input type="text" class="form-control is-invalid" id="validationServer03"
                                                       placeholder="Input with Error" required>
                                                <div class="invalid-feedback">
                                                    Please provide a valid city.
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label>Checkbox</label>
                                                <div class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" id="customCheck2">
                                                    <label class="custom-control-label" for="customCheck2">Check this custom checkbox 1</label>
                                                </div>
                                                <div class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" id="customCheck3">
                                                    <label class="custom-control-label" for="customCheck3">Check this custom checkbox 2</label>
                                                </div>
                                                <div class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" id="customCheckDisabled1" disabled>
                                                    <label class="custom-control-label" for="customCheckDisabled1">Check this custom
                                                        checkbox</label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label>Radio Button</label>
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="customRadio3" name="customRadio" class="custom-control-input">
                                                    <label class="custom-control-label" for="customRadio3">Toggle this custom radio</label>
                                                </div>
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="customRadio4" name="customRadio" class="custom-control-input">
                                                    <label class="custom-control-label" for="customRadio4">Or toggle this other custom radio</label>
                                                </div>
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" name="radioDisabled" id="customRadioDisabled2" class="custom-control-input"
                                                           disabled>
                                                    <label class="custom-control-label" for="customRadioDisabled2">Toggle this custom radio</label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label>Switches</label>
                                                <div class="custom-control custom-switch">
                                                    <input type="checkbox" class="custom-control-input" id="customSwitch1">
                                                    <label class="custom-control-label" for="customSwitch1">Toggle this switch element</label>
                                                </div>
                                                <div class="custom-control custom-switch">
                                                    <input type="checkbox" class="custom-control-input" disabled id="customSwitch2">
                                                    <label class="custom-control-label" for="customSwitch2">Disabled switch element</label>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--Row-->
                    </div>
                    <!---Container Fluid-->
                </div>
            </div>
        </div>

        <!-- Scroll to top -->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <script src="dashboard/vendor/jquery/jquery.min.js"></script>
        <script src="dashboard/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="dashboard/vendor/jquery-easing/jquery.easing.min.js"></script>
        <script src="dashboard/js/ruang-admin.min.js"></script>
        <script src="dashboard/vendor/chart.js/Chart.min.js"></script>
        <script src="dashboard/js/demo/chart-area-demo.js"></script>  
    </body>

</html>