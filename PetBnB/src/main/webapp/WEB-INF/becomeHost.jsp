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

<title>Become a Host</title>
<%@include file="/WEB-INF/nav.jsp"%>
</head>
<body>
	<div class="container">
		<div id="banner" class="jumbotron text-center">
			<h1>Host Details</h1>
		</div>
	</div>

	<form action="updateHost.do" method="GET">

		<label for="about">About you: </label>
		
		<br>

		<textarea id="about" name="description" rows="5" cols="33" placeholder="Enter text here..."></textarea>
		
		<br>
		
		<c:forEach items="${allServices }" var="service">
			<input type="checkbox" name="selections" value="${service.id }" />${service.name }<br>
		</c:forEach>

		
		<br>
		<br>
		 Add an image:<br>
  		<input type="text" name="imageURL" placeholder="Enter image URL"><br>
  		
  		<input type="hidden" name="hostId" value="${sessionHost.id}" /> <input
			type="submit" value="Update Settings">
	</form>
	<br>
</body>
</html>