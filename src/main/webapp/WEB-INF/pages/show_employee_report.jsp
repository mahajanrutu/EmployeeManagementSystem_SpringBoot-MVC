
<%@page isELIgnored="false"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">


</head>



<nav class="navbar navbar-expand-lg bg-dark">
	<div class="container-fluid">
		<a class="navbar-brand" style="color: white;">Employee Management
			System</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					style="color: white;" page" href="./"
					onmouseover="this.style.color='#f8f9fa'; this.style.backgroundColor='#8a9096'; this.style.borderRadius='5px';" 
               onmouseout="this.style.color='white'; this.style.backgroundColor='transparent'; this.style.borderRadius='0';"
					>About</a></li>
				<li class="nav-item"><a class="nav-link active"
					style="color: white;" page" href="emp_add"
					onmouseover="this.style.color='#f8f9fa'; this.style.backgroundColor='#8a9096'; this.style.borderRadius='5px';" 
               onmouseout="this.style.color='white'; this.style.backgroundColor='transparent'; this.style.borderRadius='0';"
					>Add Employee</a></li>
				<li class="nav-item"><a class="nav-link active"
					style="color: white;" page" href="emp_search"
					onmouseover="this.style.color='#f8f9fa'; this.style.backgroundColor='#8a9096'; this.style.borderRadius='5px';" 
               onmouseout="this.style.color='white'; this.style.backgroundColor='transparent'; this.style.borderRadius='0';"
					>Search Employee</a></li>
			</ul>
			<!-- <form class="d-flex" role="search">
				<input class="form-control me-2" type="search" placeholder="Search"
					aria-label="Search">
				<button class="btn btn-outline-success" type="submit" href="emp_search">Search</button>
			</form>-->
		</div>
	</div>
</nav>

<c:choose>
	<c:when test="${!empty empsList}">
		<!-- <h1 style="color: red; text-align: center">Employee Report</h1> -->
		<table border="1" align="center" class="table table-striped"
			style="width: 80%; height: 400px; margin-top: 60px;">
			<tr style="color: red">
				<th>ID</th>
				<th>Name</th>
				<th>Salary</th>
				<th>Job</th>
				<th>DeptNo</th>
				<th>City</th>
				<th>Actions</th>
			</tr>
			<c:forEach var="emp" items="${empsList}">
				<tr style="color: blue">
					<td>${emp.empno}</td>
					<td>${emp.empName}</td>
					<td>${emp.salary}</td>
					<td>${emp.job}</td>
					<td>${emp.deptno}</td>
					<td>${emp.city}</td>
					<td><a href="emp_edit?no=${emp.empno}"><img
							src="images/edit.png" width="30" height="30" alt="Edit"></a> <a
						href="emp_delete?no=${emp.empno}"
						onclick="return confirm('are sure to delete the employee')"> <img
							src="images/delete.png" width="30" height="30" alt="Delete"></a></td>
				</tr>
			</c:forEach>
		</table>
	</c:when>
	<c:otherwise>
		<h1 style="color: red; text-align: center">No Employees Available</h1>
	</c:otherwise>
</c:choose>

<!--<h2 style="color: black; text-align: center">${resultMsg}</h2>-->
