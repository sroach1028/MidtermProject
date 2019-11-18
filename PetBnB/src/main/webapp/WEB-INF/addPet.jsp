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

<title>Add Pet</title>
<%@include file="/WEB-INF/nav.jsp"%>
</head>
<body>
	<div class="container">
		<div id="banner" class="jumbotron text-center">
			<h1>Add Pet</h1>
		</div>
	</div>
	<form:form action="addPet.do" method="POST" modelAttribute="pet">
		<form:label path="name">Name: </form:label>
		<form:input path="name" type="text" required="required" />
		<form:errors path="name" />
		<br>
		<form:label path="petType.id">Pet Type:</form:label>
		<form:select path="petType.id" required="required">
			<option value= 1>Dog</option>
			<option value= 2>Cat</option>
			<option value= 3>Bird</option>
			<option value= 4>Fish</option>
		</form:select>
		<form:errors path="petType.id" />
		<br />
		<form:label path="breed">Breed: </form:label>
		<form:input path="breed" type="text" />
		<form:errors path="breed" />
		<br>
		<form:label path="specialNeeds">Special Needs: </form:label>
		<form:input path="specialNeeds" type="text" />
		<form:errors path="specialNeeds" />
		<br>
		<form:label path="description">Description:</form:label>
		<form:input path="description" type="text" required="required" />
		<form:errors path="description" />


		<br>
		<div class="container">
			<input type="hidden" name="userId" value="${sessionUser.id }">
			<input type="submit" id="addPet" class="btn btn-outline-light"
				value="Add Pet" />
		</div>
	</form:form>
</body>
</html>