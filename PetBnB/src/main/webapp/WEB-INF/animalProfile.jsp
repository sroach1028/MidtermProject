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
<title>Animal Profile</title>
<%@include file="nav.jsp"%><meta charset="UTF-8">
<meta charset="utf-8">
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

.centerBlock {
  display: table;
  margin: auto;
  </style>
</head>
<body style = "background-color: #cce6f0">
<br>
	<div class="container">

		<div class="row mx-sm-n5">
			<div class="col-sm-4 px-sm">
			</div>
			<div class="col-sm-4 px-sm">
			<p></p>
			</div>
			<div class="col-sm-4 px-sm">
			</div>
		</div>
		
		<div class="row mx-sm-n5">
			<div class="col-sm-4 px-sm">
			</div>
			<div class="col-sm-4 px-sm">
			<p></p>
			</div>
			<div class="col-sm-4 px-sm">
			</div>
		</div>
		
	</div>
		<div class="container">
			<div class="row mx-md-n5">
				
				<div class="col-lg-3 px-md">
				</div>
				
					<div class="col-lg-6 px-md">
						<div class="p-3 border border-dark bg-light">
							<div class="centerBlock">			
								<p>
									<strong><font size="10" face ="Verdana" >Pet Profile</font></strong>
								</p>
							</div>
						</div>	
					</div>
				
				<div class="col-lg-3 px-md"></div>
					<div class="row mx-lg-n5">
						<div class="col-md-5 px-md">
								<div class="centerBlock">
								
									<c:if test="${not empty pet.petImages }">
	
								<div class="container">
									<div class="row mx-md-n5">
										<div class="col px-md">
											<div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel" style="width: 450px; height: 450px; margin: 0 auto">
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
											</div>
											</div>		
										</div>
									</div>
								</c:if>
							</div>
						</div>
					</div>

							<div class="col-lg-7 px-md">
								<div class="p-3 border border-dark bg-light">
									<div class="centerBlock">
										<p><font size="5" face ="Verdana" ><strong>Pet type: </strong>${pet.petType.type }</font></p>
				
										<p class="lead"> <font size ="5" face="verdana">${pet.description }</font></p>
										<br>
										<p><font size="4" face ="Verdana" ><strong>Special Needs:  </strong>${pet.specialNeeds }</font></p>
									</div>
								</div>
							</div>		
				</div>
		</div>	
		
			<c:if test="${sessionUser.id == pet.user.id }">
			<br>
			<p class="lead">
				<a class="btn btn-dark" href="goToUpdatePet.do?petId=${pet.id}"
					role="button">Update Pet</a> <a class="btn btn-dark"
					href="removePet.do?petId=${pet.id}" role="button">Remove Pet</a>
			</p>
			</c:if>
		</div>

		<c:if test="${empty pet.reviewsOfPet }">
			<p><font size ="5" face="verdana" style="text-align:center;">No reviews yet for this pet.</font>
		</c:if>

		<c:if test="${not empty pet.reviewsOfPet }">
			<h3>List of Reviews</h3>
			<c:forEach items="${pet.reviewsOfPet}" var="reviews">
				<ul class="list-group">
					<li class="list-group-item">Rating: ${reviews.rating }</li>
					<li class="list-group-item">Summary: ${reviews.review }</li>
				</ul>
			</c:forEach>
		</c:if>


			<c:if test="${sessionUser.id == pet.user.id}">
		
				<form action="addPetImage.do" method="GET">
					<input type="text" name="url" placeholder="image url" /> <input
						type="hidden" name="petId" value="${pet.id }"> <input
						type="submit" class="btn btn-dark" value="Add Photo" />
				</form>
			</c:if>
			
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