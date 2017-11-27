<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    <%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New Reservation</title>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="/css/gen.css" rel="stylesheet">
</head>
<body>
<div id="main">
<div align="center">
<h3>Pick a date to find available rooms</h3>
<form action="newReservation" method="post">
<fieldset>
<label>Start Date:</label><input id="datepicker1" name="date1" required><br>
<label>End Date:</label><input id="datepicker2" name="date2" required><br><button id="avl">Find!</button><br>
<label> Room-No:</label><input id="num" type="text" name="num" required><br>
<label> Customer-Id:</label><input id="cid" type="number" name="cid" required><br>
<input type="submit" value="Create" class="button">
</fieldset>
</form>
<div id="customer">
<h3>Check If Customer Exists. Enter Mobile Number</h3>
<form id="check" >
<fieldset>
<label>Customer Phone:</label><input type="number" id="phone" name="phone" min="1000000000" max="9999999999"required><br>
<input type="submit" value="check" class="button">
<div id="create">
<p>Customer does not exist!</p>
<button id="crecus" >Create Customer</button>
</div>
<div id="cus"></div>
</fieldset>
</form>
</div>
</div>
<div align="center" id="rooms">
<c:forEach items="${rooms}" var="r">
<a onclick="sel(${r.num})">${r.num}</a><br>
</c:forEach>
<div id="sel"></div>
</div>
</div>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
<script type="text/javascript" src="/js/new.js"></script>
</body>
</html>