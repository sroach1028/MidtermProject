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

<link href="css/styles.css" rel="stylesheet" type="text/css">
<!-- Font Awesome Icon Library -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.checked {
	color: orange;
}

.carousel .item {
	height: 300px;
}

.item img {
	position: absolute;
	top: 0;
	left: 0;
	min-height: 300px;
}
</style>
<%@include file="nav.jsp"%><meta charset="UTF-8">
<meta charset="utf-8">
<title>Host Profile</title>
</head>
<body>
<br><br>
	<div class="container">

		<div class="row mx-md-n5">
			<div class="col-sm-3 px-md">
				<div class="p-3 border bg-light">
					<img src="${host.user.imageURL }" height="245" width="245" />

				</div>
			</div>
			<div class="col-md-6">
				<div class="lead border bg-light">
					<h2>${host.user.firstName} ${host.user.lastName}</h2>
					<p>${host.user.address.city }, ${host.user.address.state } 
						${host.user.address.zip }</p>
					<h4>Review Average (out of ${listSize } reviews):</h4>
					<c:if test="${reviewAverage == 1}">
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star"></span>
						<span class="fa fa-star"></span>
						<span class="fa fa-star"></span>
						<span class="fa fa-star"></span>
					</c:if>

					<c:if test="${reviewAverage == 2}">
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star"></span>
						<span class="fa fa-star"></span>
						<span class="fa fa-star"></span>
					</c:if>

					<c:if test="${reviewAverage == 3}">
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star"></span>
						<span class="fa fa-star"></span>
					</c:if>

					<c:if test="${reviewAverage == 4}">
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star"></span>
					</c:if>

					<c:if test="${reviewAverage == 5}">
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
					</c:if>
					<br>

				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<div class="container">
		<div class="row mx-md-n5">
			<div class="col px-md">
				<div class="lead border bg-light">
					<br>
					<h1>Home Description</h1>
					<h4>${host.description }</h4>
				</div>

		<div class="col px-md">
			<div class="p-3 border bg-light">
			<c:if test="${not empty host.services }" >
			<h2>Services</h2>
			<c:forEach items="${host.services }" var="service" >
			<h4>${service.name }: ${service.rate }</h4>
			</c:forEach>
			</c:if>
			</div>
		</div>
		</div>
	</div>

	<br>
	<br>

	<div class="container">
		<div class="row mx-md-n5">
			<div class="col px-md">
				<div id="carouselExampleFade" class="carousel slide carousel-fade"
					data-ride="carousel"
					style="width: 450px; height: 450px; margin: 0 auto">
					<div class="carousel-inner">
						<c:forEach var="hostImage" items="${host.hostImages }"
							varStatus="count">
							<c:choose>
								<c:when test="${count.index == 0 }">
									<div class="carousel-item active">
										<img src="${hostImage.url }" class="d-block w-100" alt="...">
									</div>
								</c:when>
								<c:otherwise>
									<div class="carousel-item">
										<img src="${hostImage.url }" class="d-block w-100" alt="...">
									</div>
								</c:otherwise>
							</c:choose>
						</c:forEach>

					</div>
					<a class="carousel-control-prev" href="#carouselExampleFade"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carouselExampleFade"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>

			</div>
				</div>
				</div>
				</div>
				
				
				<div>
			<c:if test="${not empty sessionHost }">
				<c:if test="${host.id == sessionHost.id}">
				
				</c:if>
				</c:if> 
				</div>
				


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
				<iframe
					src="http://maps.google.com/maps?q=${host.user.address.zip}&z=15&output=embed"
					width="600" frameborder="0" height="400" style="border: 0"></iframe>

			</div>
		</div>
	</div>

	<div>
		<c:if test="${not empty sessionHost }">
			<c:if test="${host.id == sessionHost.id}">

			</c:if>
		</c:if>
	</div>



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