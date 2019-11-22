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

			<div class="container" style="width: 100%; height: 100%;">
				<div class="row styling">
					<div class='col-sm-offset-6 col-sm-6' align="left">
						<div class="form-group">
							<div class='input-group date' id="dp1">
								<h1 class="display-4 text-center">Select Date for drop off</h1>
								<input type='date' name="openDate" class="form-control input-lg" required="required"/>
								<span class="input-group-addon"><span
									class="glyphicon glyphicon-calendar"></span></span>
							</div>
						</div>
					</div>

					<div class='col-sm-offset-6 col-sm-6' align="right">
						<div class="form-group">
							<div class='input-group date' id="dp1">
								<h1 class="display-4 text-center"">Select Date for pick up</h1>
								<input type='date' name="closeDate"
									class="form-control input-lg" required="required"/> <span
									class="input-group-addon"><span
									class="glyphicon glyphicon-calendar"></span></span>
							</div>
						</div>
					</div>
				</div>
				<br>

			</div>
			<div style="width: 100%; height: 100%;" align="center">
					<strong class="display-5 text-center">Reservation for</strong>
					<br>
				<select class="custom-select" align="center" name="petId"
					style="width: 150px;">
					<c:forEach items="${sessionUser.pets }" var="pet">
					<c:if test="${pet.active == true }" >
						<option value=${pet.id }>${pet.name}</option>
						</c:if>
					</c:forEach>
				</select> <br> <br> <input type="hidden" name="hostId"
					value=${hostId } /> <input type="hidden" name="serviceId"
					value=${serviceId } /> <input align="center" type="submit"
					class="btn btn-danger btn-lg m-2 btn-wide"
					value="Complete Reservation" />
			</div>

		</form>
	</div>
	<%@include file="/WEB-INF/footer.jsp"%>
	
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