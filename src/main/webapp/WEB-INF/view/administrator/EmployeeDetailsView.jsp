<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
   	
<!DOCTYPE html>
<html>
<head>
<title>Dashboard</title>
<meta charset="utf-8">
		  <meta name="viewport" content="width=device-width, initial-scale=1">
		  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
		  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
		  
<style>

<!-- sidenavbar -->
body {
  font-family: "Calibri", sans-serif;
}

.sidenav {
  height: 100%;
  width: 250px;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #F5F5F5;
  overflow-x: hidden;
  padding-top: 20px;
}

.sidenav a {
  padding: 6px 8px 6px 16px;
  text-decoration: none;
  font-size: 20px;
  color: #0000ff;
  display: block;
}

.sidenav a:hover {
  color: #000000;
  text-decoration: none;
}

.main {
  margin-left: 200px; /* Same as the width of the sidenav */
}

</style>
</head>
<body sclas="bg-slate-100">
	
	<%@ include file="../header.jsp" %>
	
	<div class="container">
	<div class="row">
	    <div class="col-sm-*">
			<!-- sidenavbar -->
			<%@page import="com.project.entity.Login" %>
			<%@page import="org.springframework.web.servlet.ModelAndView" %>
			<% Login l=(Login)session.getAttribute("userInfo");	 %>
			<div class="sidenav border border-slate-700 flex flex-col justify-between">
				
				<div class="mx-2">
					<h2 class="font-extrabold mb-2 ">SVSS</h2>
					<span class="inline-block w-full text-white bg-purple-700 hover:bg-purple-800 font-medium rounded-md text-sm p-2.5 text-center my-1"><%= l.getRole().toUpperCase() %></span>
				</div>
				
		<% if(!l.getId().equals("EMP100")){ %>
				<a href="personalInfo.html">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Personal Info
				</a>
		<%} %>
		<% if(l.getRole().equals("administrator")){ %>
			  <div class="flex-grow text-xs mt-4">
			    <a href="addEmployeeView.html" class="flex gap-x-2 inline-block text-slate-700 font-semibold hover:underline" style="font-size:16px;font-weight:600">
			    	Add Employee
			    </a>
				<a href="searchEmployeeView.html" class="text-slate-700 font-semibold"  style="font-size:16px;font-weight:600">
					Search Employee
				</a>
				<a href="allEmployeesView.html" class="text-slate-700 font-semibold"  style="font-size:16px;font-weight:600">
					All Employees
				</a>
			</div>
		<%} %>
		<div class="p-2 flex flex-col font-medium text-slate-800 rounded-md bg-white border-blue-400 m-2">
					<span><%= l.getUsername() %></span>
					<span><%= l.getId() %></span>
					<!--<a href="editView.html" class="text-right">
						<span  class="text-violet-900 text-sm no-underline font-medium">EDIT</span>
					</a>-->
				</div>
			</div>
	    </div>
	    <div class="col-sm-12">
	      <!-- display window -->
			<div class="main"><br/><br/>
			<h1>Employee Details</h1>
					<table class="table table-striped table-bordered">
				    <tbody>
				       <tr>
				        <td class="font-weight-bold">Joining Date</td>
				        <td>${ employee.joiningDate }</td>	<!-- getters r used to access values -->
				      </tr>
				      <tr>
				        <td class="font-weight-bold">ID</td>
				        <td>${ employee.eid }</td>	<!-- getters r used to access values -->
				      </tr>
				      <tr>
				        <td class="font-weight-bold">Name</td>
				        <td>${ employee.name.firstName } &nbsp; &nbsp; ${ employee.name.middleName } &nbsp; &nbsp; ${ employee.name.lastName } </td>	<!-- getters r used to access values -->
				  	 </tr>
				  	 <tr>
				        <td class="font-weight-bold">Birthdate</td>
				        <td>${ employee.birthdate }</td>	<!-- getters r used to access values -->
				     </tr>
				     <tr>
				        <td class="font-weight-bold">Gender</td>
				        <td>${ employee.gender }</td>	<!-- getters r used to access values -->
				     </tr>
				     <tr>
				        <td class="font-weight-bold">Email ID</td>
				        <td>${ employee.emailID }</td>	<!-- getters r used to access values -->
				     </tr>
				     <tr>
				        <td class="font-weight-bold">Mobile number</td>
				        <td>${ employee.mobileNo }</td>	<!-- getters r used to access values -->
				     </tr>
				     <tr>
				        <td class="font-weight-bold">Adhar number</td>
				        <td>${ employee.adharNo }</td>	<!-- getters r used to access values -->
				     </tr>
				     <tr>
				        <td class="font-weight-bold">Country</td>
				        <td>${ employee.country }</td>	<!-- getters r used to access values -->
				     </tr>
				     <tr>
				        <td class="font-weight-bold">State</td>
				        <td>${ employee.state }</td>	<!-- getters r used to access values -->
				     </tr>
				     <tr>
				        <td class="font-weight-bold">City</td>
				        <td>${ employee.city }</td>	<!-- getters r used to access values -->
				     </tr>
				     <tr>
				        <td class="font-weight-bold">Address</td>
				        <td><span class="font-weight-bold"> Residential Address :</span><br> ${ employee.address.residentialAddress } 
				     <br><br><span class="font-weight-bold"> Permanent Address :</span><br> ${ employee.address.permanentAddress }</td>	<!-- getters r used to access values -->
				     </tr>
				     <tr>
				        <td class="font-weight-bold">Role</td>
				        <td>${ employee.role }</td>	<!-- getters r used to access values -->
				     </tr>
				     <tr>
				        <td class="font-weight-bold">Qualification</td>
				        <td>${ employee.qualification }</td>	<!-- getters r used to access values -->
				     </tr>
				     <tr>
				        <td class="font-weight-bold">Specialization</td>
				        <td>${ employee.specialization }</td>	<!-- getters r used to access values -->
				     </tr> 	
				</tbody>
				</table>	
				<div class="row">
					<div class="col-sm-6">
					   	<form action="editEmployeeView.html" method="post">
					   		<input type="text" name="eid" value="${employee.eid }" hidden="">
					    	<button type="submit" class="btn btn-primary">Edit</button>
					    </form>
					</div>
					<div class="col-sm-6">
					    <form action="deleteEmployee.html" method="post">
					   		<input type="text" name="eid" value="${employee.eid }" hidden="">
					    	<button type="submit" class="btn btn-danger">Delete</button>
					    </form>
					</div>
				</div>
			</div>
		</div>
		
	</div>
	</div>
	
</body>
</html> 
<body>