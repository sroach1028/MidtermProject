
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
				<h2>
					<strong> ${pet.name}'s Reservation History </strong>
				</h2>
			</div>
		</div>
		<br>

		<ul>
			<c:forEach items="${pet.reservations }" var="reservation">
				<li><c:if test="${not empty reservation.petReview.review }">
						<div class="row mx-md-n5">
							<div class="col-md-9">
								<div class="lead border bg-light">
									<c:if test="${not empty reservation.petReview.review }">
										<h3>${reservation.openDate }-${reservation.closeDate}</h3>

										<h5>Reviewed by Host ${reservation.host.user.firstName }
											${reservation.host.user.lastName }</h5>
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
										<p>"${reservation.petReview.review}"</p>
									</c:if>
								</div>
							</div>
						</div>
					</c:if></li>
			</c:forEach>
			<c:forEach items="${pet.reservations }" var="reservation">
				<c:if test="${empty reservation.petReview.review }">
					<li>
						<div class="row mx-md-n5">
							<div class="col-md-9">
								<div class="lead border bg-light">
									<h3>${reservation.openDate }-${reservation.closeDate}</h3>

									<h5>
										<a
											href="goToCreateHostReview.do?reservationId=${reservation.id}&petId=${reservation.pet.id}&hostId=${reservation.host.id}">Write
											a review for ${reservation.host.user.firstName }
											${reservation.host.user.lastName }</a>
									</h5>
								</div>
							</div>
						</div>
					</li>
				</c:if>
			</c:forEach>
		</ul>
	</div>
</body>
</html>