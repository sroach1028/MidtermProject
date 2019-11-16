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
	<img src="${pet.image }" />
	<div>
		<c:if test="${not empty pets }">
			<c:forEach items="${pets }" var="pet">
				<ul>
					<li>Pet Type: ${pet.petType}</li>
					<li><a href="getPet.do?petId=${pet.id}" class="btTxt submit"><strong>${pet.name }</strong></a></li>
				</ul>
			</c:forEach>
		</c:if>
		<c:if test="${not empty pet }">
			<ul>
				<li><a href="getPet.do?petId=${pet.id}" class="btTxt submit"><strong>${pet.name }</strong></a></li>
				<li>Pet Type: ${pet.petType}</li>
				<li>Pet Breed: ${pet.breed}</li>
				<li>Description: ${pet.description}</li>
				<li>Special Needs: ${pet.specialNeeds}</li>
				<li>Owner: ${pet.user.firstName }</li>
			</ul>

			<form action="goToUpdatePet.do" method="GET">
				<input type="hidden" name="petId" value="${pet.id }"> 
				<input type="submit" class="btn btn-outline-light" value="Update Pet" />
			</form>
		</c:if>
	</div>
</body>
</html>