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

<title>View Reservation</title>
<%@include file="/WEB-INF/nav.jsp"%>
</head>
<body>

<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- Modal Header -->
        <cms:pages masterpage='calendar.php' limit='1'>
      <div class="modal-header">
          <h4><cms:show k_page_title /></h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <!-- Modal body -->
      <div class="modal-body">          
          <strong>Event:</strong> <cms:show k_page_title />          
              <br>
        <strong>Description:</strong> <cms:show desc />
          <br>
        <strong>Location:</strong> <cms:show location />
          <br>
        <strong>Start Date:</strong> <cms:date start_date format='l F jS Y' />
          <br>
        <cms:if start_time!='Unspecified' >
            <strong>From:</strong> <cms:show start_time />
            <br>
        </cms:if>
        <cms:if "<cms:not_empty end_date />" >
            <strong>End Date:</strong> <cms:date end_date format='l F jS Y' />
            <br>
        </cms:if>
        <cms:if end_time!='Unspecified' >
            <strong>End Time:</strong> <cms:show end_time />
            <br>
        </cms:if>
              </div>
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
            </cms:pages>
    </div>
  </div>
</div>



	<div class="jumbotron">
		<h1 class="display-3 text-center">Boop!</h1>
		<p class="lead text-center">Your reservation with
			${reservation.host.user.firstName} ${reservation.host.user.lastName }
			has been confirmed for ${reservation.openDate}</p>
		<hr class="my-4 text-center">
		<p class="lead text-center">Confirmation #000${reservation.id}</p>
		<p class="lead text-center">
			<a class="btn btn-danger" href="/" role="button">Return to Home
				Page </a>
		</p>
		<div class="text-center">
			<iframe
				src="http://maps.google.com/maps?q=${reservation.host.user.address}&z=15&output=embed"
				width="600" height="400" frameborder="0" style="border: 0"></iframe>
		</div>
	</div>
</body>
</html>