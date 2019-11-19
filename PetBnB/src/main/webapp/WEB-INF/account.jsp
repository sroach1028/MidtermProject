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
<title>My Account</title>
<%@include file="/WEB-INF/nav.jsp"%>
</head>

<body>
	<c:if test="${! empty sessionUser}">

		<form action="toUserProfile.do" method="GET">
			<input type="hidden" name="id" value=${sessionUser.id } /> <input
				type="submit" class="btn btn-outline-light" value="View Profile" />
		</form>
	</c:if>
	<c:if test="${empty sessionHost}">

		<form action="becomeHost.do" method="GET">
			<input type="hidden" name="id" value=${sessionUser.id } /> <input
				type="submit" class="btn btn-outline-light" value="Become a Host" />
		</form>
	</c:if>
	<div class="container">

		<div class="resultsSingle" style="margin-top: 15px">
			<h1>
				<strong>${nothing }</strong>
			</h1>
		</div>

		<div class="resultsSingle" style="margin-top: 15px">
			<div class="col-sm">
				<h1>
					<strong>${sessionUser.firstName} ${sessionUser.lastName }</strong>
				</h1>
			</div>



			<c:if test="${not empty sessionUser.pets }">
				<div class="resultsSingle" style="margin-top: 15px">
					<div class="col-sm">
						<ol class="list-group">
							<c:forEach items="${sessionUser.pets}" var="pet">
								<li class="list-group-item">
									<h3>
										<a href="toPetProfile.do?petId=${pet.id}">${pet.name } the
											${pet.petType }</a>
									</h3>
									<h2>
										<a href="reservationHistory.do?petId=${pet.id}"> View Past
											Reservations</a>
									</h2>
								</li>
						</ol>
						</c:forEach>
					</div>
				</div>
			</c:if>
			<c:if test="${not empty sessionHost }">
				<div class="resultsSingle" style="margin-top: 15px">
					<div class="col-sm">
					<h2><strong>Host Information</strong></h2>
						<h3>
							<a href="hostReservationHistory.do?hostId=${sessionHost.id}">
							View Past Reservations
							</a>
						</h3>
					</div>
				</div>
			</c:if>
		</div>
		<script>
			var coll = document.getElementsByClassName("collapsible");
			var i;

			for (i = 0; i < coll.length; i++) {
				coll[i].addEventListener("click", function() {
					this.classList.toggle("active");
					var content = this.nextElementSibling;
					if (content.style.display === "block") {
						content.style.display = "none";
					} else {
						content.style.display = "block";
					}
				});
			}
		</script>
</body>
</html>