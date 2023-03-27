

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
    <body>
        <form action="updateSlider" method="post">
            <div class="modal-header">						
                <h4 class="modal-title">Edit Slider</h4>
                <a href="sliderList"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button></a>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label> ID: </label>
                    <input value="${slide.sliderId}" name="sliderID" type="text" class="form-control" readonly required>
                    <p></p>
                </div>
                <div class="form-group">
                    <label>Slider_URL</label>
                    <input value="${slide.slider_url}" name="sliderUrl" type="file" class="form-control"  required>
                </div>
                <div class="form-group">
                    <label>Title</label>
                    <input value="${slide.title}" name="title" type="text" class="form-control"  required>
                </div>
                <div class="form-group">
                    <label>content</label>
                    <input value="${slide.content}" name="content" type="text" class="form-control"  required>
                </div>
                <div class="form-group">
                    <label>Notes</label>
                    <input value="${slide.notes}" name="notes" type="text" class="form-control"  required>
                </div>                  
                <div class="form-group">
                    <label>Course</label>
                    <select name="course" class="form-select" aria-label="Default select example">
                        <c:forEach items="${listCourse}" var="lc">
                            <option value="${lc.id}" ${lc.id == slide.course.id?"selected":""}>${lc.content}</option>
                        </c:forEach>
                    </select>
                </div>                  
            </div>
            <div class="modal-footer">
                <input type="submit" class="btn btn-success" value="Edit">
            </div>
        </form>


    </body>
</html>


