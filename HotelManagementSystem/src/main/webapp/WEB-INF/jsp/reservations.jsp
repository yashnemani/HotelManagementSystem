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
<title>Adobe Reservations</title>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
<link href="/css/gen.css" rel="stylesheet">
</head>
<body>
<div id="main">
	<h2 align="center">Existing Reservations <br> 
<form action="#" method="post">
	<input type="text" id="search" name="search" required="required" placeholder="Search Reservations.."><button type="submit">Go</button></form>
	</h2>
	<table align="center">
		<tr>
			<th>Id</th>
			<th>Customer</th>
			<th>Room</th>
			<th>Start</th>
			<th>End</th>
			<th>Status</th>
			<th>Rate</th>
		</tr>
		<tbody>
			<c:forEach items="${reservations}" var="res">
				<tr>
					<td><a href="http://localhost:8080/reservations/reservation/${res.res_id}"><c:out
								value="${res.res_id}" /> </a></td>
					<td><c:out value="${res.c_id}" /></td>
					<td><c:out value="${res.room}" /></td>
					<td><fmt:formatDate type = "date" value = "${res.start}" /></td>
					<td><fmt:formatDate type = "date" value = "${res.end}" /></td>
					<td><c:out value="${res.status}"/></td>		
				<td><c:out value="${res.rate}"/></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</body>
</html>