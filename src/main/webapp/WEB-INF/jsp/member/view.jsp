<%@ page language="java" contentType="text/html; charset=windows-1256"
<<<<<<< HEAD
	pageEncoding="windows-1256"%>
<!DOCTYPE html">
=======
    pageEncoding="windows-1256"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
>>>>>>> 4f787fbcaec251fac2a7ad07e6a5f8bd4cd9d43f
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link href="../webjars/bootstrap/3.2.0/css/bootstrap.min.css"
<<<<<<< HEAD
	rel="stylesheet" />
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1256">
<title>View Member</title>
</head>
<body>
	<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="../login.html">Form Builder</a>
		</div>
		<div class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li><a href="../login.html">Login</a></li>
				<li><a href="list.html">Member List</a></li>
				<li class="active"><a href="#">View Member</a></li>
			</ul>
		</div>
	</div>
	</nav>
	<table>
		<tr>
			<th>Email :</th>
			<td>${member.email }</td>
		</tr>
		<tr>
			<th>Firstname :</th>
			<td>${member.firstName  }</td>
		</tr>
		<tr>
			<th>Middlename :</th>
			<td>${member.middleName }</td>
		</tr>
		<tr>
			<th>Lastname :</th>
			<td>${member.lastName }</td>
		</tr>
		<tr>
			<th>Email :</th>
			<td>${member.email }</td>
		</tr>
		<tr>
			<td><br/></td>
		</tr>
		<tr>
			<td colspan=2>Address Information</td>
		</tr>
		<tr>
			<th>House :</th>
			<td>${member.address.house }</td>
		</tr>
		<tr>
			<th>Street :</th>
			<td>${member.address.street }</td>
		</tr>
		<tr>
			<th>Area :</th>
			<td>${member.address.area }</td>
		</tr>
		<tr>
			<th>City :</th>
			<td>${member.address.city }</td>
		</tr>
		<tr>
			<th>Zip Code :</th>
			<td>${member.address.zip }</td>
		</tr>
		<tr>
			<th>State :</th>
			<td>${member.address.state }</td>
		</tr>
		<tr>
			<th>Country :</th>
			<td>${member.address.country }</td>
		</tr>
	</table>
=======
	rel="stylesheet"/>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
<title>View user informations</title>
</head>
<body  style="margin-top: 0px; margin-bottom: 0px; margin-right: 0px;margin-left: 0px;font-family: -apple-system,system-ui,BlinkMacSystemFont,Segoe UI,Roboto,Helvetica Neue,Arial,sans-serif" >
<div style="width:100%;height:100px;background-color: #6f5499;margin-left:0;    background-image: linear-gradient(to bottom,#563d7c 0,#6f5499 100%);font-color:red;">
	<div style="top: 25px; left: 20px;position:relative;font-family:Helvetica Neue,Helvetica,Arial,sans-serif;font-size: 30px;color:white;">Form Generator Project
	</div>
	<div style="top: 50px; left: 20px;position:relative;font-family:Helvetica Neue,Helvetica,Arial,sans-serif;font-size: 12px;color:white;">${menu}
	</div>
</div>
<table border="1" cellspacing=0 cellpadding=5 bordercolor="#D3D3D3" style="margin-top: 20px; margin-bottom: 0px; margin-right: 10px;margin-left: 10px;">
	<tr>
		
		<th>Email : </th> <td>${member.email }</td>
		
	</tr>
	<tr>
		
		<th>Firstname : </th> <td>${member.firstName  }</td>
		
	</tr>
	<tr>
		
		<th>Middlename : </th> <td>${member.middleName }</td>
		
	</tr>
	<tr>
		
		<th>Lastname : </th> <td>${member.lastName }</td>
		
	</tr>
	<tr>
		
		<th>Password : </th> <td>${member.passcode }</td>
		
	</tr>
	<tr>
		<td colspan=2> Address Information </td>
	</tr>
	<tr>
		
		<th>House : </th> <td>${member.address.house }</td>
		
	</tr> 
	<tr>
		
		<th>Street : </th> <td>${member.address.street }</td>
		
	</tr>
	<tr>
		
		<th>Area : </th> <td>${member.address.area }</td>
		
	</tr>		
	<tr>
		
		<th>City : </th> <td>${member.address.city }</td>
		
	</tr>
	<tr>
		
		<th>Zip Code : </th> <td>${member.address.zip }</td>
		
	</tr>
	<tr>
		
		<th>State : </th> <td>${member.address.state }</td>
		
	</tr>
	<tr>
		
		<th>Country : </th> <td>${member.address.country }</td>
		
	</tr>								

</table>
>>>>>>> 4f787fbcaec251fac2a7ad07e6a5f8bd4cd9d43f
</body>
</html>