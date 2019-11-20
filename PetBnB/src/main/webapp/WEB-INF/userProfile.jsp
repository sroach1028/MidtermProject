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
<title>User Profile</title>
<%@include file="nav.jsp"%>
<style>
	.centerBlock {
	  display: table;
	  margin: auto;
	}

</style>
</head>

<body style = "background-color: #cce6f0">
	<br>
	<div class="container">

<div class="row mx-sm-n5">
<div class="col-sm-4 px-sm">
			</div>
			<div class="col-sm-4 px-sm">
			<p></p>
			</div>
			<div class="col-sm-4 px-sm">
			</div>
</div>

<div class="row mx-md-n5">
			
			<div class="col-sm-4 px-sm">
			</div>
			<div class="col-sm-4 px-sm">
				<div class="p-3 border border-dark bg-light">
					<div class="centerBlock">			
						<p>
							<strong><font size="10" face ="Verdana" >User Profile</font></strong>
						</p>
					</div>
				</div>		
			</div>
			<div class="col-sm-4 px-sm">
			</div>
		</div>

		<br>

		<div class="row mx-md-n5">
			<div class="col-md-4 px-md">
				<div class="p-3 border border-dark bg-light">
					<div class="centerBlock">
						<img src="${user.imageURL }" height="245" width="245" />
					</div>
				</div>
			</div>
				
			<div class="col-sm-8">
				<div class="p-3 border border-dark bg-light">
					<div class="centerBlock">
				
							<p><strong><font size="5" face ="Geneva" >${user.firstName} ${user.lastName }</font></strong></p>
							
							<p><font size="4" face ="Geneva" >${user.address.city }, ${user.address.state }, ${user.address.zip }</font></p>
							
							<p><font size="3" face ="times new roman" ><u>${user.email }</u></font></p>
							
					</div>
				</div>	
			</div>
				<br>
			</div>
			<br>
				<div class="resultsSingle">
					<table class="table">
						<th>List of Pets</th>
						<c:forEach items="${user.pets }" var="pet">
							<c:if test="${pet.active == true}">
								<tr>
									<td><a href="getPet.do?petId=${pet.id }"
										class="btTxt submit">${pet.name }</a></td>
								</tr>
							</c:if>
						</c:forEach>
					</table>
				</div>
			</div>
		
		<c:if test="${sessionUser.id == user.id}">
			<form action="goToAddPet.do" method="GET">
				<input type="submit" class="btn btn-dark" value="Add Pet" />
			</form>

			<form action="goAccountPage.do" method="GET">
				<input type="hidden" name="id" value=${sessionUser.id } /> <input
					type="submit" class="btn btn-dark" value="Account Details" />
			</form>
		
			<c:if test="${not empty sessionHost}">
				<form action="goToHostPage.do" method="GET">
					<input type="hidden" name="hostId" value=${sessionHost.id } /> 
					<input type="submit" class="btn btn-dark" value="Host Details" />
				</form>
			</c:if>

		</c:if>

	<br>
	<br>
	<br>
	<br>
	<br>

</body>
</html>