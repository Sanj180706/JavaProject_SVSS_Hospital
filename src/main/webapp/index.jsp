<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HMS</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400..900;1,400..900&display=swap" rel="stylesheet">
<style>
    body {
        background-image: url('https://img.freepik.com/free-vector/people-walking-sitting-hospital-building-city-clinic-glass-exterior-flat-vector-illustration-medical-help-emergency-architecture-healthcare-concept_74855-10130.jpg'); /* Replace 'https://example.com/your-image.jpg' with your actual image URL */
        background-color: #f5f5f5;
        background-repeat: no-repeat;
        background-size: cover;
        background-position: center;
        text-decoration: none;
        text-align: center;
        display: flex;
        align-items:center;
        justify-content:center;
        height: 100vh;
    }
    .font{
    	font-size: 3rem;
    }
    section {
    	width: 20rem;
    	border-radius: 15px;
        backdrop-filter: blur(50px);
    }
    
    .playfair-display-svss {
  font-family: "Playfair Display", serif;
  font-optical-sizing: auto;
  font-weight: 800;
  font-style: normal;
}

    

</style>
</head>
<body>
    
    <br/><br/><br/>
    <section>
    <span class="display-1 playfair-display-svss">
    	<span class="font" style="color:white;">S</span>
    	<span class="font" style="color:red;">V</span>
    	<span class="font" style="color:red;">S</span>
    	<span class="font" style="color:white;">S</span>
    </span>
    <br/>
    
    
    
    <p style="letter-spacing: 4px;">Healthcare for free for all</p>
    <br/><br/><br/>
    <form action="login.html" method="post">
        <button type="submit" class="btn btn-primary">&nbsp;&nbsp; Login &nbsp;&nbsp;</button>
    </form><br/><br/>
    </section>

</body>
</html>
