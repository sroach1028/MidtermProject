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
li {
	list-style-type: none;
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
		<div class="centerBlock">
		<h4>
			<strong> ${host.user.firstName}'s Reservation History </strong>
		</h4>
		</div>
				<c:forEach items="${host.reservations }" var="reservation">
					<li>
						<div class="row mx-md-n5">
							<div class="col-md-12">
								<div class="p-5 lead border border-dark bg-light rounded-pill">
				<c:if test="${not empty reservation.hostReview.review }">
									<span><h5>&nbsp;&nbsp; Reviewed by ${reservation.pet.user.firstName} ${reservation.pet.user.lastName }
									and their pet ${reservation.pet.name} </h5> &nbsp;&nbsp;
									<img
										src="${reservation.host.user.imageURL }" height="100"
										width="100"/> </span>
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
					<h5>"${reservation.hostReview.review }"</h5>
				</c:if>
						<c:if test="${empty reservation.hostReview.review }">
							<h3>Pending review by ${reservation.pet.user.firstName} and their pet ${reservation.pet.name} </h3>
					</c:if>
						<c:if test="${empty reservation.petReview.review }">
						<a href="goToCreatePetReview.do?reservationId=${reservation.id}&petId=${reservation.pet.id}&hostId=${reservation.host.id}">Write
					  a review for ${reservation.pet.name }</a>
					</c:if>		
								</div>
							</div>
						</div>
					</li>
					<br>
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
</html>
<%@include file="/WEB-INF/footer.jsp"%>