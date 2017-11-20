<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    <%@ include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create a new Meal order!</title>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
<link href="/css/gen.css" rel="stylesheet">
<link href="/css/menu.css" rel="stylesheet">
</head>
<body>
<div id="main">
<div class="side">
<h3>MENU</h3>
<ul>
<li><a onclick="sel('app')">Appetizers</a></li>
<li><a onclick="sel('main')">Maincourse</a></li>
<li><a onclick="sel('des')">Desserts</a></li>
<li><a onclick="sel('bev')">Beverages</a></li>
</ul>
</div>
<div id="order">
<h3>Order Info</h3>
</div>
<div align="center">
<h3>Choose the Items from Menu below!</h3>
<div class="menu" id="items">
<ul >
<c:forEach items="${menu}" var="m">
<li>
<div id="add">
<button onclick="add(${m.id},'${m.name}',${m.price})">Add</button>
 <input type="number" min="1" value="1" id="${m.id}">
</div>
<h4>${m.name}</h4>
<p id="price">$ ${m.price}</p>
<p>${m.description}</p>
</li>
</c:forEach>
</ul>
</div>
</div>
</div>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="js/menu.js"></script>
</body>
</html>