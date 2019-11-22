<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register</title>
<%@include file="/WEB-INF/nav.jsp"%>
<style type="text/css">
body {
	opacity: 1;
	background-repeat: no-repeat;
	background-size: contain;
	background-position: 100% 32%;
} 
</style>
</head>
<br>
<br>
<br>
<body style="background-image: url('http://www.radiopetlady.com/wp-content/uploads/bfi_thumb/RPLN-Multi-Dog-and-cats-2-1920x731-6s69on2zlvwrb6dw71qibv1vbb06omlwrh8zuzntxgs.jpg');">
	<div class="row">
		<div class="col-2 col-left"></div>

		<div class="jumbotron col-8 col-center">
			<form:form action="register.do" method="GET" modelAttribute="user">
				<table class="col-8 col-centered table table-hover table-secondary">
				<tr>
					<th><h2>Create an Account</h2></th>
					</tr>
					<tr>

						<form:label path="firstName"></form:label>
						<td><form:input class="form-control" type="text"
								placeholder="First Name" id="example-text-input"
								path="firstName" required="required" /> <form:errors
								path="firstName" /></td>
					</tr>
					<tr>
						<form:label path="lastName"></form:label>
						<td><form:input path="lastName" class="form-control"
								type="text" placeholder="Last Name" id="example-text-input"
								required="required" /> <form:errors path="lastName" /></td>
					</tr>
					<tr>
						<form:label path="username"></form:label>
						<td><form:input path="username" class="form-control"
								type="text" placeholder="username" id="example-text-input"
								required="required" /> <form:errors path="username" /></td>
					</tr>
					<tr>
						<form:label path="password"></form:label>
						<td><form:input path="password" class="form-control"
								type="password" placeholder="password" id="example-text-input"
								required="required" /> <form:errors path="password"
								required="required" /></td>
					</tr>
					<tr>
						<form:label path="email"></form:label>
						<td><form:input path="email" class="form-control" type="text"
								placeholder="email" id="example-text-input" required="required" />
							<form:errors path="email" /></td>
					</tr>
					<tr>
						<form:label path="address.street"></form:label>
						<td><form:input path="address.street" required="required"
								class="form-control" type="text" placeholder="Street"
								id="example-text-input" /> <form:errors path="address.street" /></td>
					</tr>
					<tr>
						<form:label path="address.city"></form:label>
						<td><form:input path="address.city" required="required"
								class="form-control" type="text" placeholder="City"
								id="example-text-input" /> <form:errors path="address.city" /></td>
					</tr>
					<tr>
						<form:label path="address.state"></form:label>
						<td><select class="custom-select" name="address.state"
							style="width: 150px;">
								<option value="AL">AL</option>
								<option value="AK">AK</option>
								<option value="AZ">AZ</option>
								<option value="AR">AR</option>
								<option value="CA">CA</option>
								<option value="CO">CO</option>
								<option value="CT">CT</option>
								<option value="DE">DE</option>
								<option value="DC">DC</option>
								<option value="FL">FL</option>
								<option value="GA">GA</option>
								<option value="HI">HI</option>
								<option value="ID">ID</option>
								<option value="IL">IL</option>
								<option value="IN">IN</option>
								<option value="IA">IA</option>
								<option value="KS">KS</option>
								<option value="KY">KY</option>
								<option value="LA">LA</option>
								<option value="ME">ME</option>
								<option value="MD">MD</option>
								<option value="MA">MA</option>
								<option value="MI">MI</option>
								<option value="MN">MN</option>
								<option value="MS">MS</option>
								<option value="MO">MO</option>
								<option value="MT">MT</option>
								<option value="NE">NE</option>
								<option value="NV">NV</option>
								<option value="NH">NH</option>
								<option value="NJ">NJ</option>
								<option value="NM">NM</option>
								<option value="NY">NY</option>
								<option value="NC">NC</option>
								<option value="ND">ND</option>
								<option value="OH">OH</option>
								<option value="OK">OK</option>
								<option value="OR">OR</option>
								<option value="PA">PA</option>
								<option value="RI">RI</option>
								<option value="SC">SC</option>
								<option value="SD">SD</option>
								<option value="TN">TN</option>
								<option value="TX">TX</option>
								<option value="UT">UT</option>
								<option value="VT">VT</option>
								<option value="VA">VA</option>
								<option value="WA">WA</option>
								<option value="WV">WV</option>
								<option value="WI">WI</option>
								<option value="WY">WY</option>
						</select> <form:errors path="address.state" /></td>
					</tr>
					<tr>
						<form:label path="address.zip"></form:label>
						<td><form:input path="address.zip" required="required"
								class="form-control" type="text" placeholder="Zip Code"
								id="example-text-input" /> <form:errors path="address.zip" /></td>
					</tr>
					<tr>
						<form:label path="address.phone"></form:label>
						<td><form:input path="address.phone" required="required"
								class="form-control" type="text" placeholder="Phone Number"
								id="example-text-input" /> <form:errors path="address.phone" /></td>
					</tr>

					<tr>
						<form:label path="imageURL"></form:label>
						<td><form:input path="imageURL" required="required"
								class="form-control" type="text" placeholder="Image URL"
								id="example-text-input" /> <form:errors path="imageURL" /></td>
					</tr>
					<c:if test="${not empty error}">
						<h3>${error }</h3>
					</c:if>
					<tr>
						<td>
							<div align="center" class="input-group-append">
								<input class="btn btn-secondary" type="submit" value="Register" />
							</div>
						</td>
					</tr>
				</table>
			</form:form>
		</div>
		<div class="col-2 col-right"></div>
	</div>
	<%@include file="/WEB-INF/footer.jsp"%>
	
</body>
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