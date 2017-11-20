<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Adobe Hotels Home</title>
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> -->
<link href="/css/gen.css" rel="stylesheet">
<!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script> -->
</head>
<body>
<div id="main">
<div align="center">
<h1> ${hello} </h1>
<h3 class="msg">${error}</h3>
</div>
<form  name="login" action="login" method="post">
<fieldset>
<label for="user"> Username</label>
<input type="text" name="user" required> <br>
<label for="pass"> Password</label>
<input type="password" name="pass" required> <br>
<input type="submit" value="Sign In" class="button">
</fieldset>
</form>
</div>
</body>