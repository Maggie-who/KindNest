<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>KindNest Donation Gateway</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <link rel="stylesheet" href="style.css">
    <style>.d-flex button[type="submit"]
        {
        background-color: #000000;
        color: white;
        padding: 10px 20px; 
        border: none; 
        border-radius: 6px;
        cursor: pointer;
        font-size: 16px;
    }
    
    
    .d-flex button[type="submit"]:hover {
        background-color: #fcd6d6;
        color: #000000;
    }
    .d-flex input[type="search"] {
            color: black !important; /* Ensure text color is black */
            background-color: white !important; /* Ensure background is white */
            padding: 10px 20px; 
            border: none;
            border-radius: 6px; 
            cursor: pointer;
            font-size: 16px;
        }
    .logo{
    z-index: 2;
    
    position: absolute; 
    top: 40%;          
    left: 10%;         
    transform: translate(-50%, -50%); 
    
}
        .donateform {
            font-family: Arial, sans-serif;
            text-align: center;
            margin-top: 100px;
        }
        input[type='text'], input[type='number'] {
            padding: 10px;
            width: 200px;
            margin: 5px;
        }
        button {
            padding: 10px 20px;
            background-color:  rgb(128, 64, 64);
            color: white;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background-color: #631414;
        }
    </style>
</head>
<body>
<section id="header">
        <a href="#"><div class="logo"><img src="vdo/logo/1.png" alt="Logo" height="110" width="110"></div></a>
        
        <div>
           <ul id="navbar">
               <li><a  href="admin.jsp">Addchild</a></li>
               <li><a  href="http://localhost:8080/login/activities.jsp">Add activity</a></li>
               <li><a  href="http://localhost:8080/login/medical.jsp">Medical Records</a></li>
               <li><a class="active" href="http://localhost:8080/login/doante.jsp">Donate</a></li>
               <li><a href="http://localhost:8080/login/ddetails.jsp">Donation details</a></li>
               </a></li>
               
            </ul>
            
        </div>
     </section>
     <section class="donateform">
<h2>Welcome to KindNest Donation Gateway</h2><br>
<form action="donateservlet" method="post">
    <input type="text" name="name" placeholder="Enter your name" required><br>
    <input type="number" name="amount" placeholder="Enter donation amount" required><br>
       <input type="date" name="date" id=""  placeholder="Enter date" autocomplete="off" >
    <br><br>
    
    <button type="submit">Donate Now</button>
</form>
</section>
</body>
</html>
