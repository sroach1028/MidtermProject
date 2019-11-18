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
<link rel="stylesheet" href="css/styles2.css">
<title>Search Results</title>
<%@include file="/WEB-INF/nav.jsp"%>
<style>
.collapsible {
	background-color: #777;
	color: white;
	cursor: pointer;
	padding: 18px;
	width: 100%;
	border: none;
	text-align: left;
	outline: none;
	font-size: 15px;
}

.active, .collapsible:hover {
	background-color: #555;
}

.content {
	padding: 0 18px;
	display: none;
	overflow: hidden;
	background-color: #f1f1f1;
}
</style>
</head>

<body>

	<div class="container">

		<div class="resultsSingle" style="margin-top: 15px">
			<h1>
				<strong>${nothing }</strong>
			</h1>
		</div>

		<c:if test="${not empty hosts }">
			<div class="resultsSingle" style="margin-top: 15px">
				<div class="col-sm">
					<ol class="list-group">
						<c:forEach items="${hosts}" var="host">
							<li class="list-group-item">
								<h3>
									<a href="getUser.do?userId=${host.user.id}">${host.user.firstName }</a>
								</h3>
								<h4>${host.user.address.city }, ${host.user.address.state }</h4>

								<h2>Services</h2>
								<button type="button" class="collapsible">Show All
									Services</button>
								<div class="content">
									<ol class="list-group">
										<c:forEach items="${host.services }" var="service">

											<li class="list-group-item">${service.name } -->
												${service.rate }</li>
											<li>

												<form action="goToReservation.do" method="GET">
													<input type="hidden" name="hostId" value="${host.id }">
													<input type="hidden" name="serviceId" value="${service.id }">
													<input type="submit" class="btn btn-outline-light"
														value="Make Reservation" />
												</form>

											</li>
										</c:forEach>
									</ol>
								</div>
								<h2>Reviews</h2>
								<button type="button" class="collapsible">Show All
									reviews</button>
								<div class="content">
									<ol class="list-group">
										<c:forEach items="${host.reviewsOfHost }" var="review">
											<li class="list-group-item">${review.rating }/5
												${review.review}</li>
										</c:forEach>
									</ol>
								</div>



							</li>
					</ol>
					</c:forEach>
					<c:if test="${empty hosts }">
						<h3>No results found for that location</h3>
					</c:if>

				</div>
			</div>
		</c:if>
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