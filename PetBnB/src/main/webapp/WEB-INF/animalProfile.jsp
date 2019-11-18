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
<%@include file="nav.jsp"%><meta charset="UTF-8">
<meta charset="utf-8">
<title>Animal Profile</title>
</head>
<body>
	<div>
		<c:if test="${not empty pets }">
			<c:forEach items="${pets }" var="pet">
				<ul>
					<li>Pet Type: ${pet.petType.type}</li>
					<li><a href="getPet.do?petId=${pet.id}" class="btTxt submit"><strong>${pet.name }</strong></a></li>
				</ul>
			</c:forEach>
		</c:if>
		<c:if test="${not empty pet }">

			<table class="table table-hover table-striped">
				<tbody>

					<tr class="table-primary">
						<th scope="row">${pet.name }</th>
					</tr>
					<tr>
						<th scope="row">${pet.petType.type }</th>
					</tr>
					<tr>
						<th scope="row">${pet.breed }</th>
					</tr>
					<tr>
						<th scope="row">${pet.description }</th>
					</tr>
					<tr>
						<th scope="row">${pet.specialNeeds }</th>
					</tr>

				</tbody>
			</table>
			<c:if test="${empty pet.reviewsOfPet }">
				<h3>List of Reviews</h3>
				<c:forEach items="${pet.reviewsOfPet}" var="reviews">
					<ul class="list-group">
						<li class="list-group-item">Rating: ${reviews.rating }</li>
						<li class="list-group-item">Summary: ${reviews.review }</li>
					</ul>
				</c:forEach>
			</c:if>

			<c:if test="${not empty pet.petImages }">

				<div id="carouselExampleControls" class="carousel slide"
					data-ride="carousel">
					<div class="carousel-inner" role="listbox">
						<c:forEach items="${pet.petImages}" var="petImage">
						<div class="carousel-item active">
								<img class="d-block img-fluid" src=${petImage.url } alt="First slide">
							</div>
						</c:forEach>
					</div>
					<a class="carousel-control-prev" href="#carouselExampleControls"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carouselExampleControls"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>
			</c:if>

			<form action="addPetImage.do" method="GET">
				<input type="text" name="url" placeholder="image url" /> <input
					type="hidden" name="petId" value="${pet.id }"> <input
					type="submit" class="btn btn-outline-light" value="Add Photo" />
			</form>
			<form action="goToUpdatePet.do" method="GET">
				<input type="hidden" name="petId" value="${pet.id }"> <input
					type="submit" class="btn btn-outline-light" value="Update Pet" />
			</form>
			<form action="removePet.do" method="GET">
				<input type="hidden" name="petId" value="${pet.id }"> <input
					type="submit" class="btn btn-outline-light" value="Delete Pet" />
			</form>
		</c:if>
	</div>
</body>
</html>