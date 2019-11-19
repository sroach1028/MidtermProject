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
			<c:forEach items="${sessionUser.pets }" var="pet">
				<c:if test="${pet.active == true}">
					<form action="createReservation.do">
						<th>Select for pet the service</th>
					<tr>
						<td>Open Date: <input type="text" name="openDate" /></td>
						<td>Close Date: <input type="text" name="closeDate" /></td>
					</tr>
					<input type="hidden" name="petId" value=${pet.id } />
					<input type="hidden" name="hostId" value=${hostId } />
					<input type="hidden" name="serviceId" value=${serviceId } />
					<input type="submit" class="btn btn-danger btn-lg m-2 btn-wide"
						value="Reserve for ${pet.name }" />
					</form>
				</c:if>
			</c:forEach>
		</table>
	</div>
</body>
</html>