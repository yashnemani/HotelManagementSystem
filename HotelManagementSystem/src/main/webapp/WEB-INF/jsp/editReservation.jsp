<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    <%@ include file="header.jsp"%>
<!DOCTYPE html>
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
<fieldset>
<label>ID:</label><input type="number" name="res_id" value="${res.res_id}"><br>
<label>Customer:</label><input type="number" name="c_id"  value="${res.c_id}"><br>
<label>Room:</label><input type="number" name="room"  value="${res.room}"><br>
<label>Start: </label><input type="text" name="start"  value="${res.start}"><br>
<label>End: </label><input type="text" name="end"  value="${res.end}"><br>
<label>Status: </label><input type="text" name="status"  value="${res.status}"><br>
<label>Rate: </label><input type="number" name="rate"  value="${res.rate}"><br>
<input type="submit" value="Change!" class="button">
</fieldset>
</form>
</c:if>
<c:if test="${action=='delete'}">
<h3 class="msg">Do you want to Delete the following reservation?</h3>
<form action="http://localhost:8080/reservations/change/delete/${res.res_id}/" method="post">
<fieldset>
<label>ID:</label><input type="number" name="res_id" disabled="disabled" value="${res.res_id}"><br>
<label>Customer:</label><input type="number" name="c_id" disabled="disabled" value="${res.c_id}"><br>
<label>Room:</label><input type="number" name="room" disabled="disabled" value="${res.room}"><br>
<label>Start: </label><input type="text" name="start" disabled="disabled" value="${res.start}"><br>
<label>End: </label><input type="text" name="end" disabled="disabled" value="${res.end}"><br>
<label>Status: </label><input type="text" name="status" disabled="disabled" value="${res.status}"><br>
<label>Rate: </label><input type="number" name="rate" disabled="disabled" value="${res.rate}"><br>
<input type="submit" value="Delete!" class="button">
</fieldset>
</form>
</c:if>
</div>
</div>
</body>
</html>