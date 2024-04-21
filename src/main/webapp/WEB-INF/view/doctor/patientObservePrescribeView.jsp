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
					Personal Info
				</a>
		<%} %>
		
		<% if(l.getRole().equals("doctor")){ %>
			<div class="flex-grow text-xs mt-4">
				<a href="opdQueueD.html" class="text-slate-700 font-semibold"  style="font-size:16px;font-weight:600">
				OPD Queue
				</a>
				<a href="searchPatientView.html" class="text-slate-700 font-semibold"  style="font-size:16px;font-weight:600">
					Search Patient
				</a>
				<a href="viewDopdPatient2.html" class="text-slate-700 font-semibold"  style="font-size:16px;font-weight:600">
				Patient General Info
				</a>
				<a href="patientHistoryList.html" class="text-slate-700 font-semibold"  style="font-size:16px;font-weight:600">
				History
				</a>
				<a href="patientObservePrescribe.html" class="text-slate-700 font-semibold"  style="color:black;font-size:16px;font-weight:600">
					Observations &<br/>
				 Prescription
				</a>
			</div>
		<%} %>
				<div class="p-2 flex flex-col font-medium text-slate-800 rounded-md bg-white border-blue-400 m-2">
					<span><%= l.getUsername() %></span>
					<span><%= l.getId() %></span>
					<!-- <a href="editView.html" class="text-right">
						<span  class="text-violet-900 text-sm no-underline font-medium">EDIT</span>
					</a> -->
				</div>
			</div>
	    </div>
	    
	    <div class="col-sm-12">
	      <!-- display window -->
			<div class="main"><br/><br/>
			<% String pname= (String)session.getAttribute("currentPatientName"); %>
			<h3> <%=pname %>'s Observations and Prescription</h3><br/>
			
			<form action="addDopdPatientCase.html" method="post">
					<div class="card bg-light border-primary mb-3" >
					  <div class="card-header"><h4>Observations</h4>(Only For Doctors)</div>
					  <div class="card-body">
					    <p class="card-text">
								<div class="form-group">
									  <label>Symptoms</label>
									  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red;">*Note- Plz use # to seperate different symptoms.</span>
								      <textarea class="form-control" id="exampleTextarea" rows="5" name="symptoms" placeholder="eg. #fever #headache #body pain"
								      required="required" autocomplete="off" maxlength="200"></textarea>
								 </div>
								 <div class="form-group">
									  <label>Diagnosis</label>
									  <input type="text" class="form-control" id="exampleInputEmail1" name="diagnosis" placeholder="eg. Typhoid"
								      required="required" autocomplete="off" maxlength="100">
						    	</div>
					    </p>
					  </div>
					</div>
						
					<div class="card bg-light border-primary mb-3" >
					  <div class="card-header"><h4>Prescription</h4>(For Patients & Receptionist)</div>
					  <div class="card-body">
					    <p class="card-text">
								<div class="form-group">
									  <label>Medicines and Dosage</label>
									  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red;">*Note- Dosage 1 means Once in a day, 2 means Twice a day, 3 means Thrice a day.
									  <br/>&nbsp;&nbsp;&nbsp;
									  Plz use # to seperate different medicines and @ to specify dose</span>
								      <textarea class="form-control" id="exampleTextarea" rows="5" name="medicinesDose" placeholder="eg. #crocin-500@2 #TusQ-X@3 "
								      required="required" autocomplete="off" maxlength="200"></textarea>
								 </div>
								 <div class="form-group">
									  <label>Do's</label>
									  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red;">*Note- Plz use # to seperate Do's.</span>
								      <input type="text" class="form-control" id="exampleInputEmail1" name="dos" placeholder="eg. #do1 #do2"
								      required="required" autocomplete="off" maxlength="100">
						    	</div>
						    	<div class="form-group">
									  <label>Dont's</label>
									  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red;">*Note- Plz use # to seperate Don'ts.</span>
									  <input type="text" class="form-control" id="exampleInputEmail1" name="donts" placeholder="eg. #dont1 #dont2"
								      required="required" autocomplete="off" maxlength="100">
						    	</div>
						    	<div class="form-group">
									  <label>Investigations</label>
									  <input type="text" class="form-control" id="exampleInputEmail1" name="investigations" value="none" placeholder="eg. Blood test"
								      required="required" autocomplete="off" maxlength="100">
						    	</div>

						    	<div class="form-group">
									  <label>Follow up date</label>
									  <input type="date" class="form-control" id="exampleInputEmail1" name="followupDate" placeholder="Choose followup Date"
									  min="2020-03-14">
					    		</div>
						    	<div class="form-group">
									  <label>Fees</label>
									  <input type="text" class="form-control" id="exampleInputEmail1" name="fees" placeholder="eg. 500"
								      required="required" autocomplete="off" maxlength="20">
						    	</div>
					    </p>
					  </div>
					</div>
			
			 <div style="text-align: center;">
				<button type="submit" class="btn btn-primary">Submit</button>
			 </div>
			</form><br/>
			</div>
		</div>
		
	</div>
	</div>
	
</body>
</html> 
<body>