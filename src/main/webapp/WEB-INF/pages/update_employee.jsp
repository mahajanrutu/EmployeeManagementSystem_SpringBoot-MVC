<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="frm"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<div style="background-image:url('images/bg9.avif'); background-size: cover;
        background-position: center; 
        height: 97vh;
        width: 100%;">

<div style="padding-top: 200px;">
	<h1 style="color: Grey; text-align: center;">Update Employee</h1>

<frm:form modelAttribute="emp">
		<table align="center" bgcolor="black" style="color: white; height:200%; width:25%; padding: 17px;">
		<tr>
			<td>Employee Number::</td>
			<td><frm:input path="empno" readonly="true" /></td>
		</tr>
		<tr>
			<td>Employee Name:</td>
			<td><frm:input path="empName" /></td>
		</tr>
		<tr>
			<td>Employee Job:</td>
			<td><frm:input path="job" /></td>
		</tr>
		<tr>
			<td>Employee DeptNo::</td>
			<td><frm:input path="deptno" /></td>
		</tr>
		<tr>
			<td>Employee Salary::</td>
			<td><frm:input path="salary" /></td>
		</tr>
		<tr>
			<td>Employee City::</td>
			<td><frm:input path="city" /></td>
		</tr>
		<tr>
			<td><input type="submit" value="Update Employee"></td>
			<td><input type="reset" value="cancel"></td>
		</tr>
	</table>
</frm:form>
</div>
</div>
</html>