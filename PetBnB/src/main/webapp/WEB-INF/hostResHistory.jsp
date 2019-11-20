<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
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
<body>

	<div class="container">
		<br> <br>
		<div class="row mx-md-n5">
			<div class="col-md-6 px-md">
				<h3>
					<strong>Reservation History</strong>
				</h3>
			</div>
		</div>
		<br>

		<div class="row mx-md-n5">
			<ul>
				<li><c:forEach items="${host.reservations }" var="reservation">
						<div class="col-md-9">
							<div class="lead border bg-light">
								<c:if test="${not empty reservation.hostReview.review }">
									<h3>${reservation.openDate }to${reservation.closeDate}</h3>

									<h5>Reviewed by ${ reservation.pet.user.firstName} and
										${reservation.pet.name } the ${reservation.pet.petType.type}</h5>
									<c:if test="${reservation.hostReview.rating == 1}">
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star"></span>
										<span class="fa fa-star"></span>
										<span class="fa fa-star"></span>
										<span class="fa fa-star"></span>
									</c:if>
									<c:if test="${reservation.hostReview.rating == 2}">
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star"></span>
										<span class="fa fa-star"></span>
										<span class="fa fa-star"></span>
									</c:if>
									<c:if test="${reservation.hostReview.rating == 3}">
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star"></span>
										<span class="fa fa-star"></span>
									</c:if>
									<c:if test="${reservation.hostReview.rating == 4}">
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star"></span>
									</c:if>
									<c:if test="${reservation.hostReview.rating == 5}">
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
									</c:if>
									<p>"${reservation.hostReview.review}"</p>
								</c:if>
							</div>
							<br>
						</div>
					</c:forEach></li>
				<div class="col-md-3">
					<div class="lead border bg-light">
						<li><c:forEach items="${host.reservations }" var="reservation">
							<c:if test="${empty reservation.petReview.review }">
								<h3>${reservation.openDate }to${reservation.closeDate}</h3>
								<a
									href="goToCreatePetReview.do?reservationId=${reservation.id}&petId=${reservation.pet.id}&hostId=${reservation.host.id}">Write
									a review for ${reservation.pet.name }</a>
							</c:if>
						</c:forEach>
						</li>
					</div>
				</div>
			</ul>
		</div>
	</div>

	<c:if test="${empty host.reservations }">
		<h3>You have no past reservations. Try marketing.</h3>
	</c:if>
</body>
</html>