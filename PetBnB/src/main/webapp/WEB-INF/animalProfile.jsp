
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
<title>Animal Profile</title>
</head>
<body>

<div>
<ul>
  <li>Pet Type: ${pet.petType}</li>
  <li><strong>Pet Name: </strong>${pet.name}</li>
  <li>Pet Breed: ${pet.breed}</li>
  <li>Description: ${pet.description}</li>
  <li>Special Needs: ${pet.}</li>
  <li>Owner: ${pet.user.firstName }</li>
</ul>
</div>


</body>
</html>