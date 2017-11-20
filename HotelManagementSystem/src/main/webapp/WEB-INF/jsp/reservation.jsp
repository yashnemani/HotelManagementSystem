<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    <%@ include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reservation Details</title>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
<link href="/css/gen.css" rel="stylesheet">
</head>
<body>
<div id="main">
<h2 align="center"> Reservation Details</h2>
<div align="center">
<h3><span id="label">Id</span> <br><c:out value="${res.res_id}"></c:out> </h3> 
<h3><span id="label">Customer</span> <br> <c:out value="${res.c_id}"></c:out>  </h3> 
<h3><span id="label">Room</span> <br><c:out value="${res.room}"></c:out> </h3> 
<h3><span id="label">Start</span> <br> <fmt:formatDate type = "date" value = "${res.start}" /></h3> 
<h3><span id="label">End</span><br><fmt:formatDate type = "date" value = "${res.end}" /></h3> 
<h3><span id="label">Status</span> <br><c:out value="${res.status}"></c:out></h3> 
<h3><span id="label">Rate</span><br> <c:out value="${res.rate}"></c:out></h3> 
</div>
 <a class="out" href="#"> Edit Reservation</a>
 <a class="out" style="float:right;" href="#"> Delete Reservation</a>
 <div align = "center"> <a class="out" href="http://localhost:8080/reservations/checkin/${res.res_id}/">  CheckIn</a><br><a class="out" href="http://localhost:8080/reservations/checkout/${res.res_id}/">  CheckOut</a> </div>
</div>
</body>
</html>