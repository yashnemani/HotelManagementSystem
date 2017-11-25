<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
         <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    <%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Menu Items</title>
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
<div align="center">

	<h2 align="center">Search Food Items from the Menu<br> 
	<input type="text" id="search" name="search" required="required" placeholder="Search Items..">
	<button class="button" onclick="search()">Go</button>
	</h2>
	
	<a class="out" href="http://localhost:8080/menu/itemAdd">Add New Item</a>
	<div class="menu" id="items"></div>
</div>
</div>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>
/* $('#search').keyup(function(){
	var q = $(this).val();
	$.getJSON("http://localhost:8080/menu/search/"+q+"/", successfn);
}); */
function search(){
	var q = $('#search').val();
	$.getJSON("http://localhost:8080/menu/search/"+q+"/", successfn);
}
function sel(type){
	var type = type;
	$.getJSON("http://localhost:8080/menu/type/"+type+"/", successfn);
}
function successfn(result){
	var out = "<ul> ";
	for(var r in result){
	out += "<li><h4>"+result[r].name+"</h4><a  class='edlink' href='http://localhost:8080/menu/itemEdit/"+result[r].id+"/'>Edit<i class='fa fa-pencil-square-o' aria-hidden='true'></i></a><a class='delink' href='http://localhost:8080/menu/delete/"+result[r].id+"/'>Delete<i class='fa fa-times' aria-hidden='true'></i></a></li>";
	}
	out += "</ul>";
	$('#items').html(out);
 }
</script>
</body>
</html>