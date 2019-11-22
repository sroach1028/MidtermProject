<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.centerBlock {
  display: table;
  margin: auto;
}
li {
	list-style-type: none;
}
img {
  border-radius: 80%;
}
div{
border: 20px;
}
h2{
text-align: right;
}
body {
	opacity: 1;
	background-repeat: no-repeat;
	background-size: contain;
	background-position: 100% 32%;
}  
</style>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<link href="css/styles2.css" rel="stylesheet" type="text/css">
<title>Review Confirmation</title>
<%@include file="nav.jsp"%><meta charset="UTF-8">
<meta charset="utf-8">
</head>
<body
	style="background-image: url('http://www.radiopetlady.com/wp-content/uploads/bfi_thumb/RPLN-Multi-Dog-and-cats-2-1920x731-6s69on2zlvwrb6dw71qibv1vbb06omlwrh8zuzntxgs.jpg');">

	<div class="container text-dark ">
		<br> <br>
		<div class="row mx-md-n5">
			<div class="col-md-12 px-md">
					<br>
		<div class="centerBlock">
		<h4>
			<strong> Success! </strong>
		</h4>
		</div>
		

	</div>
	</div>
		<div class="row mx-md-n5">
			<div class="col-md-12 px-md">
					<br>
		<div class="centerBlock">
		<h5>
			<strong>You rated ${petReview.reservation.pet.name}</strong> 	
			<c:if test="${petReview.rating == 1}">
												<span class="fa fa-star checked"></span>
												<span class="fa fa-star"></span>
												<span class="fa fa-star"></span>
												<span class="fa fa-star"></span>
												<span class="fa fa-star"></span>
											</c:if>
											<c:if test="${petReview.rating == 2}">
												<span class="fa fa-star checked"></span>
												<span class="fa fa-star checked"></span>
												<span class="fa fa-star"></span>
												<span class="fa fa-star"></span>
												<span class="fa fa-star"></span>
											</c:if>
											<c:if test="${petReview.rating == 3}">
												<span class="fa fa-star checked"></span>
												<span class="fa fa-star checked"></span>
												<span class="fa fa-star checked"></span>
												<span class="fa fa-star"></span>
												<span class="fa fa-star"></span>
											</c:if>
											<c:if test="${petReview.rating == 4}">
												<span class="fa fa-star checked"></span>
												<span class="fa fa-star checked"></span>
												<span class="fa fa-star checked"></span>
												<span class="fa fa-star checked"></span>
												<span class="fa fa-star"></span>
											</c:if>
											<c:if test="${petReview.rating == 5}">
												<span class="fa fa-star checked"></span>
												<span class="fa fa-star checked"></span>
												<span class="fa fa-star checked"></span>
												<span class="fa fa-star checked"></span>
												<span class="fa fa-star checked"></span>
											</c:if>
		</h5>
		</div>
		

	</div>
	</div>
						<div class="row mx-md-n5">
							<div class="col-md-12 px-md">
								<br>
								<div class="centerBlock">
									<h5> "${petReview.review }"
									</h5>
								</div>
							</div>
						</div>
		
	</div>
<%@include file="/WEB-INF/footer.jsp"%>

</body>
</html>