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
				<a href="personalInfo.html">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Personal Info
				</a>
		<%} %>
		<% if(l.getRole().equals("administrator")){ %>
			<div class="flex-grow text-xs mt-4">
			    <a href="addEmployeeView.html" class="text-violet-800 flex gap-x-2 inline-block text-slate-700 font-semibold hover:underline" style="font-size:16px;font-weight:600">
			    	> <span>Add Employee</span>
			    </a>
				<a href="searchEmployeeView.html" class="text-slate-700 font-semibold"  style="font-size:16px;font-weight:600">
					Search Employee
				</a>
				<a href="allEmployeesView.html" class="text-slate-700 font-semibold"  style="font-size:16px;font-weight:600">
					All Employees
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
			<div class="main"><br/>
				<h2 class="font-extrabold text-3xl">Add New Employee</h2>
		
				<div class="container grey">
				<form name="addEmp" action="addEmployee.html" method="post" >
				 <div class="form-group"><br/>
			      <label class="font-medium text-slate-700">Name</label>
			        <div class="row">
			        <div class="col-sm-4">
			        <input type="text" class="form-control" id="exampleInputEmail1" name="firstName" placeholder="First Name"
			        required="required" autocomplete="off" maxlength="20">
			        </div>
			        <div class="col-sm-4">
			        <input type="text" class="form-control" id="exampleInputEmail1" name="middleName" placeholder="Middle Name"
			        required="required" autocomplete="off" maxlength="20">
			        </div>
			        <div class="col-sm-4">
			        <input type="text" class="form-control" id="exampleInputEmail1" name="lastName" placeholder="Last Name"
			        required="required" autocomplete="off" maxlength="20">
			        </div>
			    </div>
			
			     <div class="form-group"><br/>
			       <label class="font-medium text-slate-700">Birthdate</label>
			      <input type="date" class="form-control" id="exampleInputEmail1" name="birthdate" placeholder="Choose BirthDate"
			        required="required" max="2020-03-14">
			    </div>
			
			    <div class="form-group">
			       <label class="font-medium text-slate-700">Gender</label>
			      <select class="form-control" id="exampleSelect1" name="gender">
			        <option value="female">Female</option>
			        <option value="male">Male</option>
			        <option value="other">Other</option>
			      </select>
			    </div>
			
			     <div class="form-group">
			       <label class="font-medium text-slate-700">Email address</label>
			      <input type="email" class="form-control" id="exampleInputEmail1" name="email" placeholder="Enter Email"
			        required="required" autocomplete="off" maxlength="30">
			    </div>
			
			     <div class="form-group">
			       <label class="font-medium text-slate-700">Mobile No</label>
			      <input type="text" class="form-control" id="exampleInputEmail1" name="mobileNo" placeholder="Enter Mobile No"
			        required="required" autocomplete="off" minlength="10" maxlength="10">
			    </div>
			
			     <div class="form-group">
			       <label class="font-medium text-slate-700">Adhar No</label>
			      <input type="text" class="form-control" id="exampleInputEmail1" name="adharNo" placeholder="Enter Adhar No"
			        required="required" autocomplete="off" minlength="12" maxlength="12">
			    </div>
			
			     <div class="form-group">
			      <label class="font-medium text-slate-700">Country</label>
			      <input type="text" class="form-control" id="exampleInputEmail1" name="country" placeholder="Enter Country"
			        required="required" autocomplete="off" maxlength="20">
			    </div>
			
			     <div class="form-group">
			       <label class="font-medium text-slate-700">State</label>
			      <input type="text" class="form-control" id="exampleInputEmail1" name="state" placeholder="Enter State"
			        required="required" autocomplete="off" maxlength="20">
			    </div>
			
			    <div class="form-group">
			       <label class="font-medium text-slate-700">City</label>
			      <input type="text" class="form-control" id="exampleInputEmail1" name="city" placeholder="Enter City"
			        required="required" autocomplete="off" maxlength="20">
			    </div>
			
			     <div class="form-group">
			       <label class="font-medium text-slate-700">Residential Address</label>
			      <textarea class="form-control" id="exampleTextarea" rows="2" name="residentialAddress"
			        required="required" autocomplete="off" maxlength="100"></textarea>
			    </div>
			
			     <div class="form-group">
			       <label class="font-medium text-slate-700">Permanent Address</label>
			      <textarea class="form-control" id="exampleTextarea" rows="2"  name="permanentAddress"
			        required="required" autocomplete="off" maxlength="100"></textarea>
			    </div>
			
			    <div class="form-group">
			       <label class="font-medium text-slate-700">Role</label>
			      <select class="form-control" id="exampleSelect1" name="role">
			          <option value="doctor">Doctor</option>
			          <option value="receptionist">Receptionist</option>
			          <option value="administrator">Administrator</option>
			        </select>
			    </div>
			
			    <div class="form-group">
			       <label class="font-medium text-slate-700">Qualification</label>
			      <input type="text" class="form-control" id="exampleInputEmail1" name="qualification" placeholder="Enter Qualification"
			        required="required" autocomplete="off" maxlength="50">
			    </div>
			
			    <div class="form-group">
			       <label class="font-medium text-slate-700">Specialization</label>
			      <input type="text" class="form-control" id="exampleInputEmail1" name="specialization" placeholder="Enter Specialization"
			        required="required" autocomplete="off" maxlength="50">
			    </div>
			    <div class="mt-2">
				    <button type="submit" class="font-semibold w-40 rounded text-white bg-violet-600 hover:bg-violet-900 h-10">Submit</button>
				    <button type="reset" class="font-semibold w-40 rounded text-white bg-rose-600 hover:bg-rose-900 h-10">Clear</button>
			    </div>
			     
			</div><br/><br/>
			</form></div>
			</div>
		</div>
		
	</div>
	</div>
	
</body>
</html> 
<body>