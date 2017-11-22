<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    <%@ include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Reservation</title>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
<link href="/css/gen.css" rel="stylesheet">
</head>
<body>
<div id="main">
<div align="center">
<c:if test="${action=='edit'}">
<h3 class="msg">Make the necessary changes to this existing reservation</h3>
<form action="http://localhost:8080/reservations/change/edit" method="post">
</c:if>
<c:if test="${action=='delete'}">
<h3 class="msg">Do you want to Delete the following reservation?</h3>
<form action="http://localhost:8080/reservations/change/delete/${res.res_id}/" method="post">
</c:if>
<fieldset>
<label>ID:</label><input type="number" name="res_id" value="${res.res_id}"><br>
<label>Customer:</label><input type="number" name="c_id" value="${res.c_id}"><br>
<label>Room:</label><input type="number" name="room" value="${res.room}"><br>
<label>Start: </label><input type="text" name="start" value="${res.start}"><br>
<label>End: </label><input type="text" name="end" value="${res.end}"><br>
<label>Status: </label><input type="text" name="status" value="${res.status}"><br>
<label>Rate: </label><input type="number" name="rate" value="${res.rate}"><br>
<c:if test="${action=='edit'}">
<input type="submit" value="Change!" class="button">
</c:if>
<c:if test="${action=='delete'}">
<input type="submit" value="Delete!" class="button">
</c:if>
</fieldset>
</form>
</div>
</div>
</body>
</html>