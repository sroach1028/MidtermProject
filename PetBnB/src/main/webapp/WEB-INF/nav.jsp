
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Nav Bar</title>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">

<link rel="stylesheet" href="css/styles2.css">


<link
	href="https://fonts.googleapis.com/css?family=Fredoka+One|Roboto:300,400"
	rel="stylesheet">


</head>
<div class="bg-dark navbar-dark text-white">
	<div class="container">
		<nav class="navbar px-0 navbar-expand-lg navbar-dark">
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
				<div class="navbar-nav">
					<a href="/" class="pl-md-0 p-3 text-light">Home</a> <a
						href="https://github.com/JesseTrew/MidtermProject/"
						class="btn btn-primary" target="_blank"> <span class="fab fa-github mr-2"></span>
						Git
					</a>
					<c:if test="${empty sessionUser }">
						<a href="goLogin.do" class="p-3 text-decoration-none text-light">Login</a>
						<a href="goRegister.do"
							class="p-3 text-decoration-none text-light">Register</a>
					</c:if>
					<c:if test="${not empty sessionUser }">
						<a href="goAccountPage.do?userId=${sessionUser.id }"
							class="p-3 text-decoration-none text-light">My Account</a>
						<a href="logout.do" class="p-3 text-decoration-none text-light">Logout</a>
					</c:if>
				</div>
			</div>
		</nav>

	</div>
</div>
</html>