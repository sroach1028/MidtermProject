<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<link href="css/styles.css" rel="stylesheet" type="text/css">
<!-- Font Awesome Icon Library -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.checked {
  color: orange;
}
</style>
<%@include file="nav.jsp"%><meta charset="UTF-8">
<meta charset="utf-8">
<title>Host Profile</title>
</head>
<body>
	<p>${host.user.firstName} ${host.user.lastName} </p>
	<img src="${host.user.imageURL }" height="150" width="150"/>
	<br>
	<br>
	<p>Review Average (out of ${listSize } reviews): </p>
<c:if test="${reviewAverage == 1}">	
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star"></span>
			<span class="fa fa-star"></span>
			<span class="fa fa-star"></span>
			<span class="fa fa-star"></span>
	</c:if>
	
<c:if test="${reviewAverage == 2}">	
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star"></span>
			<span class="fa fa-star"></span>
			<span class="fa fa-star"></span>
	</c:if>
	
<c:if test="${reviewAverage == 3}">	
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star"></span>
			<span class="fa fa-star"></span>
	</c:if>
	
<c:if test="${reviewAverage == 4}">	
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star"></span>
	</c:if>
	
<c:if test="${reviewAverage == 5}">	
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
	</c:if>
	<br>
	<br>
	<p> ${host.user.address.city }, ${host.user.address.state }, ${host.user.address.zip } </p>
	<p>  ${host.description} </p>
	
	<iframe src="http://maps.google.com/maps?q=${host.user.address.zip}&z=15&output=embed" width="600" height="400"
				frameborder="0" style="border:0"></iframe>
	
	
	
	
	
	
	
<div id="myCarousel" class="carousel slide" data-ride="carousel">
  Indicators
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>



 Wrapper for slides
  <div class="carousel-inner">
    <div class="item active">
      <img src="${image1 }">
    </div>

    <div class="item">
      <img src="${image2 }">
    </div>

    <div class="item">
      <img src="${image3 }">
    </div>
  </div>

  Left and right controls
  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    <span class="sr-only">Next</span>
  </a> 
</div>
			<%-- <c:forEach items="${host.images}" var="image">
				<ul>
					<li>Rating: ${reviews.rating }</li>
					<li>Summary: ${reviews.review }</li>
				</ul>
			</c:forEach>
			<h3>List of Reviews</h3>
			<c:forEach items="${host.reviewsOfHost}" var="reviews">
				<ul>
					<li>Rating: ${reviews.rating }</li>
					<li>Summary: ${reviews.review }</li>
				</ul>
			</c:forEach> --%>

			
	<!-- </di -->v>
</body>
</html>