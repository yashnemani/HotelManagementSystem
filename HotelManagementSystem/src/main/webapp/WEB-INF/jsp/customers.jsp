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
<title>Customers Info</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
<link href="/css/gen.css" rel="stylesheet">
</head>
<body>
<div id="main">
<div align="center">
<h1>Adobe Customer Info</h1>
 <a class="out" href="customerAdd">Add New Customer</a>
</div>
<div align="center" id="cus">
<table align="center">
		<tr>
			<th>Id</th>
			<th>FirstName</th>
			<th>LastName</th>
			<th>Address1</th>
			<th>Address2</th>
			<th>Phone</th>
			<th>Country</th>
			<th>DOB</th>
		</tr>
		<tbody>
			<c:forEach items="${customers}" var="c">
				<tr>
					<td><a href="#"><c:out
								value="${c.id}" /> </a></td>
					<td><c:out value="${c.fName}" /></td>
					<td><c:out value="${c.lName}" /></td>
					<td><c:out value="${c.address1}" /></td>
					<td><c:out value="${c.address2}" /></td>
					<td><c:out value="${c.phone}"/></td>		
				<td><c:out value="${c.country}"/></td>
				<td><fmt:formatDate type = "date" value = "${c.dob}" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</div>
</body>
</html>