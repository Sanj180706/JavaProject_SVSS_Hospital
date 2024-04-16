<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="com.project.dao.LoginDao" 
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
   	 <%! 
	LoginDao infoLog= new LoginDao();
    %>
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
<body>
	
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
			    <a href="addEmployeeView.html" class="text-violet-800 flex gap-x-2 inline-block text-slate-700 font-semibold hover:underline" style="font-size:16px;font-weight:600">
			    	<span>Add Employee</span>
			    </a>
				<a href="searchEmployeeView.html" class="text-slate-700 font-semibold"  style="font-size:16px;font-weight:600">
					<span>Search Employee</span>
				</a>
				<a href="allEmployeesView.html" class="text-violet-800 font-semibold"  style="font-size:16px;font-weight:600">
					> <span>All Employees</span>
				</a>
			</div>
		<%} %>
		
		<% if(l.getRole().equals("receptionist")){ %>
		<div class="flex-grow">
				<a href="addPatientView.html" class="text-slate-700 text-sm font-semibold">
					Add Patient
				</a>
				<a href="searchPatientView.html" class="text-slate-700 text-sm font-semibold">
					Search Patient
				</a>
				<a href="opdQueueView.html" class="text-slate-700 text-sm font-semibold">
					OPD Queue
				</a>
				<a href="prescriptionQueueView.html"  class="text-slate-700 text-sm font-semibold">
					<% String count=""+request.getAttribute("prescriptionsCount"); %>
					Prescriptions 
					<span class="badge badge-pill badge-danger"><%=count %></span>
				</a>
		</div>
		<%} %>
		
		<% if(l.getRole().equals("doctor")){ %>
				<a href="opdQueueD.html">
				OPD Queue
				</a>
				<a href="searchPatientView.html">
					Search Patient
				</a>
				<a class="text-primary">
				Patient General Info
				</a>
				<a class="text-primary">
				History
				</a>
				<a class="text-primary">
				Observations &
				Prescription
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
			<div class="main">
			<h2 class="font-extrabold text-3xl mb-4">Search Existing Employee</h2>
			
			 		<%	
					try{
						String status=(request.getAttribute("status")).toString();
						infoLog.logActivities(status);
						if(status.equals("false"))
						{  
					%>	<div class="text-danger"><b>No unique employee found...Verify your Credentials..</b></div>
					<%  }
						}catch(Exception e){infoLog.logActivities(""+e);}
					%>
			
			<div class="card bg-light border-primary mb-3" >
			  <div class="card-header"><h4>By Name</h4></div>
			  <div class="card-body">
			    <p class="card-text">
			    	<form action="searchEmployeeByName.html" method="post" >
						 <div class="form-group">
						 	<label>Firstname</label>
						 	<input type="text" class="form-control" id="exampleInputEmail1" name="firstName" placeholder="first name"
						 	required="required" autocomplete="off" maxlength="20">
						 </div>
						 <div class="form-group">
						 	<label>Lastname</label>
						 	<input type="text" class="form-control" id="exampleInputEmail1" name="lastName" placeholder="last name"
						 	required="required" autocomplete="off" maxlength="20">
						 </div>
						 <div style="text-align: center;">
				    	<button type="submit" class="btn btn-primary">Submit</button>
				    	</div>
				    </form>
			    </p>
			  </div>
			</div>
				
			<div class="card bg-light border-danger mb-3" >
			  <div class="card-header"><h4>By Id</h4></div>
			  <div class="card-body">
			    <p class="card-text">
			    	<form action="searchEmployeeById.html" method="post" >
						 <div class="form-group">
						 	<label>Employee Id</label>
						 	<input type="text" class="form-control" id="exampleInputEmail1" name="id" placeholder="EMPxxx"
						 	required="required" autocomplete="off" maxlength="10">
						 </div>
				    	<div style="text-align: center;">
				    	<button type="submit" class="btn btn-primary">Search</button>
				    	</div>
				    </form>
			    </p>
			  </div>
			</div>
			
			<div class="card bg-light border-info mb-3" >
			  <div class="card-header"><h4>By Mobile No</h4></div>
			  <div class="card-body">
			    <p class="card-text">
			    	<form action="searchEmployeeByMobileNo.html" method="post" >
						 <div class="form-group">
						 	<label>Mobile No</label>
						 	<input type="text" class="form-control" id="exampleInputEmail1" name="mobileNo" placeholder="10 digit"
						 	required="required" autocomplete="off" minlength="10" maxlength="10">
						 </div>
						 <div style="text-align: center;">
				    	<button type="submit" class="btn btn-primary">Search</button>
				    	</div>
				    </form>
			    </p>
			  </div>
			</div>
				
			<div class="card bg-light border-warning mb-3" >
			  <div class="card-header"><h4>By Aadhar No</h4></div>
			  <div class="card-body">
			    <p class="card-text">
			    	<form action="searchEmployeeByAadharNo.html" method="post" >
						 <div class="form-group">
						 	<label>Adhar No</label>
						 	<input type="text" class="form-control" id="exampleInputEmail1" name="aadharNo" placeholder="12 digit"
						 	required="required" autocomplete="off" minlegth="12" maxlength="12">
						 </div>
						 <div style="text-align: center;">
				    	<button type="submit" class="btn btn-primary">Search</button>
				    	</div>
				    </form>
			    </p>
			  </div>
			</div>		
				
		</div>
		</div>
		
</div>
</div>
	
</body>
</html> 
<body>