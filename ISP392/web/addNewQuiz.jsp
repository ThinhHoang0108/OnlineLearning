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
        <link href="dashboard/vendor/clock-picker/clockpicker.css" rel="stylesheet">
        <!-- Select2 -->
        <link href="dashboard/vendor/select2/dist/css/select2.min.css" rel="stylesheet" type="text/css">
        <!-- Bootstrap DatePicker -->  
        <link href="dashboard/vendor/bootstrap-datepicker/css/bootstrap-datepicker.min.css" rel="stylesheet" >
        <!-- Bootstrap Touchspin -->
        <link href="dashboard/vendor/bootstrap-touchspin/css/jquery.bootstrap-touchspin.css" rel="stylesheet" >
        <!-- ClockPicker -->
        <link href="dashboard/vendor/clock-picker/clockpicker.css" rel="stylesheet">
        <!-- RuangAdmin CSS -->
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
                                <li class="breadcrumb-item"><a href="dashboard">Dashboard</a></li>
                                <li class="breadcrumb-item"><a href="QuizListController">Manage Quiz</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Quiz Detail</li>
                            </ol>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 mb-4">
                                <div class="card mb-4">
                                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                        <c:if test="${sessionScope.action == 'AddNewQuizz'}">
                                            <h6 class="m-0 font-weight-bold text-primary">Add new Quiz</h6>
                                            <p class="text-success">${sessionScope.messageError}</p>
                                        </c:if>
                                        <c:if test="${sessionScope.action == 'EditQuizController'}">
                                            <h6 class="m-0 font-weight-bold text-primary">Edit Quiz</h6>
                                            <p class="text-danger">${sessionScope.messageError}</p>
                                        </c:if>
                                    </div>
                                    <div class="card-body">
                                        <form action="${sessionScope.action}" method="post">
                                            <div class="form-group">
                                                <label for="exampleFormControlInput1">Quiz name</label>
                                                <c:if test="${sessionScope.action == 'AddNewQuizz'}">
                                                    <input type="text" class="form-control" name="content" id="exampleFormControlInput1" required>
                                                </c:if>
                                                <c:if test="${sessionScope.action == 'EditQuizController'}">
                                                    <input type="text" class="form-control" name="content" id="exampleFormControlInput1" value="${requestScope.quizByID.content}">
                                                </c:if>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleFormControlSelect1">Quiz Level</label>
                                                <select class="form-control" name="levelID" id="exampleFormControlSelect1">
                                                    <c:forEach items="${listQuizLevel}" var="lv">
                                                        <option value="${lv.quizLevelId}" ${lv.quizLevelId == requestScope.quizByID.levelID?"selected":""}>${lv.quizLevelName}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleFormControlSelect1">Course Name</label>
                                                <select class="form-control" name="courseID" id="exampleFormControlSelect1" onchange="CourseToLessonAsync(this.value)">
                                                    <c:forEach items="${listCourse}" var="c">
                                                        <option value="${c.id}" ${c.id == requestScope.quizByID.courseID?"selected":""}>${c.content}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="form-group" id="update_lesson" >
                                                <label for="exampleFormControlSelect1">Lesson Name</label>
                                                <select class="form-control" name="lessonID" >
                                                    <c:forEach items="${listLesson}" var="l">
                                                        <option value="${l.lessonID}" ${l.lessonID == requestScope.quizByID.lessonID?"selected":""}>${l.content}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>

                                            <div class="form-group">
                                                <label for="clockPicker1">Start time</label>
                                                <div class="input-group clockpicker" id="clockPicker1">
                                                    <input type="text" class="form-control" value="${requestScope.quizByID.start_time}" name="start_time">                     
                                                    <div class="input-group-append">
                                                        <span class="input-group-text"><i class="fas fa-clock"></i></span>
                                                    </div>                      
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="clockPicker2">End tiem</label>
                                                <div class="input-group clockpicker" id="clockPicker2">
                                                    <input type="text" class="form-control" value="${requestScope.quizByID.end_time}" name="end_time">                     
                                                    <div class="input-group-append">
                                                        <span class="input-group-text"><i class="fas fa-clock"></i></span>
                                                    </div>                      
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleFormControlInput1">Rate Pass</label>
                                                <c:if test="${sessionScope.action == 'AddNewQuizz'}">
                                                    <input type="number" class="form-control" name="ratePass" id="exampleFormControlInput1" value="${requestScope.quizByID.ratePass}" style="width: 50%" required>
                                                </c:if>
                                                <c:if test="${sessionScope.action == 'EditQuizController'}">
                                                    <input type="number" class="form-control" name="ratePass" id="exampleFormControlInput1" value="${requestScope.quizByID.ratePass}" style="width: 50%">
                                                </c:if>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleFormControlInput1">Total Question</label>
                                                <c:if test="${sessionScope.action == 'AddNewQuizz'}">
                                                    <input type="number" class="form-control" name="totalQuestion" id="exampleFormControlInput1" style="width: 50%" value="${requestScope.quizByID.totalQuestion}" required>
                                                </c:if>
                                                <c:if test="${sessionScope.action == 'EditQuizController'}">
                                                    <input type="number" class="form-control" name="totalQuestion" id="exampleFormControlInput1" style="width: 50%" value="${requestScope.quizByID.totalQuestion}">
                                                </c:if>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleFormControlInput1">Attempt</label>
                                                <c:if test="${sessionScope.action == 'AddNewQuizz'}">
                                                    <input type="number" class="form-control" name="attempt" id="exampleFormControlInput1" style="width: 50%" value="${requestScope.quizByID.attempt}"  required>
                                                </c:if>
                                                <c:if test="${sessionScope.action == 'EditQuizController'}">
                                                    <input type="number" class="form-control" name="attempt" id="exampleFormControlInput1" style="width: 50%" value="${requestScope.quizByID.attempt}">
                                                </c:if>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleFormControlInput1">Duration</label>
                                                <c:if test="${sessionScope.action == 'AddNewQuizz'}">
                                                    <input type="number" class="form-control" name="duration" id="exampleFormControlInput1" style="width: 50%" value="${requestScope.quizByID.attempt}" required>
                                                </c:if>
                                                <c:if test="${sessionScope.action == 'EditQuizController'}">
                                                    <input type="number" class="form-control" name="duration" id="exampleFormControlInput1" style="width: 50%" value="${requestScope.quizByID.attempt}" required>
                                                </c:if>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleFormControlTextarea1">Description</label>
                                                <textarea class="form-control" name="description" id="exampleFormControlTextarea1" rows="3" >${requestScope.quizByID.description}</textarea>
                                            </div>
                                            <div class="col-12">
                                                <div class="d-flex justify-content-center">
                                                    <!--<button type="submit" class="btn btn-primary px-4 py-2 fw-bold">check</button>-->
                                                    <c:if test="${sessionScope.action == 'AddNewQuizz'}">
                                                        <button type="submit" name="btnAction" value="submitQuizz" class="btn btn-primary px-4 py-2 fw-bold">Add</button> 
                                                    </c:if>
                                                    <c:if test="${sessionScope.action == 'EditQuizController'}">
                                                        <button type="submit" name="btnAction" value="submitQuizz" class="btn btn-primary px-4 py-2 fw-bold">Save</button> 
                                                    </c:if>
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
        <script src="dashboard/vendor/clock-picker/clockpicker.js"></script>
        <script src="dashboard/vendor/select2/dist/js/select2.min.js"></script>
        <!-- Select2 -->
        <script src="dashboard/vendor/select2/dist/js/select2.min.js"></script>
        <!-- Bootstrap Datepicker -->
        <script src="dashboard/vendor/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
        <!-- Bootstrap Touchspin -->
        <script src="dashboard/vendor/bootstrap-touchspin/js/jquery.bootstrap-touchspin.js"></script>
        <!-- ClockPicker -->
        <script src="davendor/clock-picker/clockpicker.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/axios@1.1.2/dist/axios.min.js"></script>
        <script>
                                                    function CourseToLessonAsync(courseID) {
                                                        axios.get('AddNewQuiz-async', {
                                                            params: {
                                                                courseID: courseID
                                                            }
                                                        }).then((response) => {
//                                                            console.log(response);
                                                            document.getElementById("update_lesson").innerHTML = response.data;
                                                        })
                                                    }
        </script>
        <script>
            $(document).ready(function () {


                $('.select2-single').select2();

                // Select2 Single  with Placeholder
                $('.select2-single-placeholder').select2({
                    placeholder: "Select a Province",
                    allowClear: true
                });

                // Select2 Multiple
                $('.select2-multiple').select2();

                // Bootstrap Date Picker
                $('#simple-date1 .input-group.date').datepicker({
                    format: 'dd/mm/yyyy',
                    todayBtn: 'linked',
                    todayHighlight: true,
                    autoclose: true,
                });

                $('#simple-date2 .input-group.date').datepicker({
                    startView: 1,
                    format: 'dd/mm/yyyy',
                    autoclose: true,
                    todayHighlight: true,
                    todayBtn: 'linked',
                });

                $('#simple-date3 .input-group.date').datepicker({
                    startView: 2,
                    format: 'dd/mm/yyyy',
                    autoclose: true,
                    todayHighlight: true,
                    todayBtn: 'linked',
                });

                $('#simple-date4 .input-daterange').datepicker({
                    format: 'dd/mm/yyyy',
                    autoclose: true,
                    todayHighlight: true,
                    todayBtn: 'linked',
                });

                // TouchSpin

                $('#touchSpin1').TouchSpin({
                    min: 0,
                    max: 100,
                    boostat: 5,
                    maxboostedstep: 10,
                    initval: 0
                });

                $('#touchSpin2').TouchSpin({
                    min: 0,
                    max: 100,
                    decimals: 2,
                    step: 0.1,
                    postfix: '%',
                    initval: 0,
                    boostat: 5,
                    maxboostedstep: 10
                });

                $('#touchSpin3').TouchSpin({
                    min: 0,
                    max: 100,
                    initval: 0,
                    boostat: 5,
                    maxboostedstep: 10,
                    verticalbuttons: true,
                });

                $('#clockPicker1').clockpicker({
                    donetext: 'Done'
                });

                $('#clockPicker2').clockpicker({
                    autoclose: true
                });

                let input = $('#clockPicker3').clockpicker({
                    autoclose: true,
                    'default': 'now',
                    placement: 'top',
                    align: 'left',
                });

                $('#check-minutes').click(function (e) {
                    e.stopPropagation();
                    input.clockpicker('show').clockpicker('toggleView', 'minutes');
                });

            });
        </script>
    </body>

</html>