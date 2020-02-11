<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Top Ten</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
<div class = "container">
<a href="/dashboard">Dashboard</a>
<h3>Top Ten Songs:</h3>
<table class="table table-dark">
    <thead>
        <tr>
            <th>Rating</th>
            <th>Title</th>
            <th>Artist</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${songs}" var="song">
        <tr>
            <td><c:out value="${song.rating}"/></td>
            <td><a href="/songs/${song.id}"><c:out value="${song.title}"/></a></td>
            <td><c:out value="${song.artist}"/></td>
        </tr>
        </c:forEach>
    </tbody>
</table>
</div>
</body>
</html>