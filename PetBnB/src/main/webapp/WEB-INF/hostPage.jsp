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
<%@include file="nav.jsp"%><meta charset="UTF-8">
<meta charset="utf-8">
<title>Host Profile</title>
</head>
<body>
	<img src="${host.user.image }" />
	
	
	
	<!-- <div id="myCarousel" class="carousel slide" data-ride="carousel">
  Indicators
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol> -->
<!-- 


  <!-- Wrapper for slides
  <div class="carousel-inner">
    <div class="item active">
      <img src="https://i.imgur.com/T9wrwwv.jpg">
    </div>

    <div class="item">
      <img src="https://i.imgur.com/kUH7IHd.jpg">
    </div>

    <div class="item">
      <img src="https://i.imgur.com/N6RmEvp.jpg">
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
  </a> --> -->
<%-- </div>
			<c:forEach items="${host.images}" var="image">
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
			</c:forEach>

			
	</div> --%>
</body>
</html>