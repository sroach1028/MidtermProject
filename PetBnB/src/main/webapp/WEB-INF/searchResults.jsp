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
	background-size: contain;
	background-position: 100% 32%;
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
				<c:forEach items="${hosts}" var="host">
					<div class="row mx-sm-n4">
						<div class="col-md-11">
							<div class="p-5 lead border border-dark bg-light rounded">
								<br>
									<div class="row mx-sm-n4">
										<div class="col-md-5">
											<h3>
												<span><a href="goToHostPage.do?hostId=${host.id}">
														<img src="${host.user.imageURL }" height="100" width="100" />
														${host.user.firstName }
												</a></span>
											</h3>
											<h4>${host.user.address.city },${host.user.address.state }</h4>
										</div>
										<div class="col-md-6">
												<table class="table table-sm table-light table-borderless rounded">
												<thead>
												</thead>
												<tbody>
													<c:forEach items="${host.services }" var="service">
													<tr class="table-info">
														<th scope="row"></th>
															<td class="text-dark">${service.name }</td>
															<td class="text-dark">${service.rate }</td>
															<c:if test="${not empty sessionUser.pets }">
															<td>
																<form action="goToReservation.do" method="GET">
																	<input type="hidden" name="hostId"
																		value="${host.id }"/> <input type="hidden"
																		name="serviceId" value="${service.id }"/> <input
																		type="submit" class="btn btn-dark btn-outline-light "
																		value="Reserve" />
																</form>
															</td>
															</c:if>
													</tr>
													</c:forEach>
												</tbody>
												</table>
												</div>
										</div>
							</div>
						</div>
					</div>
					<br>
				</c:forEach>

	<c:if test="${empty hosts }">
		<h3>No results found for that location</h3>
	</c:if>
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
<%@include file="/WEB-INF/footer.jsp"%>
</html>