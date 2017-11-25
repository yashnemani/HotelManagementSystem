<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    <%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change User</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="/css/gen.css" rel="stylesheet">
</head>
<body>
<c:if test="${user==null}">
<form name="new" action="http://localhost:8080/users/addUser" method="post">
<fieldset>
<label for="fName">First Name:</label><input type="text" name="fName" required><br>
<label for="lName">Last Name: </label><input type="text" name="lName" required><br>
<label for="user">UserName: </label><input type="text" name="user" required><br>
<label fo="pass">Password: </label><input type="password" name="pass" required><br>
<label for="role">Role: </label><input type="text" name="role" required><br>
<input type="submit" value="Add" class="button">
</fieldset>
</form>
</c:if>
<c:if test="${user!=null}">
<c:if test="${action=='edit'}">
<form name="new" action="http://localhost:8080/users/editUser/${user.id}/" method="post">
<fieldset>
<label for="fName">First Name:</label><input type="text" value='${user.fName}' name="fName" required><br>
<label for="lName">Last Name: </label><input type="text" value='${user.lName}' name="lName" required><br>
<label for="user">UserName: </label><input type="text" value='${user.user}'name="user" required><br>
<label for="pass">Password: </label><input type="password" value='${user.pass}' name="pass" required><br>
<label for="role">Role: </label><input type="text" value='${user.role}' name="role" required><br>
<input type="submit" value="Edit" class="button">
</fieldset>
</form>
</c:if>
<c:if test="${action=='delete'}">
<form name="new" action="http://localhost:8080/users/delete/${user.id}/" method="post">
<fieldset>
<label for="fName">First Name:</label><input type="text" value='${user.fName}' name="fName" disabled="disabled" required><br>
<label for="lName">Last Name: </label><input type="text" value='${user.lName}' name="lName" disabled="disabled" required><br>
<label for="user">UserName: </label><input type="text" value='${user.user}'name="user" disabled="disabled" required><br>
<label for="pass">Password: </label><input type="password" value='${user.pass}' name="pass" disabled="disabled" required><br>
<label for="role">Role: </label><input type="text" value='${user.role}' name="role" disabled="disabled" required><br>
<input type="submit" value="Delete" class="button">
</fieldset>
</form>
</c:if>
</c:if>
</body>
</html>