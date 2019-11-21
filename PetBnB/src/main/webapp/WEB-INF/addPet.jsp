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
<link
	href="https://fonts.googleapis.com/css?family=Fredoka+One|Roboto:300,400"
	rel="stylesheet">

<title>Add a Pet</title>
<%@include file="/WEB-INF/nav.jsp"%>
</head>
<body>
	<div class="row">
		<div class="col-2 col-left"></div>

		<div class="jumbotron col-9 col-center">
			<form:form action="addPet.do" method="GET" modelAttribute="pet">
				<table class="col-9 col-centered table table-hover table-secondary">
					<tr>
						<th class="display-4">Add Your Pet !</th>
					</tr>
					<tr>
						<form:label path="name"></form:label>
						<td><form:input path="name" required="required"
								class="form-control" type="text" placeholder="Name"
								id="example-text-input" /> <form:errors path="name" />
					</tr>
					<tr>
						<form:label path="petType.id"></form:label>
						<td><select class="custom-select" name="petType.id"
							style="width: 150px;">
								<option value=1>Dog</option>
								<option value=2>Cat</option>
								<option value=3>Bird</option>
								<option value=4>Fish</option>
						</select> <form:errors path="petType.id" /></td>
					</tr>
					<tr>
						<form:label path="breed"></form:label>
						<td><form:input path="breed" class="form-control" type="text"
								placeholder="Breed" id="example-text-input" required="required" />
							<form:errors path="breed" /></td>
					</tr>
					<tr>
						<form:label path="description"></form:label>
						<td><form:input path="description" required="required"
								class="form-control" type="text"
								placeholder="Description of Pet" id="example-text-input" /> <form:errors
								path="description" /></td>
					</tr>
					<tr>
						<form:label path="specialNeeds"></form:label>
						<td><form:input path="specialNeeds" required="required"
								class="form-control" type="text" placeholder="Any Special Needs"
								id="example-text-input" /> <form:errors path="specialNeeds" /></td>
					</tr>
					<tr>
						<td>
							<div align="center" class="input-group-append">
								<input class="btn btn-secondary" type="submit"
									value="Register Pet to Account !" />
							</div>
						</td>
					</tr>
				</table>
			</form:form>
		</div>
		<div class="col-2 col-right"></div>
	</div>

</body>
</html>