
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="javax.servlet.*,java.text.*"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.centerBlock {
	display: table;
	margin: auto;
}

li {
	list-style-type: none;
}

img {
	border-radius: 80%;
}

h3 {
	text-align: right;
}

p {
	text-indent: 100px;
}

body {
	opacity: 1;
	background-repeat: no-repeat;
	background-size: contain;
	background-position: 100% 32%;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<link href="css/styles2.css" rel="stylesheet" type="text/css">

<title>Reservation History</title>
<%@include file="nav.jsp"%><meta charset="UTF-8">
<meta charset="utf-8">
</head>

<body
	style="background-image: url('http://www.radiopetlady.com/wp-content/uploads/bfi_thumb/RPLN-Multi-Dog-and-cats-2-1920x731-6s69on2zlvwrb6dw71qibv1vbb06omlwrh8zuzntxgs.jpg');">

	<div class="container text-dark ">
		<br> <br>
		<div class="row mx-md-n5">
			<div class="col-md-12 px-md">
				<div class="centerBlock">
					<br>
						<c:forEach items="${sessionUser.pets}" var="pet">
					<div class="centerBlock">
							<h4>
								<strong> ${pet.name}'s Reservation History </strong>
							</h4>
					</div>
					<c:forEach items="${pet.reservations }" var="reservation">
						<li>
							<div class="row mx-md-n5">
								<div class="col-md-12">
									<div class="p-5 lead border border-dark bg-light rounded-pill">
										<c:if test="${not empty reservation.petReview.review }">
											<span><h5>&nbsp;&nbsp; Reviewed by Host
													${reservation.host.user.firstName }
													${reservation.host.user.lastName }</h5> &nbsp;&nbsp;<img
												src="${reservation.host.user.imageURL }" height="100"
												width="100" /> </span>
											<c:if test="${reservation.petReview.rating == 1}">
												<span class="fa fa-star checked"></span>
												<span class="fa fa-star"></span>
												<span class="fa fa-star"></span>
												<span class="fa fa-star"></span>
												<span class="fa fa-star"></span>
											</c:if>
											<c:if test="${reservation.petReview.rating == 2}">
												<span class="fa fa-star checked"></span>
												<span class="fa fa-star checked"></span>
												<span class="fa fa-star"></span>
												<span class="fa fa-star"></span>
												<span class="fa fa-star"></span>
											</c:if>
											<c:if test="${reservation.petReview.rating == 3}">
												<span class="fa fa-star checked"></span>
												<span class="fa fa-star checked"></span>
												<span class="fa fa-star checked"></span>
												<span class="fa fa-star"></span>
												<span class="fa fa-star"></span>
											</c:if>
											<c:if test="${reservation.petReview.rating == 4}">
												<span class="fa fa-star checked"></span>
												<span class="fa fa-star checked"></span>
												<span class="fa fa-star checked"></span>
												<span class="fa fa-star checked"></span>
												<span class="fa fa-star"></span>
											</c:if>
											<c:if test="${reservation.petReview.rating == 5}">
												<span class="fa fa-star checked"></span>
												<span class="fa fa-star checked"></span>
												<span class="fa fa-star checked"></span>
												<span class="fa fa-star checked"></span>
												<span class="fa fa-star checked"></span>
											</c:if>
										</c:if>
										<c:if test="${empty reservation.petReview.review}">
										<c:if test="${empty reservation.hostReview.review }">
											<h3>${reservation.pet.name } has an appointment with
												${reservation.host.user.firstName} on ${reservation.openDate }</h3>
										</c:if>
										</c:if>
										<c:if test="${empty reservation.petReview.review}">
										<c:if test="${not empty reservation.hostReview.review }">
											<h3> ${reservation.host.user.firstName} has not yet written a review for ${reservation.pet.name } for the hosting on ${reservation.openDate }</h3>
										</c:if>
										</c:if>
										<c:if test="${empty reservation.hostReview.review }">
											
											<a
												href="goToCreateHostReview.do?reservationId=${reservation.id}&petId=${reservation.pet.id}&hostId=${reservation.host.id}">Write
												a review for ${reservation.host.user.firstName }
												${reservation.host.user.lastName }</a>

										</c:if>
									</div>
								</div>
							</div>
						</li>
						<br>
					</c:forEach>
					</c:forEach>
				</div>
			</div>

			<br>

		</div>

		<ul>
			<br>

		</ul>
	</div>


</body>
<%@include file="/WEB-INF/footer.jsp"%>
</html>