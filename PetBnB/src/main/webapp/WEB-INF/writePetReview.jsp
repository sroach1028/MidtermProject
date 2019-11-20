<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css">

<title>Write Review</title>
<%@include file="/WEB-INF/nav.jsp"%>
</head>
<body>
	<div class="container">
		<div id="banner" class="jumbotron text-center">
			<h1>Write a review</h1>
		</div>
	</div>
	<form:form action="createPetReview.do" method="GET" modelAttribute="petReview">
		<form:label path="review">Review: </form:label>
		<form:input path="review" type="text" required="required" />
		<form:errors path="review" />
		<br>
		<form:label path="rating">Rating:</form:label>
		<form:select path="rating" class="rating-input" required="required">
			<option value= 0 data-value="0" class="glyphicon glyphicon-star">0</option>
			<option value= 1 data-value="1" class="glyphicon glyphicon-star">1</option>
			<option value= 2 data-value="2" class="glyphicon glyphicon-star">2</option>
			<option value= 3 data-value="3" class="glyphicon glyphicon-star">3</option>
			<option value= 4 data-value="4" class="glyphicon glyphicon-star">4</option>
			<option value= 5 data-value="5" class="glyphicon glyphicon-star">5</option>
		</form:select>
		<form:errors path="rating" />


		<br>
		<div class="container">
			<%-- <form:input type="hidden" path="pet.id" value="${petId }"/> --%>
			<%-- <form:input type="hidden" path="reservation.host.id" value="${hostId }"/> --%>
			<form:input type="hidden" path="reservation.id" value="${reservationId }"/>
			<input type="submit" class="btn btn-outline-light"
				value="Submit Review" />
		</div>
	</form:form>
</body>
</html>