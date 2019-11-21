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

<title>Update Host</title>
<%@include file="/WEB-INF/nav.jsp"%>
</head>
<body style = "background-color: #cce6f0">
	<div class="container">
		<div id="banner" class="jumbotron text-center">
			<h1>Update Host Details</h1>
		</div>
	</div>
		<form action="updateHost.do" method="GET">
		
		<label for="about">About you: </label>
		
		<br>

		<textarea id="about" name="description" rows="5" cols="33""
			value="${oldHost.description}"></textarea>
		
		<br>
		
		<c:forEach items="${allServices }" var="service">
			<input type="checkbox" name="selections" value="${service.id }" />${service.name }<br>
		</c:forEach>
	
  		<input type="hidden" name="hostId" value="${sessionHost.id}" />
  		<input type="submit" class="btn btn-dark" value="Submit">
  		</form>
	<%-- 
	<form:form action="updatePet.do" method="GET" modelAttribute="pet">
		<form:label path="name">Name: </form:label>
		<form:input path="name" required="required" default="${oldPet.name }"
			placeholder="${oldPet.name}" value="${oldPet.name}" />
		<form:errors path="name" />
		<br>
		<form:label path="breed">Breed: </form:label>
		<form:input path="breed" default="${oldPet.breed }"
			placeholder="${oldPet.breed}" value="${oldPet.breed}" />
		<form:errors path="breed" />
		<br>
		<form:label path="specialNeeds">Special Needs: </form:label>
		<form:input path="specialNeeds" default="${oldPet.specialNeeds }"
			placeholder="${oldPet.specialNeeds}" value="${oldPet.specialNeeds}" />
		<form:errors path="specialNeeds" />
		<br>
		<form:label path="description">Description:</form:label>
		<form:input path="description" type="text" required="required"
			default="${oldPet.description }" placeholder="${oldPet.description}"
			value="${oldPet.description}" />
		<form:errors path="description" />


		<br>
		<div class="container">
			<input type="hidden" name="petId" value="${oldPet.id }"> <input
				type="submit" id="updatePet" class="btn btn-outline-light"
				value="Update Pet" /> --%>
		<%-- </div>
	</form:form> --%>
	<br>
</body>
</html>