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
		   <script src="https://cdn.tailwindcss.com"></script>
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
  color: black;
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
<body>
	
	<%@ include file="header.jsp" %>
	
	<div class="container">
	<div class="row">
	    <div class="col-sm-*">
			<!-- sidenavbar -->
			<%@page import="com.project.entity.Login" %>
			<%@page import="org.springframework.web.servlet.ModelAndView" %>
			<% Login l=(Login)session.getAttribute("userInfo");	 %>
			<div class="sidenav">
				<a><br/><br/>
				<div style="background-color: green;">&nbsp;&nbsp;&nbsp;
					<span class="badge badge-pill badge-warning">&nbsp;&nbsp;<%= l.getRole().toUpperCase() %>&nbsp;&nbsp;</span><br/><br/>
					<b>Username:</b> <%= l.getUsername() %><br/><br/>
					<b>Id:</b> <%= l.getId() %><br/>
					<a href="editView.html">
			    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="text-decoration:underline; color:purple;">EDIT</span>
			    	</a>
				</div>
				</a><br/>
				
		<% if(!l.getId().equals("EMP100")){ %>
				<a href="personalInfo.html">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Personal Info
				</a>
		<%} %>
		<% if(l.getRole().equals("administrator")){ %>
			    <a href="addEmployeeView.html" >
			    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Add Employee
			    </a>
				<a href="searchEmployeeView.html">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Search Employee
				</a>
				<a href="allEmployeesView.html">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;All Employees
				</a>
		<%} %>
		
		<% if(l.getRole().equals("receptionist")){ %>
				<a href="addPatientView.html">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Add Patient
				</a>
				<a href="searchPatientView.html">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Search Patient
				</a>
				<a href="opdQueueView.html">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;OPD Queue
				</a>
				<a href="prescriptionQueueView.html">
					<% String count=""+request.getAttribute("prescriptionsCount"); %>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Prescriptions 
					<span class="badge badge-pill badge-danger"><%=count %></span>
				</a>
		<%} %>
		
		<% if(l.getRole().equals("doctor")){ %>
				<a href="opdQueueD.html">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;OPD Queue
				</a>
				<a href="searchPatientView.html">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Search Patient
				</a>
				<a class="text-primary">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Patient General Info
				</a>
				<a class="text-primary">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;History
				</a>
				<a class="text-primary">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Observations &<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Prescription
				</a>
		<%} %>
			</div>
	    </div>
	    
	    <div class="col-sm-12">
	      <!-- display window -->
			<div class="main"><br/><br/><br/><br/><br/><br/><br/><br/>
				<h1><div style="text-align:center;">
					Welcome <span style="color: orange;"><%=l.getUsername() %> </span>! <br/>
					 Let's Get Started !
				</div>
				</h1>
		
		<%@page import="java.util.List" %>		
		<% if(l.getRole().equals("administrator")){ 
			List<Integer> users_count=(List<Integer>) request.getAttribute("users_count");
		%>
			<br/><br/>
			<div class="row">
			
			  <!--<div class="col-sm-3">
			    <div class="card text-white bg-primary mb-3" style="max-width: 20rem;">
				  <div class="card-body">
				    <h4 class="card-title">Doctors</h4>
				    <p class="card-text"><%=users_count.get(0) %></p>
				  </div>
				</div>
			  </div>
			  
			  <div class="col-sm-3">
			    <div class="card text-white bg-primary mb-3" style="max-width: 20rem;">
				  <div class="card-body">
				    <h4 class="card-title">Patients</h4>
				    <p class="card-text"><%=users_count.get(1) %></p>
				  </div>
				</div>
			  </div>
			  
			  <div class="col-sm-3">
			    <div class="card text-white bg-primary mb-3" style="max-width: 20rem;">
				  <div class="card-body">
				    <h4 class="card-title">Employees</h4>
				    <p class="card-text"><%=users_count.get(2) %></p>
				  </div>
				</div>
			 </div>
				
			<div class="col-sm-3">
			    <div class="card text-white bg-primary mb-3" style="max-width: 20rem;">
				  <div class="card-body">
				    <h4 class="card-title">OPD Fees</h4>
				    <p class="card-text">Rs.<%=users_count.get(3) %></p>
				  </div>
				</div>
			  </div>
			  -->
			  <div class="grid grid-cols-1 md:grid-cols-2 jutify-center w-full gap-8">
			  
				  <div class="relative flex py-2 px-4 flex-col bg-gradient-to-l from-purple-600 to-blue-600 w-full rounded-xl">
				  	<h2 class="text-white text-2xl font-bold">DOCTORS</h2>
				  	<p class="text-white font-mono font-semibold text-xl"><%=users_count.get(1) %></p>
				  	
				  	<svg class="absolute stroke-2 stroke-white/90 -rotate-12 right-4 -bottom-1 size-24" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-briefcase-medical"><path d="M12 11v4"/><path d="M14 13h-4"/><path d="M16 6V4a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v2"/><path d="M18 6v14"/><path d="M6 6v14"/><rect width="20" height="14" x="2" y="6" rx="2"/></svg>
				  </div>
				  
				   <div class="relative flex py-2 px-4 flex-col bg-gradient-to-l from-purple-600 to-blue-600 w-full rounded-xl">
				  	<h2 class="text-white text-xl font-bold font-mono">EMPLOYEE</h2>
				  	<p class="text-white"><%=users_count.get(2) %></p>
				  	
				 	<svg class="absolute stroke-2 stroke-white/90 -rotate-12 right-4 bottom-0 size-24" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-concierge-bell"><path d="M3 20a1 1 0 0 1-1-1v-1a2 2 0 0 1 2-2h16a2 2 0 0 1 2 2v1a1 1 0 0 1-1 1Z"/><path d="M20 16a8 8 0 1 0-16 0"/><path d="M12 4v4"/><path d="M10 4h4"/></svg>
				</div>
				  
				  <div class="relative flex py-2 px-4 flex-col bg-gradient-to-l from-purple-600 to-blue-600 w-full rounded-xl">
				  	<h2 class="text-white text-xl font-bold font-mono">PATIENTS</h2>
				  	<p class="text-white"><%=users_count.get(0) %></p>
				  	
				<svg class="absolute stroke-2 stroke-white/90 -rotate-12 right-4 bottom-0 size-24" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-pill"><path d="m10.5 20.5 10-10a4.95 4.95 0 1 0-7-7l-10 10a4.95 4.95 0 1 0 7 7Z"/><path d="m8.5 8.5 7 7"/></svg>
				 </div>
				  
				    <div class="relative flex py-2 px-4 flex-col bg-gradient-to-l from-purple-600 to-blue-600 w-full rounded-xl">
				  	<h2 class="text-white text-xl font-bold font-mono">OPD FEE</h2>
				  	<p class="text-white"><%=users_count.get(3) %></p>
				  	
				 <svg class="absolute stroke-2 stroke-white/90 -rotate-12 right-4 bottom-0 size-24" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-receipt-indian-rupee"><path d="M4 2v20l2-1 2 1 2-1 2 1 2-1 2 1 2-1 2 1V2l-2 1-2-1-2 1-2-1-2 1-2-1-2 1Z"/><path d="M8 7h8"/><path d="M12 17.5 8 15h1a4 4 0 0 0 0-8"/><path d="M8 11h8"/></svg>
				 </div>
				  
				
				  
			  </div>
		<%} %>
		
			</div>
		</div>
				
	</div>
	</div>
	
</body>
</html> 
<body>