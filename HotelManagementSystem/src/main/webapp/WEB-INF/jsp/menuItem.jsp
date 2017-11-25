<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    <%@ include file="header.jsp"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Item Information</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
<link href="/css/gen.css" rel="stylesheet">
</head>
<body>
<c:if test="${item==null}">
<form name="new" action="http://localhost:8080/menu/addItem" method="post">
<fieldset>
<label>Name:</label><input type="text" name="name" required><br>
<label>Type: </label><input type="text" name="type" required><br>
<label>Price: </label><input type="number" name="price" required><br>
<label>Description: </label><input type="text" name="description" required><br>
<input type="submit" value="Add" class="button">
</fieldset>
</form>
</c:if>
<c:if test="${item!=null}">
<c:if test="${action=='edit'}">
<form name="new" action="http://localhost:8080/menu/editItem/${item.id}/" method="post">
<fieldset>
<label>Name:</label><input type="text" name="name" value="${item.name}" required><br>
<label>Type: </label><input type="text" name="type" value="${item.type}" required><br>
<label>Price: </label><input type="number" name="price" value="${item.price}" required><br>
<label>Description: </label><input type="text" name="description" value="${item.description}" required><br>
<input type="submit" value="Edit" class="button">
</fieldset>
</form>
</c:if>
<c:if test="${action=='delete'}">
<form name="new" action="http://localhost:8080/menu/delete/${item.id}/" method="post">
<fieldset>
<label>Name:</label><input type="text" name="name" value="${item.name}" disabled="disabled" required><br>
<label>Type: </label><input type="text" name="type" value="${item.type}" disabled="disabled"  required><br>
<label>Price: </label><input type="number" name="price" value="${item.price}" disabled="disabled"  required><br>
<label>Description: </label><input type="text" name="description" value="${item.description}" disabled="disabled"  required><br>
<input type="submit" value="Delete" class="button">
</fieldset>
</form>
</c:if>
</c:if>
</body>
</html>