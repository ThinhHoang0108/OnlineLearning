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
                width: 100%;
                height: 60vh;
            }
        </style>
    </head>
    <body>
         <a href="sliderList"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button></a>
        <h4 class="modal-title">Slider Detail </h4>
       
    </div>
    <div class="modal-body">
        <div class="form-group">
<!--            <label> Imagine </label>-->
            <img class="mx-auto d-block img-fluid" src="${SliderById.slider_url}" />
            <p></p>
        </div>
        <div class="form-group">
            <label>Title</label>
            <input value="${SliderById.title}" name="sliderUrl" type="text" class="form-control" readonly >
        </div>
        <div class="form-group">
            <label>Content</label>
            <input value="${SliderById.content}" name="content" type="text" class="form-control" readonly >
        </div>
        <div class="form-group">
            <label>Notes</label>
            <input value="${SliderById.notes}" name="notes" type="text" class="form-control" readonly >
        </div>
        <div class="form-group">
            <label>Course</label>
            <input value="${SliderById.course.content}" name="course" type="text" class="form-control" readonly >
        </div>
        
        <a href="updateSlider?slideID=${SliderById.sliderId}" class="btn btn-primary"/>Edit</a>
                                                           
    </div>




</body>
</html>

