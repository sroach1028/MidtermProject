<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/style.css">
<title>User Profile</title>
<%@include file="/WEB-INF/nav.jsp"%>
</head>
<body>
	<div class="resultsSingle">
		<table class="table">
			<th>Select for pet the service</th>
			<c:forEach items="${sessionUser.pets }" var="pet">
				<c:if test="${pet.active == true}">
					<tr>
						<td><a href="createReservation.do?petId=${pet.id}&hostId=${hostId}&serviceId=${serviceId}" class="btTxt submit">${pet.name }</a></td>
					</tr>
				</c:if>
			</c:forEach>
		</table>
	</div>
</body>
</html>