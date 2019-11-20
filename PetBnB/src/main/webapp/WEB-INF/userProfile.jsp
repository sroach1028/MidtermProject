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
				<strong>User Profile</strong>
			</h1>
		</div>

		<c:if test="${not empty user }">
			<div class="resultsSingle" style="margin-top: 15px">
				<div class="col-sm">
					<h1>
						<strong>${user.firstName} ${user.lastName }</strong>
					</h1>
					<h2>${user.email }</h2>
					<img src="${user.imageURL }">
				</div>
				<br>
				<p>${user.address.city },${user.address.zip }</p>

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
			</div>
		</c:if>
		<c:if test="${sessionUser.id == user.id}">
			<form action="goToAddPet.do" method="GET">
				<input type="submit" class="btn btn-dark" value="Add Pet" />
			</form>

			<form action="goAccountPage.do" method="GET">
				<input type="hidden" name="id" value=${sessionUser.id } /> <input
					type="submit" class="btn btn-dark" value="Account Details" />
			</form>
		
			<c:if test="${not empty sessionHost}">
				<form action="goToHostPage.do" method="GET">
					<input type="hidden" name="hostId" value=${sessionHost.id } /> 
					<input type="submit" class="btn btn-dark" value="Host Details" />
				</form>
			</c:if>

		</c:if>
	</div>

	<br>
	<br>
	<br>
	<br>
	<br>

</body>
</html>