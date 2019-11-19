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
	<div class="container">
		<div id="banner" class="jumbotron text-center">
			<h1>Reservation Details</h1>
		</div>
	</div>
		<ul>
			<li><strong>ID: ${reservation.id } </strong></li>
			<li>Pet Id: ${reservation.pet.id}</li>
			<li>Host Id: ${reservation.host.id}</li>
			<li>Open Date: ${reservation.openDate}</li>
			<li>Close Date: ${reservation.closeDate}</li>
		</ul>
		
		<iframe src="http://maps.google.com/maps?q=${reservation.host.user.address}&z=15&output=embed" width="600" height="400"
				frameborder="0" style="border:0"></iframe>
</body>
</html>