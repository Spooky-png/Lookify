<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Lookify!</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<div class="container">
<div class="header">
<a class="new" href="/songs/new">Add New</a>
<a class="topten" href="/songs/topTen">Top Songs</a>
<h5 id="banner">Lookify!</h5>
<form id="searchbar" action="/search${q}">
<input name="q"></input>
<button type="submit">Search Artists</button>
</form>
</div>
<table class="table table-dark">
    <thead>
        <tr>
            <th>Title</th>
            <th>Rating</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${songs}" var="song">
        <tr>
            <td><a href="/songs/${song.id}"><c:out value="${song.title}"/></a></td>
            <td><c:out value="${song.rating}"/></td>
            <td>
			    <form action="/delete/${song.id}">
			    	<input type="hidden" name="_method" value="delete">
			    	<input class="delete" type="submit" value="Delete">
			    </form>
			</td>
        </tr>
        </c:forEach>
    </tbody>
</table>
</div>
</body>
</html>