<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Home Page</title>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">

<link rel="stylesheet" href="css/styles2.css">


<link
	href="https://fonts.googleapis.com/css?family=Fredoka+One|Roboto:300,400"
	rel="stylesheet">

<%@include file="nav.jsp"%>
</head>
<body>

	<div
		class="jumbotron jumbotron-fullheight jumbo-vertical-center text-light text-center bg-dark mb-0 radius-0">
		<div class="container">

			<h1 class="display-2 text-light text-uppercase">Boop</h1>
			<span class="lead lead-lg">Where you can find accomodations
				and services for your pet!</span>

			<div class="mt-4">
				<form action="searchHost.do">
					<input type="text" name="city" />City<br> <select name="state">State
						<option value="null" selected>--</option>
						<option value="CO">CO</option>
						<option value="WY">WY</option>
						<option value="NM">NM</option>
						<option value="KS">KS</option>
					</select><br> <input type="submit"
						class="btn btn-danger btn-lg m-2 btn-wide"
						value="Search by location" />
				</form>

				<a href="#!"
					class="btn btn-outline-light btn-hover-text-dark btn-wide btn-lg m-2">
					<span>Another button</span>
				</a>
			</div>
		</div>
	</div>


	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->

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

</body>
</html>