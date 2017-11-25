<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    <%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Success</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="/css/gen.css" rel="stylesheet">
</head>
<body>
<div id="main">
<div class="head" align ="center">
<h1> ${hello} </h1>
</div>
<c:if test="${users.role=='user'}">
<div align="center" class="mods">
<button value="new"><a href="new">New Reservation</a></button><br>
<button value="book"><a href="reservations">Existing Bookings</a></button><br>
<button value="food"><a href="#">Food Orders</a></button><br>
<button value="newOrder"><a href="menu">New Meal order</a></button><br>
<button value="customer"><a href="customers">Customers Info</a></button><br>
</div>
</c:if>
<c:if test="${users.role=='admin'}">
<div align="center" class="mods">
<button value="user"><a href="users">Manage Users</a></button><br>
<button value="menu"><a href="menu/menuAdmin">Manage Menu Items</a></button><br>
<button value="past"><a href="#">Past Reservations and Orders</a></button><br>
<button value="report"><a href="report">View Reports</a></button><br>
</div>
</c:if>

</div>
</body>
</html>