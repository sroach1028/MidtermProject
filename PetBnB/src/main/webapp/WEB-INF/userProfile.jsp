<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/style.css">
<title>User Profile</title>
<%@include file="/WEB-INF/nav.jsp"%>
</head>

<body>

	<div class="container">

		<div class="resultsSingle" style="margin-top: 15px">
			<h1>
				<strong>${nothing }</strong>
			</h1>
		</div>

		<c:if test="${not empty user }">
			<div class="resultsSingle" style="margin-top: 15px">
				<div class="col-sm">
					<h1>
						<strong>${user.firstName} ${user.lastName }</strong>
					</h1>
					<h2>${user.username}</h2>
					<h2>${user.email }</h2>
				</div>

				<div class="resultsSingle">
					<table class="table">
						<th>List of Pets</th>
						<c:forEach items="${user.pets }" var="pet">
							<c:if test="${pet.active == true}">
								<tr>
									<td><a href="getPet.do?petId=${pet.id}"
										class="btTxt submit">${pet.name }</a></td>
								</tr>
							</c:if>
						</c:forEach>
					</table>

				</div>
		</c:if>
		<c:if test="${not empty sessionUser }">
			<c:if test="${empty user}">
				<div class="resultsSingle" style="margin-top: 15px">
					<div class="col-sm">
						<h1>
							<strong>${sessionUser.firstName} ${sessionUser.lastName }</strong>
						</h1>
						<h2>${sessionUser.username}</h2>
						<h2>${sessionUser.email }</h2>
					</div>
					<div class="resultsSingle">
						<table class="table">
							<th>List of Pets</th>
							<c:forEach items="${sessionUser.pets }" var="pet">
								<c:if test="${pet.active == true}">
									<tr>
										<td><a href="getPet.do?petId=${pet.id}"
											class="btTxt submit">${pet.name }</a></td>
									</tr>
								</c:if>
							</c:forEach>
						</table>
						<form action="goToAddPet.do" method="GET">
							<input type="submit" class="btn btn-outline-light"
								value="Add Pet" />
						</form>

					</div>
			</c:if>
			<c:if test="${empty sessionHost }">

				<form action="becomeHost.do" method="GET">
					<input type="hidden" name="id" value=${sessionUser.id } /> <input
						type="submit" class="btn btn-outline-light" value="Become a Host" />
				</form>
			</c:if>
		</c:if>
		<c:if test="${empty user}">
			<c:if test="${not empty sessionHost }">
				<div class="resultsSingle" style="margin-top: 15px">
					<div class="resultsSingle">
						<table class="table">
							<th>List of Services</th>
							<c:forEach items="${sessionHost.services }" var="service">
								<c:if test="${service.active == true}">
									<tr>
										<td>${service.name }</td>
										<td>${service.rate }</td>
									</tr>
								</c:if>
							</c:forEach>
						</table>
						<p>${sessionHost.description }</p>
					</div>
			</c:if>


			<form action="goToUpdateSettings.do" method="GET">
				<input type="hidden" name="hostId" value=${sessionUser.id } /> <input
					type="submit" class="btn btn-outline-light"
					value="Update Host Settings" />
			</form>

		</c:if>
</body>
</html>