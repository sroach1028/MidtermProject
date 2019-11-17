<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/style.css">
<title>Search Results</title>
<%@include file="/WEB-INF/nav.jsp"%>
</head>

<body>

	<div class="container">

		<div class="resultsSingle" style="margin-top: 15px">
			<h1>
				<strong>${nothing }</strong>
			</h1>
		</div>

		<c:if test="${not empty hosts }">
			<div class="resultsSingle" style="margin-top: 15px">
				<div class="col-sm">
				<ol>
				<c:forEach items = "${hosts}" var = "host">
				<li>
					<h3>${host.user.firstName } </h3>
					<h6> ${host.user.address.city }, ${host.user.address.state }</h6>
					<ul> Services
					<c:forEach items = "${host.services }" var = "service">
					<li> ${service.name } --> ${service.rate }</li>
					</c:forEach>
					</ul>
					<ul> Reviews
					<c:forEach items = "${host.reviewsOfHost }" var = "review">
					<li> ${review.rating }/5
							${review.review}</li>
					</c:forEach>
					</ul>
					
				</li>
				</ol>
				</c:forEach>
				<c:if test="${empty hosts }">
				<h3>No results found for that location</h3>
				</c:if>

</div>
</div>
</c:if>
</body>
</html>