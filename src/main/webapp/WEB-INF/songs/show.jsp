<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Details</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
<div class="container">
<a href="/dashboard">Dashboard</a>
<h3>Title: <c:out value="${song.title}"/></h3>
<h3>Artist: <c:out value="${song.artist}"/></h3>
<h3>Rating (1-10): <c:out value="${song.rating}"/></h3>
<a href="/delete/${song.id}">Delete</a>
</div>
</body>
</html>