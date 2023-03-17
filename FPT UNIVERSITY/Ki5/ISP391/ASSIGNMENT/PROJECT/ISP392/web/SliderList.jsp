

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
                width: 300px;
                height: 400px;
            }
        </style>
    <body>
        <p><a href="dashboard.jsp"><button>Back</button></a>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Manage <b>Slider</b></h2>
                        </div>
                        <div class="col-lg-4">
                            <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"> <i class="material-icons">&#xE147;</i> <span>Add New Slider</span></a>				
                        </div>
                    </div>
                </div>

                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Title</th>
                            <th>Image</th>
                            <th>Status</th>                 
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${sessionScope.listSliders}" var="o">
                            <tr>
                                <td>${o.sliderId}</td>
                                <td>${o.title}</td>
                                <td>
                                    <a href="sliderDetail?sliderId=${o.sliderId}">
                                        <img src="${o.slider_url}">
                                    </a>   
                                </td>
                                <td>${o.status}</td>
                                <td>
                                    <a href="updateSlider?slideID=${o.sliderId}"class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                    <a href="deleteSlider?slideID=${o.sliderId}" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                                </td>
                            </tr>
                        </c:forEach>        
                    </tbody>
                </table>
            </div>
        </div>
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="addSlider" >
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Slider</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					

                            <div class="form-group">
                                <label>Title</label>
                                <input name="title" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Status</label>
                                <input name="status" type="checkbox" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Slider_URL</label>
                                <input name="slider_url" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Content</label>
                                <input name="content" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Notes</label>
                                <input name="notes" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Course</label>
                                <select name="course" class="form-select" aria-label="Default select example">
                                    <c:forEach items="${sessionScope.listCourse}" var="lc">
                                        <option value="${lc.id}">${lc.content}</option>
                                    </c:forEach>
                                </select>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <script src="js/manager.js" type="text/javascript"></script>
    </body>
</html>