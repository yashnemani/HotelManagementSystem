<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    <%@ include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create New Reservation</title>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
<link href="/css/gen.css" rel="stylesheet">
</head>
<body>
<form action="reservations/confirmReservation" method="post">
<fieldset>
<label>Customer-Id:</label><input value="${customer}"type="number" name="c_id"><br>
<label>Room-Num:</label><input value="${room}"type="number" name="room"><br>
<label>Start-Date:</label><input value="${start}" type="text" name="start"><br>
<label>End-Date:</label><input value="${end}" type="text" name="end"><br>
<label>Status: </label><input type="text" name="status"><br>
<label>Rate: </label><input type="number" name="rate"><br>
<input type="submit" value="Confirm">
</fieldset>
</form>
</body>
</html>