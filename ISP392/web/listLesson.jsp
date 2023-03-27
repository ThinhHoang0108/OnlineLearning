<%-- 
    Document   : ListLessons
    Created on : Jun 25, 2022, 2:03:17 AM
    Author     : ADMIN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="form-group" id="update_lesson" >
    <label for="exampleFormControlSelect1">Lesson Name</label>
    <select class="form-control" name="lessonID" >
        <c:forEach items="${listLesson}" var="l">
            <option value="${l.lessonID}">${l.content}</option>
        </c:forEach>
    </select>
</div>
