<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    <%@ include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Users Details</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="/css/gen.css" rel="stylesheet">
</head>
<body>
<div id="main">
<div align="center">
<h3>Adobe EndUsers Info</h3>
 <a class="out" href="http://localhost:8080/users/userAdd">Add New User</a>
</div>
<div align="center" id="cus">
<table align="center">
		<tr>
			<th>Id</th>
			<th>FirstName</th>
			<th>LastName</th>
			<th>User</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>
		<tbody>
			<c:forEach items="${endusers}" var="c">
				<tr>
					<td><a href="#"><c:out
								value="${c.id}" /> </a></td>
					<td><c:out value="${c.fName}" /></td>
					<td><c:out value="${c.lName}" /></td>
					<td><c:out value="${c.user}" /></td>
					<td><a href="http://localhost:8080/users/userEdit/${c.id}/"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>
					<td><a href="http://localhost:8080/users/delete/${c.id}/"><i class="fa fa-times" aria-hidden="true"></i> </a></td>
					
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</div>
</body>
</html>