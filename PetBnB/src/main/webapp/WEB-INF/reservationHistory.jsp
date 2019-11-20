
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page import = "javax.servlet.*,java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.centerBlock {
  display: table;
  margin: auto;
  
}
h3{
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
<body class ="text-dark bg-white">
	<div class="container">
		<br> <br>
		<div class="row mx-md-n5">
			<div class="col-md-6 px-md">
				<div class="centerBlock">
					<br><h4><strong> ${pet.name}'s Reservation History </strong></h4>
				</div>
			</div>
		</div>
		<br>

		<ul>
			<c:forEach items="${pet.reservations }" var="reservation">
				<c:if test="${not empty reservation.petReview.review }">
						<li>
						<div class="row mx-md-n5">
							<div class="col-md-9">
								<div class="p-5 lead border border-warning bg-light rounded-pill">
									
									<c:if test="${not empty reservation.petReview.review }">
									<div class="centerBlock">
										<h3>${reservation.openDate } thru ${reservation.closeDate}</h3>
									</div>
										<span><h5>Reviewed by Host ${reservation.host.user.firstName }
											${reservation.host.user.lastName }</h5> 
											<img src="${reservation.host.user.imageURL }" height="100" width="100"/>
											</span>
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
										<div class="centerBlock">
										<p>"${reservation.petReview.review}"</p>
										</div>
									</c:if>
								</div>
							</div>
						</div>
						</li><br>
						</c:if>
			</c:forEach>
			
							
					<h4><strong> Pending Reservations </strong></h4>
				<br>
			
			<c:forEach items="${pet.reservations }" var="reservation">
				<c:if test="${empty reservation.petReview.review }">
					<li>
						<div class="row mx-md-n5">
							<div class="col-md-9">
								<div class="p-5 lead border border-warning bg-light rounded-pill">
																	<div class="centerBlock">
								
									<h3>${reservation.openDate }-${reservation.closeDate}</h3>
										</div>
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