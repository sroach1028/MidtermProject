<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/styles.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<nav class="navbar">

	<ul>
		<li><a href="/" class="nav-button">Home</a></li>
		<li><a href="getAllPets.do" class="nav-button">Pets</a></li>
		<li><a href="coming.do" class="nav-button">Sitters</a></li>
		<c:if test="${empty sessionUser }">
			<li><a href="goRegister.do" class="nav-button">Register</a></li>
			<li><a href="goLogin.do" class="nav-button">Login</a></li>
		</c:if>
		<c:if test="${not empty sessionUser }">
			<li><a href="getUser.do?userId=${sessionUser.id}" class="nav-button">My Account</a></li>
			<li><a href="goLogout.do" class="nav-button">Logout</a></li>
		</c:if>
	</ul>
</nav>
</html>