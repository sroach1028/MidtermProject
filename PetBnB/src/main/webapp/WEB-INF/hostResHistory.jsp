<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.centerBlock {
  display: table;
  margin: auto;
}
img {
  border-radius: 80%;
}
div{
border: 20px;
}
h2{
text-align: right;
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
<body>

	<div class="container text-dark">
		<div class="row mx-md-n5">
			<div class="col-md-6 px-md">
				<h1>
					<strong>Reservation History</strong>
				</h1>
			</div>
		</div>
		<br>

		<table>
		<thead><h3>Reservations</h3></thead>
		<tbody></tbody>
				<c:forEach items="${host.reservations }" var="reservation">
			<tr>
					<div class="col-md-9">
						<div class="lead border border-dark bg-light rounded">
							<c:if test="${not empty reservation.hostReview.review }">
								<h2>${reservation.openDate } to ${reservation.closeDate}</h2>

	<span><h5> &nbsp;&nbsp;&nbsp; Reviewed by ${ reservation.pet.user.firstName} and
	${reservation.pet.name } the ${reservation.pet.petType.type}</h5> &nbsp;&nbsp;&nbsp; <img src="${reservation.pet.user.imageURL }" width="100" height="100"/></span>
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
							<div class="centerBlock">
								<p>"${reservation.hostReview.review}"</p>
						</div>
						</div>
							</c:if>
						<br>
					</div>
			</tr><br>
				</c:forEach>
		</table>
		<table>
			<div class="col-md-3">
				<div class="lead border bg-light">
					<tr>
						<c:forEach items="${host.reservations }" var="reservation">
							<c:if test="${empty reservation.petReview.review }">
								<br>
								<div class="container">
  <a class="btn btn-danger btn-block" href="goToCreatePetReview.do?reservationId=${reservation.id}&petId=${reservation.pet.id}&hostId=${reservation.host.id}"> <h3>${reservation.openDate } to ${reservation.closeDate}</h3> Write a review for ${reservation.pet.name }</a>
</div>
								
								<%-- <a href="goToCreatePetReview.do?reservationId=${reservation.id}&petId=${reservation.pet.id}&hostId=${reservation.host.id}">Write a review for ${reservation.pet.name }</a> --%>
							</c:if>
						</c:forEach>
					</tr>
				</div>
			</div>
			</tr>
		</table>
		<c:if test="${empty host.reservations }">
			<h3>You have no past reservations. Try marketing.</h3>
		</c:if>
</body>
</html>