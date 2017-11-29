<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    <%@ include file="header.jsp"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Daily Income Reports</title>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
<link href="/css/gen.css" rel="stylesheet">
</head>
<body>
<div id="main">
	<h2 align="center">Daily Income Reports<br> 
<form action="#" method="post">
	<input type="text" id="search" name="search" required="required" placeholder="Search by Date"><button type="submit">Go</button></form>
	</h2>
	<table align="center">
		<tr>
			<th>Id</th>
			<th>Date</th>
			<th>Rent Total</th>
			<th>Orders Total</th>
			<th>Total Income</th>
		</tr>
		<tbody>
			<c:forEach items="${reports}" var="rep">
				<tr>
					<td><a href="#"><c:out
								value="${rep.id}" /> </a></td>
								<td><fmt:formatDate type = "date" value = "${rep.date}" /></td>
					<td><c:out value="${rep.rent_total}" /></td>
					<td><c:out value="${rep.order_total}" /></td>
					<td><c:out value="${rep.total}" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</body>
</html>