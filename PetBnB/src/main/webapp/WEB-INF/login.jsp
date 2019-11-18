<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<%@include file="/WEB-INF/nav.jsp"%>
</head>
<body>
	<form:form action="login.do" method="GET" modelAttribute="user">
	<div class="form-group">
	<table>
	<tr>
		<td><form:label path="username"></form:label></td>
		<td><form:input path="username" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"
      placeholder="Enter username"/>
		<form:errors path="username" /></td>
		</tr>
		<tr>
		<td><form:label path="password"></form:label></td>
		<td><form:input path="password" type="password" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter password"/>
		<form:errors path="password" /></td>
		</tr>
		<c:if test="${not empty error}">
			<h3>${error }</h3>
		</c:if>
		<tr><td><input type="submit" class="btn btn-primary" value="Login" /></td></tr>
		</table>
	</div>
	</form:form>
</body>
</html>

