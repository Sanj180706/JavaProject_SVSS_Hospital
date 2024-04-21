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
<body class="bg-slate-100">
	
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
				<a href="personalInfo.html" class="text-sm text-slate-600">
					Personal Infor
				</a>
		<%} %>
		
		<% if(l.getRole().equals("receptionist")){ %>
		<div class="flex-grow text-xs mt-4">
				<a href="addPatientView.html"  class="flex gap-x-2 inline-block text-slate-700 font-semibold hover:underline" style="font-size:16px;font-weight:600">
					Add Patient
				</a>
				<a href="searchPatientView.html"  class="flex gap-x-2 inline-block text-slate-700 font-semibold hover:underline" style="font-size:16px;font-weight:600">
					Search Patient
				</a>
				<a href="opdQueueView.html"  class="flex gap-x-2 inline-block text-slate-700 font-semibold hover:underline" style="font-size:16px;font-weight:600">
					OPD Queue
				</a>
				<a href="prescriptionQueueView.html"  class="flex gap-x-2 inline-block text-slate-700 font-semibold hover:underline" style="color:black;font-size:16px;font-weight:600">
					<% String count=""+request.getAttribute("prescriptionsCount"); %>
					Prescriptions
<span class="w-4 h-3 p-1.5 mb-1.5 rounded bg-blue-500 text-white font-medium" style="font-size:10px"><%=count %></span>
				</a>
		<%} %>
		
		<div class="p-2 flex flex-col font-medium text-slate-800 rounded-md bg-white border-blue-400 m-2">
			<span><%= l.getUsername() %></span>
			<span><%= l.getId() %></span>
			<a href="editView.html" class="text-right">
				<span  class="text-violet-900 text-sm no-underline font-medium">EDIT</span>
			</a>
		</div>
		</div>
    </div>
	    
	    <div class="col-sm-12">
	      <!-- display window -->
						<div class="main"><br/>
				<h2 class="font-extrabold text-3xl mb-4">Patient Prescription</h2>
			 <%@page import="com.project.entity._OpdRecord, java.util.List" %>
		  <table class="table table-striped table-bordered">
			<thead>
				<tr>
				<td>Patient Id</td>
				<td>Patient Name</td>
				<td>Prescription</td>
				<td>Action</td>
				</tr>
			</thead>
		    <tbody>
			    <%
			    	List<String[]> prescriptionList=(List<String[]>) request.getAttribute("prescriptionList");
			    	for(String[] str: prescriptionList)
			    	{
			    %>
		       <tr>
		      	<td><%= str[0] %></td>
		      	<td><%= str[1] %>
		      	
		      	<td> <span  style="text-align:center;">
		      		<form action="printPrescription.html" method="post">
		      			<input type="text" name="pid" value="<%= str[0] %>" hidden="">
				   		<input type="text" name="opdid" value="<%= str[2] %>" hidden="">
				    	<button type="submit" class="btn btn-primary"> Print </button>
				    </form></span>   
		      	</td>
		      	
		      	<td><span  style="text-align:center;">
		      		<form action="prescriptionPrintDone.html" method="post">
		      			<input type="text" name="pid" value="<%= str[0] %>" hidden="">
		      			<button type="submit" class="btn btn-danger"> Cancel </button>
		      		</form></span>
		      	</td>
		      </tr>
		      <%}%>
		      </tbody>
		
			</div>
		</div>
		
	</div>
	</div>
	
</body>
</html> 
<body>