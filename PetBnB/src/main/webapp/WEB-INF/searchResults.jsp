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
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/styles2.css">
<link
	href="https://fonts.googleapis.com/css?family=Fredoka+One|Roboto:300,400"
	rel="stylesheet">

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

li {
	list-style-type: none;
}

img {
	border-radius: 80%;
}

body {
	opacity: 1;
	background-repeat: no-repeat;
	background-size: 100% 40%;
	background-position: 100% 23%;
}
</style>
</head>

<body
	style="background-image: url('http://www.radiopetlady.com/wp-content/uploads/bfi_thumb/RPLN-Multi-Dog-and-cats-2-1920x731-6s69on2zlvwrb6dw71qibv1vbb06omlwrh8zuzntxgs.jpg');">
	<div class="container text-dark">
		<div class="col-md-1"></div>

		<div class="resultsSingle" style="margin-top: 15px">
			<h1>
				<strong>${nothing }</strong>
			</h1>
		</div>

		<c:if test="${not empty hosts }">
			<br>
			<div class="resultsSingle" style="margin-top: 50px">
				<h4>
					<strong> Available Hosts </strong>
				</h4>
			</div>
			<ol class="list-group">
				<c:forEach items="${hosts}" var="host">
					<div class="row mx-sm-n4">
						<div class="col-md-6">
							<div class="p-5 lead border border-dark bg-light rounded">
								<br>
								<li>
									<div class="row mx-sm-n4">
										<div class="col-md-6">
											<h3>
												<span><a href="goToHostPage.do?hostId=${host.id}">
														<img src="${host.user.imageURL }" height="100" width="100" />
														${host.user.firstName }
												</a></span>
											</h3>
											<h4>${host.user.address.city },${host.user.address.state }</h4>
										</div>
										<div class="col-md-6">
											<a href="#!"
												class="collapsible btn btn-secondary bg-dark text-light">Reserve a Service</a>
											<div class="content">
												<table>
													<tr class="list-group">
														<c:forEach items="${host.services }" var="service">
															<td class="list-group-item">${service.name }
																${service.rate }</td>

															<c:if test="${not empty sessionUser.pets }">
																<form action="goToReservation.do" method="GET">
																	<td><input type="hidden" name="hostId"
																		value="${host.id }"> <input type="hidden"
																		name="serviceId" value="${service.id }"> <input
																		type="submit" class="btn btn-outline-light"
																		value="Make Reservation" /></td>
																</form>
															</c:if>
														</c:forEach>
													</tr>
												</table>
											</div>
											<a href="#!"
												class="collapsible btn btn-secondary bg-dark text-light">Reviews</a>
											<div class="content">
												<ol class="list-group">
													<c:forEach items="${host.reviewsOfHost }" var="review">
														<li class="list-group-item">${review.rating }/5
															${review.review}</li>
													</c:forEach>
												</ol>
											</div>
										</div>
								</li>
							</div>
						</div>
					</div>
					<br>
				</c:forEach>
	</div>
	</ol>
	</c:if>

	<c:if test="${empty hosts }">
		<h3>No results found for that location</h3>
	</c:if>

	</div>
<!-- Footer -->
<footer class="page-footer bg-dark text-light font-small blue">

  <!-- Copyright -->
  <div class="footer-copyright text-center py-3">© 2019 Copyright:
    <a href="https://github.com/JesseTrew/MidtermProject"> Vehement Kitten<br>SkillDistillery.com</a>
  </div>
  <!-- Copyright -->

</footer>
<!-- Footer -->
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
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
</body>
</html>