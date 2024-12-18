<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="frm"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search</title>
</head>

<div style="background-image:url('images/bg9.avif'); background-size: cover;
        background-position: center; 
        height: 97vh;
        width: 100%;">

<div style="padding-top: 200px;">
<h1 style="color: grey; text-align: center">Search Data Dynamically</h1>

<frm:form action="emp_search" modelAttribute="emp" method="post">
		<table align="center" bgcolor="black" style="color: white; height:200%; width:25%; padding: 17px;">
		<tr>
			<td>Employee Name:</td>
			<td><frm:input path="empName" /></td>
		</tr>
		<tr>
			<td>Employee Salary:</td>
			<td><frm:input path="salary" /></td>
		</tr>
		<tr>
			<td>Employee City:</td>
			<td><frm:input path="city" /></td>
		</tr>
		<tr>
			<td>Employee Job:</td>
			<td><frm:input path="job" /></td>
		</tr>
		<tr>
			<td>Employee DeptNo:</td>
			<td><frm:select path="deptno">
					<frm:option value="">--select Department--</frm:option>
					<frm:option value="101">101</frm:option>
					<frm:option value="102">102</frm:option>
					<frm:option value="103">103</frm:option>
				</frm:select></td>
		</tr>
		<tr>
			<td><input type="submit" value="Search for Data" /></td>
			<td><input type="reset" value="cancel" /></td>
		</tr>
	</table>
	
</frm:form>
</div>
</div>
</html>