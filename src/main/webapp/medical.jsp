 <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>medical info</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <link rel="stylesheet" href="style.css">
    <style>
        .d-flex button[type="submit"]
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
    
       #coco {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            padding: 20px;
        }
        
    </style>
</head>
<body>

<section id="header">
        <a href="#"><div class="logo"><img src="vdo/logo/1.png" alt="Logo" height="110" width="110"></div></a>
         <form class="d-flex" action="search.jsp" method="post">
            <input type="search" placeholder="Search" aria-label="Search" name="search_data">
            <button class="normal" type="Submit" value="search" name="surf_web" id="surf_web">Search</button>
        </form>
        
        
       <div>
           <ul id="navbar">
               <li><a  href="http://localhost:8080/login/admin.jsp">Addchild</a></li>
               <li><a  href="activities.jsp">Add activity</a></li>
               <li><a class="active" href="http://localhost:8080/login/medical.jsp">Medical Records</a></li>
               <li><a href="http://localhost:8080/login/doante.jsp">Donate</a></li>
               <li><a href="http://localhost:8080/login/ddetails.jsp">Donation details</a></li>
               </a></li>
               
            </ul>
            
        </div>
     </section>
     <%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
     
     <section id="coco">
     <%
    // Database connection
    String url = "jdbc:mysql://localhost:3306/nest";
    String username = "root";
    String password = "";

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(url, username, password);

        String select_query = "SELECT * FROM children ORDER BY RAND() ";
        ps = con.prepareStatement(select_query);
        rs = ps.executeQuery();

        while (rs.next()) {
            String name = rs.getString("name");
            String hs = rs.getString("health_status");
            String image = rs.getString("image");
            String place = rs.getString("place");
            String dia = rs.getString("diagnosed_with");
            String age= rs.getString("age");
            String treat = rs.getString("treatment");
            String check = rs.getString("checkup");
%>
<div class="flashcard">
    <div class="card-inner">
        <div class="card-front">
            <img src='getImage.jsp?name=<%= rs.getString("name") %>' alt='<%= rs.getString("name") %>'>
            <h3> <%= name %></h3>
            <p>Age: <%= age %></p>
            <p>Place found: <%= place %></p>
        </div>
        <div class="card-back">
            <h4>Medical Records</h4>
            <p>Health issues : <%= hs %></p>
            <p>Diagnosed with: <%= dia %></p>
            <p>Treatment: <%= treat %></p>
            <p>Last Checkup: <%= check %></p>
        </div>
    </div>
</div>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p style='color:red;'>" + e.getMessage() + "</p>");

    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (con != null) con.close();
    }
%><!--  
<div class="flashcard">
    <div class="card-inner">
        <div class="card-front">
            <img src="children/kid4.jpg" alt="Child">
            <h3>Nisha</h3>
            <p>Age: 6</p>
            <p>Location: Salem</p>
        </div>
        <div class="card-back">
            <h4>Medical Records</h4>
            <p>Blood Group: A+</p>
            <p>Health Issues: Asthma</p>
            <p>Last Checkup: Feb 20, 2025</p>
        </div>
    </div>
</div>
<div class="flashcard">
    <div class="card-inner">
        <div class="card-front">
            <img src="children/kid3.jpg" alt="Child">
            <h3>Aanandha</h3>
            <p>Age: 7</p>
            <p>Location: Madurai</p>
        </div>
        <div class="card-back">
            <h4>Medical Records</h4>
            <p>Blood Group: O+</p>
            <p>Health Issues: None</p>
            <p>Last Checkup: Jan 15, 2025</p>
        </div>
    </div>
</div>

<div class="flashcard">
    <div class="card-inner">
        <div class="card-front">
            <img src="children/kid4.jpg" alt="Child">
            <h3>Nisha</h3>
            <p>Age: 6</p>
            <p>Location: Salem</p>
        </div>
        <div class="card-back">
            <h4>Medical Records</h4>
            <p>Blood Group: A+</p>
            <p>Health Issues: Asthma</p>
            <p>Last Checkup: Feb 20, 2025</p>
        </div>
    </div>
</div>

<div class="flashcard">
    <div class="card-inner">
        <div class="card-front">
            <img src="children/kid3.jpg" alt="Child">
            <h3>Aanandha</h3>
            <p>Age: 7</p>
            <p>Location: Madurai</p>
        </div>
        <div class="card-back">
            <h4>Medical Records</h4>
            <p>Blood Group: O+</p>
            <p>Health Issues: None</p>
            <p>Last Checkup: Jan 15, 2025</p>
        </div>
    </div>
</div>

<div class="flashcard">
    <div class="card-inner">
        <div class="card-front">
            <img src="children/kid4.jpg" alt="Child">
            <h3>Nisha</h3>
            <p>Age: 6</p>
            <p>Location: Salem</p>
        </div>
        <div class="card-back">
            <h4>Medical Records</h4>
            <p>Blood Group: A+</p>
            <p>Health Issues: Asthma</p>
            <p>Last Checkup: Feb 20, 2025</p>
        </div>
    </div>
</div>
<div class="flashcard">
    <div class="card-inner">
        <div class="card-front">
            <img src="children/kid3.jpg" alt="Child">
            <h3>Aanandha</h3>
            <p>Age: 7</p>
            <p>Location: Madurai</p>
        </div>
        <div class="card-back">
            <h4>Medical Records</h4>
            <p>Blood Group: O+</p>
            <p>Health Issues: None</p>
            <p>Last Checkup: Jan 15, 2025</p>
        </div>
    </div>
</div>

<div class="flashcard">
    <div class="card-inner">
        <div class="card-front">
            <img src="children/kid4.jpg" alt="Child">
            <h3>Nisha</h3>
            <p>Age: 6</p>
            <p>Location: Salem</p>
        </div>
        <div class="card-back">
            <h4>Medical Records</h4>
            <p>Blood Group: A+</p>
            <p>Health Issues: Asthma</p>
            <p>Last Checkup: Feb 20, 2025</p>
        </div>
    </div>
</div>
<div class="flashcard">
    <div class="card-inner">
        <div class="card-front">
            <img src="children/kid3.jpg" alt="Child">
            <h3>Aanandha</h3>
            <p>Age: 7</p>
            <p>Location: Madurai</p>
        </div>
        <div class="card-back">
            <h4>Medical Records</h4>
            <p>Blood Group: O+</p>
            <p>Health Issues: None</p>
            <p>Last Checkup: Jan 15, 2025</p>
        </div>
    </div>
</div>

<div class="flashcard">
    <div class="card-inner">
        <div class="card-front">
            <img src="children/kid4.jpg" alt="Child">
            <h3>Nisha</h3>
            <p>Age: 6</p>
            <p>Location: Salem</p>
        </div>
        <div class="card-back">
            <h4>Medical Records</h4>
            <p>Blood Group: A+</p>
            <p>Health Issues: Asthma</p>
            <p>Last Checkup: Feb 20, 2025</p>
        </div>
    </div>
</div>-->
</section>
</body>

</html> 