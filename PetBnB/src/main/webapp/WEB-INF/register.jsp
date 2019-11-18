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
</head>
<body>
	<form:form action="register.do" method="GET" modelAttribute="user">
		<table>
			<tr>

				<td><form:label path="firstName"></form:label></td>
				<td><form:input class="form-control" type="text"
						placeholder="First Name" id="example-text-input" path="firstName"
						required="required" /> <form:errors path="firstName" /></td>
			</tr>
			<tr>
				<td style="color: #000000"><form:label path="lastName"></form:label></td>
				<td><form:input path="lastName" class="form-control"
						type="text" placeholder="Last Name" id="example-text-input"
						required="required" /> <form:errors path="lastName" /></td>
			</tr>
			<tr>
				<td style="color: #000000"><form:label path="username"></form:label></td>
				<td><form:input path="username" class="form-control"
						type="text" placeholder="username" id="example-text-input"
						required="required" /> <form:errors path="username" /></td>
			</tr>
			<tr>
				<td style="color: #000000"><form:label path="password"></form:label></td>
				<td><form:input path="password" class="form-control"
						type="password" placeholder="password" id="example-text-input"
						required="required" /> <form:errors path="password"
						required="required" /></td>
			</tr>
			<tr>
				<td style="color: #000000"><form:label path="email"></form:label></td>
				<td><form:input path="email" class="form-control" type="text"
						placeholder="email" id="example-text-input" required="required" />
					<form:errors path="email" /></td>
			</tr>
			<tr>
				<td style="color: #000000"><form:label path="address.street"></form:label></td>
				<td><form:input path="address.street" required="required"
						class="form-control" type="text" placeholder="Street"
						id="example-text-input" /> <form:errors path="address.street" /></td>
			</tr>
			<tr>
				<td style="color: #000000"><form:label path="address.city"></form:label></td>
				<td><form:input path="address.city" required="required"
						class="form-control" type="text" placeholder="City"
						id="example-text-input" /> <form:errors path="address.city" /></td>
			</tr>
			<tr>
				<td style="color: #000000"><form:label path="address.state"></form:label></td>
				<td><form:input path="address.state" required="required"
						class="form-control" type="text" placeholder="State"
						id="example-text-input" /> <form:errors path="address.state" /></td>
			</tr>
			<tr>
				<td style="color: #000000"><form:label path="address.zip"></form:label></td>
				<td><form:input path="address.zip" required="required"
						class="form-control" type="text" placeholder="Zip Code"
						id="example-text-input" /> <form:errors path="address.zip" /></td>
			</tr>
			<tr>
				<td style="color: #000000"><form:label path="address.phone"></form:label></td>
				<td><form:input path="address.phone" required="required"
						class="form-control" type="text" placeholder="Phone Number"
						id="example-text-input" /> <form:errors path="address.phone" /></td>
			</tr>
			<c:if test="${not empty error}">
				<h3>${error }</h3>
			</c:if>
			<tr>
				<td>
					<div class="input-group-append">
						<input class="btn btn-primary" type="submit" value="Register!"/>
					</div>
				</td>
			</tr>
		</table>
	</form:form>
</body>
</html>