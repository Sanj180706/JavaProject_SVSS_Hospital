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
/* sidenavbar */
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
<%@ include file="header.jsp" %>
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
                    <span class="text-warning" style="color:black;">Personal Info</span>
                </a>
                <% } %>
                <% if(l.getRole().equals("administrator")){ %>
                <a href="addEmployeeView.html">
                    Add Employee
                </a>
                <a href="searchEmployeeView.html">
                    Search Employee
                </a>
                <a href="allEmployeesView.html">
                    All Employees
                </a>
                <% } %>
                <% if(l.getRole().equals("receptionist")){ %>
                <div class="flex-grow text-xs mt-4">
                    <a href="addPatientView.html" class="text-slate-700" style="color:black;font-size:16px;font-weight:600">
                        Add Patient
                    </a>
                    <a href="searchPatientView.html" class="text-slate-700" style="font-size:16px;font-weight:600">
                        Search Patient
                    </a>
                    <a href="opdQueueView.html" class="text-slate-700" style="font-size:16px;font-weight:600">
                        OPD Queue
                    </a>
                    <a href="prescriptionQueueView.html" class="text-slate-700" style="font-size:16px;font-weight:600">
                        <% String count=""+request.getAttribute("prescriptionsCount"); %>
                        Prescriptions 
                        <span class="w-4 h-3 p-1.5 mb-1.5 rounded bg-blue-500 text-white font-medium" style="font-size:10px"><%=count %></span>
                    </a>
                </div>
                <% } %>
                <% if(l.getRole().equals("doctor")){ %>
                <a href="opdQueueD.html" class="text-slate-700" style="font-size:16px;font-weight:600">
                    OPD Queue
                </a>
                <a href="searchPatientView.html" class="text-slate-700" style="font-size:16px;font-weight:600">
                    Search Patient
                </a>
                <a class="text-primary" class="text-slate-700" style="font-size:16px;font-weight:600">
                    Patient General Info
                </a>
                <a class="text-primary" class="text-slate-700" style="font-size:16px;font-weight:600">
                    History
                </a>
                <a class="text-primary" class="text-slate-700" style="font-size:16px;font-weight:600">
                    Observations &<br/>
                    Prescription
                </a>
                <% } %>
            </div>
  <div class="p-2 flex flex-col font-medium text-slate-800 rounded-md bg-white border-blue-400 m-2">
					<span><%= l.getUsername() %></span>
					<span><%= l.getId() %></span>
					<a href="editView.html" class="text-right">
						<span  class="text-violet-900 text-sm no-underline font-medium">EDIT</span>
					</a>
				</div>
			</div>
	    </div>
</div>
<div class="col-sm-12 ">
    <!-- display window -->
    <div class="main"><br/>
        <h2 class="font-extrabold text-3xl mb-4">Edit Details</h2>
        
        <form action="editEmployee.html" method="post">
            <%--  fields with disabled attribute are not submitted but readonly r submitted --%> 
            <div class="form-group">
                <label>ID</label>
                <input type="text" class="form-control" id="exampleInputEmail1" name="eid" value="${ employee.eid }" readonly="readonly">
            </div>	
            <div class="form-group">
                <label>Name</label>
                <div class="row">
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="exampleInputEmail1" name="firstName" value="${ employee.name.firstName }" required="required" autocomplete="off" maxlength="20">
                    </div>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="exampleInputEmail1" name="middleName" value="${ employee.name.middleName }" required="required" autocomplete="off" maxlength="20">
                    </div>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="exampleInputEmail1" name="lastName" value="${ employee.name.lastName }" required="required" autocomplete="off" maxlength="20">
                    </div>
                </div><br/>
            </div>
            <div class="form-group">
                <label>Birthdate</label>
                <input type="date" class="form-control" id="exampleInputEmail1" name="birthdate" value="${ employee.birthdate }" required="required" max="2020-03-14">
            </div>
            <div class="form-group">
                <label>Gender</label>
                <input type="text" class="form-control" id="exampleInputEmail1" name="gender" value="${ employee.gender }" readonly="readonly">
            </div>
            <div class="form-group">
                <label>Email address</label>
                <input type="email" class="form-control" id="exampleInputEmail1" name="email" value="${ employee.emailID }" required="required" autocomplete="off" maxlength="30">
            </div>
            <div class="form-group">
                <label>Mobile No</label>
                <input type="text" class="form-control" id="exampleInputEmail1" name="mobileNo" value="${ employee.mobileNo }" required="required" autocomplete="off" minlength="10" maxlength="10">
            </div>
            <div class="form-group">
                <label>Adhar No</label>
                <input type="text" class="form-control" id="exampleInputEmail1" name="adharNo" value="${ employee.adharNo }" readonly="readonly">
            </div>
            <div class="form-group">
                <label>Country</label>
                <input type="text" class="form-control" id="exampleInputEmail1" name="country" value="${ employee.country }" required="required" autocomplete="off" maxlength="20">
            </div>
            <div class="form-group">
                <label>State</label>
                <input type="text" class="form-control" id="exampleInputEmail1" name="state" value="${ employee.state }" required="required" autocomplete="off" maxlength="20">
            </div>
            <div class="form-group">
                <label>City</label>
                <input type="text" class="form-control" id="exampleInputEmail1" name="city" value="${ employee.city }" required="required" autocomplete="off" maxlength="20">
            </div>
            <div class="form-group">
                <label>Residential Address</label>
                <input type="text" class="form-control" id="exampleInputEmail1" name="residentialAddress" value="${ employee.address.residentialAddress }" required="required" autocomplete="off" maxlength="100">
            </div>
            <div class="form-group">
                <label>Permanent Address</label>
                <input type="text" class="form-control" id="exampleInputEmail1" name="permanentAddress" value="${ employee.address.permanentAddress }" readonly="readonly">
            </div>
            <div class="form-group">
                <label>Role</label>
                <input type="text" class="form-control" id="exampleInputEmail1" name="role" value="${ employee.role }" readonly="readonly">
            </div>
            <div class="form-group">
                <label>Qualification</label>
                <input type="text" class="form-control" id="exampleInputEmail1" name="qualification" value="${ employee.qualification }" required="required" autocomplete="off" maxlength="50">
            </div>
            <div class="form-group">
                <label>Specialization</label>
                <input type="text" class="form-control" id="exampleInputEmail1" name="specialization" value="${ employee.specialization }" required="required" autocomplete="off" maxlength="50">
            </div>
            <div  style="text-align:center;">
                <button type="submit" class="btn btn-primary">Update Details</button>
            </div>
        </form>
    </div>
</div>
</body>
</html> 
