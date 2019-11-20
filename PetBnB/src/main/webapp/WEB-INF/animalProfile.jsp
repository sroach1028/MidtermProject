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
<title>Animal Profile</title>
</head>
<body>

	<c:if test="${not empty pets }">
		<c:forEach items="${pets }" var="pet">
			<ul>
				<li>Pet Type: ${pet.petType.type}</li>
				<li><a href="getPet.do?petId=${pet.id}" class="btTxt submit"><strong>${pet.name }</strong></a></li>
			</ul>
		</c:forEach>
	</c:if>

	<c:if test="${not empty pet }">
		<div class="container">
			<div class="row mx-md-n5">
				<div class="col-lg-3 px-md"></div>
				<div class="col-lg-6 px-md">
					<div class="p-5 border bg-light">
						<h3>
							<font face="Lucida Bright">${pet.name }</font>
						</h3>

						<h5>
							<strong>Pet type: </strong>${pet.petType.type }</h5>


						<p class="lead">
							<font face="verdana">${pet.description }</font>
						</p>
						<br>
						<hr class="my-4">
						<p>Special Needs: ${pet.specialNeeds }</p>
					</div>
					<div class="col-lg-3 px-md"></div>
				</div>
			</div>

			<br>
			<p class="lead">
				<a class="btn btn-dark" href="goToUpdatePet.do?petId=${pet.id}"
					role="button">Update Pet</a> <a class="btn btn-dark"
					href="removePet.do?petId=${pet.id}" role="button">Remove Pet</a>
			</p>
		</div>


		<c:if test="${not empty pet.reviewsOfPet }">
			<h3>List of Reviews</h3>
			<c:forEach items="${pet.reviewsOfPet}" var="reviews">
				<ul class="list-group">
					<li class="list-group-item">Rating: ${reviews.rating }</li>
					<li class="list-group-item">Summary: ${reviews.review }</li>
				</ul>
			</c:forEach>
		</c:if>



		<c:if test="${not empty pet.petImages }">

			<div id="carouselExampleFade" class="carousel slide carousel-fade"
				data-ride="carousel"
				style="width: 450px; height: 450px; margin: 0 auto">
				<div class="carousel-inner">
					<c:forEach var="petImage" items="${pet.petImages }"
						varStatus="count">
						<c:choose>
							<c:when test="${count.index == 0 }">
								<div class="carousel-item active">
									<img src="${petImage.url }" class="d-block w-100" alt="...">
								</div>
							</c:when>
							<c:otherwise>
								<div class="carousel-item">
									<img src="${petImage.url }" class="d-block w-100" alt="...">
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

<%-- <div class="container">
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
		</div> --%>

			</div>
			
			<form action="addPetImage.do" method="GET">
				<input type="text" name="url" placeholder="image url" /> <input
					type="hidden" name="petId" value="${pet.id }"> <input
					type="submit" class="btn btn-outline-light" value="Add Photo" />
			</form>
		</c:if>
		</c:if>
</body>
</html>