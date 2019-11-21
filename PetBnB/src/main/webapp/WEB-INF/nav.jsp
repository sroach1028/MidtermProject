
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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

</head>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"
	role="navigation">
	<div class="container">
		<a class="navbar-brand display-4" href="home.do">Boop
			${sessionUser.firstName }!</a>
		<button class="navbar-toggler border-0" type="button"
			data-toggle="collapse" data-target="#exCollapsingNavbar">
			&#9776; </button>
		<div class="collapse navbar-collapse" id="exCollapsingNavbar">
			<ul class="nav navbar-nav flex-row justify-content-between ml-auto">
				<li class="nav-item"><a href="home.do" class="nav-link">Home</a></li>
				<c:if test="${empty sessionUser }">
				
					<li class="dropdown order-1">
						<button type="button" id="dropdownMenu1" data-toggle="dropdown"
							class="btn btn-outline-secondary dropdown-toggle">
							Login <span class="caret"></span>
						</button>
						<ul class="dropdown-menu dropdown-menu-right mt-2">
							<li class="px-3 py-2">
								<form class="form" role="form" action="loginFromNav.do">
									<div class="form-group">
										<input id="usernameInput" name="username"
											placeholder="Username" class="form-control form-control-sm"
											type="text" required="required">
									</div>
									<div class="form-group">
										<input id="passwordInput" name="password"
											placeholder="Password" class="form-control form-control-sm"
											type="password" required="required">
									</div>
									<div class="form-group">
										<button type="submit" class="btn btn-secondary btn-block">Login</button>
										<p class="text-danger">${errorLogin }</p>
									</div>
								</form>
							</li>
						</ul>
					</li>
					
					
					<li class="nav-item"><a href="goRegister.do" class="nav-link">Register</a></li>
				</c:if>
				<c:if test="${not empty sessionUser }">
					<c:if test="${not empty sessionHost }">
						<li class="nav-item"><a
						href="hostReservationHistory.do?hostId=${sessionHost.id }" class="nav-link">My
							Reservations</a></li></c:if>
					<li class="nav-item"><a
						href="toUserProfile.do?id=${sessionUser.id }" class="nav-link">My
							Profile</a></li>
					<li class="nav-item"><a href="goAccountPage.do?id=${sessionUser.id}"
						class="nav-link" title="settings"><i
							class="fa fa-cog fa-fw fa-lg"></i></a></li>
					<li class="nav-item"><a href="logout.do" class="btn btn-outline-secondary toggle">
							Logout <span class="caret"></span>
						</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</nav>

</html>