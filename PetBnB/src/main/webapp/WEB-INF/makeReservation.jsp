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
<script type="text/javascript" src="datepicker/bootstrap-datepicker.js"></script>
<title>User Profile</title>
<%@include file="/WEB-INF/nav.jsp"%>
</head>
<body>
	<div class="resultsSingle">
		<form action="createReservation.do">

			<div class="well span12 main">
				<input type="date" id="dp1" class="span2 datepicker"
					placeholder="Drop off date..." name="aDate"> <br>
			</div>
			
			<div class="well span12 main">
				<input type="date" id="dp1" class="span2 datepicker"
					placeholder="Pick up date..." name="bDate"> <br>
			</div> 

			<table class="table">
				<tr>
					<th>Select dates for service</th>
					<td>Start Date: <input class="span2 datepicker" type="date" name="openDate" /></td>
					<td>End Date: <input class="span2 datepicker" type="date" name="closeDate" /></td>
				</tr>
			</table> 
			
			<select class="custom-select" name="petId" style="width: 150px;">
				<option selected="">Select a Pet</option>
				<c:forEach items="${sessionUser.pets }" var="pet">
					<option value=${pet.id }>${pet.name}</option>
				</c:forEach>
			</select> <br> <br> <input type="hidden" name="hostId"
				value=${hostId } /> <input type="hidden" name="serviceId"
				value=${serviceId } /> <input type="submit"
				class="btn btn-danger btn-lg m-2 btn-wide"
				value="Complete Reservation" />

		</form>
	</div>
</body>
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript" src="_js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="_js/bootstrap.js"></script>
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
</html>