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
<title>User Profile</title>
<link rel="stylesheet" href="css/styles.css">
<style>
	.centerBlock {
	  display: table;
	  margin: auto;
	}
	.contain {object-fit: contain;}

	
</style>
<%@include file="nav.jsp"%>
</head>

<body style = "background-color: #cce6f0">
	<br>
	<div class="container">
		<div class="row mx-sm-n5">
			<div class="col-sm-4 px-sm">
			</div>
			<br>
			<div class="col-sm-4 px-sm">
			<p></p>
			</div>
			<br>
			<div class="col-sm-4 px-sm">
			</div>
		</div>
	</div>
	<br>
	<br>
	<div class="container">
		<div class="row mx-md-n5">
			
			<div class="col-md-4 px-sm">
			</div>
			<br>
			<div class="col-md-4 px-sm">
				<div class="p-3 border border-dark bg-light">
					<div class="centerBlock">			
						<p>
							<strong><font size="8" face ="Verdana" >User Profile</font></strong>
						</p>
						<br>
					</div>
				</div>		
			</div>
	
				<div class="col-md-4 px-sm">
			</div>
		</div>
	</div>
	
		<br>
		<br>
	<div class="container">
		<div class="row mx-md-n5">
					<div class="col-md-2 px-md">
		</div>
		
			<div class="col-md-4 px-md">
				<div class="p-3 border border-dark bg-light">
					<div class="centerBlock">
						<img src="${user.imageURL }" class="contain" height="260" width="260" />
					</div>
				</div>
			</div>
				
			<div class="col-md-3">
				<div class="p-3 border border-dark bg-light">
					<div class="centerBlock">
				
							<p><strong><font size="6" face ="Geneva" >${user.firstName} ${user.lastName }</font></strong></p>
							
							<p><font size="5" face ="Geneva" >${user.address.city }, ${user.address.state }, ${user.address.zip }</font></p>
							
							<p><font size="5" face ="times new roman" ><u>${user.email }</u></font></p>
							
					</div>
				</div>	
			</div>
			<div class="col-md-2">
				<div class="centerBlock">			
						
					<c:if test="${sessionUser.id == user.id}">
						
						<form action="goToAddPet.do" method="GET">
						<input type="submit" class="btn btn-dark" value="Add Pet" />
						</form>
						
						<br>
			
						<form action="goAccountPage.do" method="GET">
						<input type="hidden" name="id" value=${sessionUser.id } /> <input
						type="submit" class="btn btn-dark" value="Account Details" />
						</form>
						<br>
						
						<br>
			
						<form action="toEditUserProfile.do" method="GET">
						<input type="hidden" name="id" value=${sessionUser.id } /> <input
						type="submit" class="btn btn-dark" value="Edit User Profile" />
						</form>
						<br>
						
						<c:if test="${not empty sessionHost}">
							<form action="goToHostPage.do" method="GET">
								<input type="hidden" name="hostId" value=${sessionHost.id } /> 
								<input type="submit" class="btn btn-dark" value="Host Details" />
							</form>
						</c:if>
						
					</c:if>
				</div>
			</div>
			
		</div>
	</div>
			
			<br>
	<div class="container">
		<div class="row mx-md-n5">
			<div class="col-md-2 px-md">
			</div>	
						<div class="col-md-4 px-md">
							
					<p><strong><font size="9" face ="Geneva" >Pets List</font></strong></p>
						<c:forEach items="${user.pets }" var="pet">
							<c:if test="${pet.active == true}">
								<div>
									<a class="aPet" href="getPet.do?petId=${pet.id }" >${pet.name }</a>
								</div>
							</c:if>
						</c:forEach>
		</div>
	</div>
	
	<br>
	<br>
<%@include file="/WEB-INF/footer.jsp"%>

	
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