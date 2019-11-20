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

<title>View Reservation</title>
<%@include file="/WEB-INF/nav.jsp"%>
</head>
<body>
	<div class="jumbotron">
		<h1 class="display-3 text-center">Boop!</h1>
		<p class="lead text-center">Your reservation with
			${reservation.host.user.firstName} ${reservation.host.user.lastName }
			has been confirmed for ${reservation.openDate}</p>
		<hr class="my-4 text-center">
		<p class="lead text-center">Confirmation #000${reservation.id}</p>
		<p class="lead text-center">
			<a class="btn btn-danger" href="/" role="button">Return to Home
				Page </a>
		</p>
		<div class="text-center">
			<iframe
				src="http://maps.google.com/maps?q=${reservation.host.user.address}&z=15&output=embed"
				width="600" height="400" frameborder="0" style="border: 0"></iframe>
		</div>
	</div>
</body>
</html>