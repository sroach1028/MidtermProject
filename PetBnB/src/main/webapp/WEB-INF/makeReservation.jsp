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
		<form action="createReservation.do">
			<table class="table">
				<tr>
					<th>Select dates for service</th>
					<td>Start Date: <input type="date" name="openDate" /></td>
					<td>End Date: <input type="date" name="closeDate" /></td>
				</tr>
			</table>
			<select class="custom-select" name="petId" style="width: 150px;">
						<option selected="">Select a Pet</option>
			<c:forEach items="${sessionUser.pets }" var="pet">
						<option value=${pet.id }>${pet.name}</option>
			</c:forEach>
			</select>

			<br>
			<br> <input type="hidden" name="hostId" value=${hostId } /> <input
				type="hidden" name="serviceId" value=${serviceId } /> <input
				type="submit" class="btn btn-danger btn-lg m-2 btn-wide"
				value="Complete Reservation" />

		</form>
	</div>
</body>
</html>