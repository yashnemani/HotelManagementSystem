<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    <%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Adobe Customer</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="/css/gen.css" rel="stylesheet">
</head>
<body>
<h3 class="msg">${msg}</h3>
<form name="new" action="createCustomer" method="post">
<fieldset>
<label for="fName">First Name:</label><input type="text" name="fName" required><br>
<label for="lName">Last Name: </label><input type="text" name="lName" required><br>
<label for="address1">Address1</label><input type="text" name="address1" required><br>
<label for="address2">Address2</label><input type="text" name="address2"><br>
<label for="phone">Phone:</label><input type="number" name="phone" required><br>
<label for="ctry">Country:</label><input type="text" name="country" required><br>
<!-- <label for="email">Email:</label><input type="email" name="email" required><br> -->
<label>DOB</label><input type="date" id="datepicker" name="dob" min="1900-01-01" max="2000-01-01" required><br>
<input type="submit" value="Done" class="button">
</fieldset>
</form>
</body>
</html>