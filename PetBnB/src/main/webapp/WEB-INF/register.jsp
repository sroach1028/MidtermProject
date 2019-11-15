
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
<title>Registration Page</title>
</head>
<body>



<form action="register.do" method="POST"  modelAttribute="user">
	<table>
		<tr><td><label>Name: ${user.name } </label></td>
		<td> <input type="text" name="name"></td></tr>
		<tr><td><label>Address: ${user.address } </label></td>
		<td> <input type="text" name="address" ></td></tr>
		<tr><td><label>Email: ${user.email } </label></td>
		<td><input type="text" name="email" ></td></tr>
		<tr><td><label>Password: ${user.password } </label></td>
		<td><input type="password" name="password"></td></tr>
		<tr><td><label> How did you hear about us: ${user.description } </label></td>
		<td><input type="text" name="description" ></td></tr>
<%-- 		<tr><td><label>Upload photo of : ${pet.URL } </label></td>
		<td><input type="text" name="userPhoto" ></td></tr> --%>
		<tr><td><label>Add Pet: ${user.pet } </label></td>
		<td><input type="text" name="pet" ></td></tr>
		<tr><td><input type="submit" value="Add User"></td></tr>
	</table>
</form>



</body>
</html>