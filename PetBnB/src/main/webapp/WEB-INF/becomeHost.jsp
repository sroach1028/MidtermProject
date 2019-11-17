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

<title>Become Host</title>
<%@include file="/WEB-INF/nav.jsp"%>
</head>
<body>
	<div class="container">
		<div id="banner" class="jumbotron text-center">
			<h1>Host Details</h1>
		</div>
	</div>
	<form:form action="updateHost.do" method="GET" modelAttribute="host">
		
		<c:forEach items = "${host.services }" var = "service">
				<form:label path="services">${service.name }: </form:label>
		
		<form:checkbox path="services" value = "services" /> <br>
		</c:forEach>
		<form:errors path="services" />
		<br>
		<br>
		<form:label path="description">Description: </form:label>
		<form:input path="description" type="text" name="description"/>
		<form:errors path="description" />

		<div class="container">
		<input type="hidden" name="hostId" value=${sessionHost.id } />
			<input type="submit" id="updateHost" class="btn btn-outline-light"
				value="Update Settings" />
		</div>
	</form:form>
</body>
</html>