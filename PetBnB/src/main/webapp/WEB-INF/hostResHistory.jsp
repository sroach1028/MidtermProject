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
<%@include file="nav.jsp"%><meta charset="UTF-8">
<meta charset="utf-8">
<title>Reservation History</title>
</head>
<body>

	<div>
		<c:if test="${not empty host }">
			<c:forEach items="${host.reservations }" var="reservation">
				<ol>
					<li><h3>${reservation.openDate }-
							${reservation.closeDate}</h3>
						<br> <c:if test="${reservation.hostReview.rating == 1}">
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star"></span>
							<span class="fa fa-star"></span>
							<span class="fa fa-star"></span>
							<span class="fa fa-star"></span>
						</c:if> <c:if test="${reservation.hostReview.rating == 2}">
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star"></span>
							<span class="fa fa-star"></span>
							<span class="fa fa-star"></span>
						</c:if> <c:if test="${reservation.hostReview.rating == 3}">
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star"></span>
							<span class="fa fa-star"></span>
						</c:if> <c:if test="${reservation.hostReview.rating == 4}">
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star"></span>
						</c:if> <c:if test="${reservation.hostReview.rating == 5}">
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
						</c:if></li>
				</ol>
			</c:forEach>
		</c:if>
	</div>
	<c:if test="${empty host.reservations }">
	<h3>You have no past reservations. Try marketing.</h3>
	</c:if>
</body>
</html>