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
<style>
.centerBlock {
	display: table;
	margin: auto;
}
</style>
<title>Become a Host</title>
<%@include file="/WEB-INF/nav.jsp"%>
</head>
<body style="background-color: #cce6f0">


	<div class="container">
		<div class="row mx-sm-n5">
			<div class="col-sm-4 px-sm"></div>

			<div class="col-sm-4 px-sm">
				<p></p>
			</div>

			<div class="col-sm-4 px-sm"></div>
		</div>
	</div>
	<br>
	<br>
	<div class="container">
		<div class="row mx-md-n5">

			<div class="col-md-3 px-sm"></div>

			<div class="col-md-6 px-sm">
				<div class="p-3 border border-dark bg-light rounded">
					<div class="centerBlock">			
						<p>
							<strong><font size="9" face="Verdana">Become a
									Host</font></strong>
						</p>
					</div>
				</div>
			</div>

			<div class="col-md-3 px-sm"></div>
		</div>
	</div>
	<br>
	<br>
	<div class="container">
	
	<div class="row">
		<div class="col-md-4">
		
		</div>
		
		<div class="col-md-4">

			<div class="centerBlock">			
		
				<form action="createHost.do" method="GET">

		<label for="about">About you: </label>
		
		<br>

		<textarea id="about" name="description" rows="5" cols="33" placeholder="Enter text here..."></textarea>
		
		<br>
		<br>
		<p>Select the services you offer:</p>
		<c:forEach items="${allServices }" var="service">
			<input type="checkbox" name="selections" value="${service.id }" />${service.name }<br>
		</c:forEach>

		
		<br>
		
		
  		<input type="hidden" name="userId" value="${sessionUser.id}" />
  		<input type="submit" style="font-size : 22px" class="button btn btn-secondary" value="Submit">
	</form>
	
		</div>
	</div>
	<br>
	<%@include file="/WEB-INF/footer.jsp"%>

</body>
</html>