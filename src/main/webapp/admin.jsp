
    <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
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
        background-color: rgb(192, 192, 192);
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
    </style>
</head>

<body >

    <section id="header">
        <a href="#"><div class="logo"><img src="vdo/logo/1.png" alt="Logo" height="110" width="110"></div></a>
        <form class="d-flex" action="search.jsp" method="post">
            <input type="search" placeholder="Search" aria-label="Search" name="search_data">
            <button class="normal" type="Submit" value="search" name="surf_web" id="surf_web">Search</button>
        </form>
        <div>
           <ul id="navbar">
               <li><a class="active" href="admin.jsp">Addchild</a></li>
               <li><a href="http://localhost:8080/login/activities.jsp">Add activity</a></li>
               <li><a href="http://localhost:8080/login/medical.jsp">Medical Records</a></li>
               <li><a href="http://localhost:8080/login/doante.jsp">Donate</a></li>
               <li><a href="http://localhost:8080/login/ddetails.jsp">Donation details</a></li>
               </a></li>
               
            </ul>
            
        </div>
        
    </section>
    <%@ page import="java.sql.*" %>
<div class="count">
    <h3>No. of kids : 
    <%
        int count = 0;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/nest", "root", "");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT COUNT(*) FROM children");
            if(rs.next()) {
                count = rs.getInt(1);
            }
            con.close();
        } catch(Exception e) {
            e.printStackTrace();
        }
    %>
    <%= count %>
    </h3>
     
    <div style="display: flex; justify-content: flex-end; align-items: center;">
    <a href="update_image.jsp" style="color: white; text-decoration: none; margin-right: 20px;">
        update
    </a>
    <a href="ins_child.jsp" style="color: white; text-decoration: none;">
        <i class="far fa-plus-square cart"></i>
    </a>
</div>


    
</div>
 <%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
    <section id="Nest" class="section-p1">
        
        <div class="procont">
      



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

        String select_query = "SELECT * FROM children ORDER BY RAND() LIMIT 0,16";
        ps = con.prepareStatement(select_query);
        rs = ps.executeQuery();

        while (rs.next()) {
            String name = rs.getString("name");
            String gender = rs.getString("gender");
            String image = rs.getString("image");
            String place = rs.getString("place");
            String dob = rs.getString("dob");
            String age= rs.getString("age");
%>
            <!-- Product Card -->
             <div class="pro" >
               <img src='getImage.jsp?name=<%= rs.getString("name") %>' alt='<%= rs.getString("name") %>'>

                <div class='descri'>
                    <h5><%= name %></h5>
                    <h6><%= gender %></h6>
                    <p style=" color: #794647;margin: 5px 0;  /* Reduce vertical spacing */
    padding: 0;"><%= place %></p>
                    <h4><%= dob %> | <b>Age:</b> <%= age %> </h4>
                    </div>
                <a href="#"><i class="fas fa-star cart"></i></a>
        </div>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p style='color:red;'>Something went wrong! Please try again.</p>");
    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (con != null) con.close();
    }
%>
    </div>
</section>


        
   <!--   <div class="pro" >
        <img src="children/kid1.jpg" alt="">
        <div class="descri">
            <h5>Sarvesh</h5>
            <h6>Coimbatore, Gandhipuram</h6>
            <h4>April 15, 2018</h4>
        </div>
        <div>
            <a href="#"><i class="fas fa-star cart"></i></a>
        </div>
   
    </div> 
    <div class="pro" >
        <img src="children/kid2.png" alt="">
        <div class="descri">
            <h5>Aanandha</h5>
            <h6>Madurai, Teppakulam</h6>
            <h4>September 9, 2017</h4>
        </div>
        <div>
            <a href="#"><i class="fas fa-star cart"></i></a>
        </div>
   
    </div>

    <div class="pro" >
        <img src="children/kid3.jpg" alt="">
        <div class="descri">
            <h5>Nisha</h5>
            <h6>Salem, Hasthampatti</h6>
            <h4>June 12, 2018</h4>
        </div>
        <div>
            <a href="#"><i class="fas fa-star cart"></i></a>
        </div>
   
    </div>
    <div class="pro" >
        <img src="children/kid4.jpg" alt="">
        <div class="descri">
            <h5>Rahul</h5>
            <h6>Tiruchirappalli, Srirangam </h6>
            <h4>November 30, 2015</h4>
        </div>
        <div>
            <a href="#"><i class="fas fa-star cart"></i></a>
        </div>
   
    </div>
    <div class="pro" >
        <img src="children/kid5.png" alt="">
        <div class="descri">
            <h5>Yusuf</h5>
            <h6>Erode, Surampatti</h6>
            <h4> February 23, 2016</h4>
        </div>
        <div>
            <a href="#"><i class="fas fa-star cart"></i></a>
        </div>
   
    </div>
    <div class="pro" >
        <img src="children/kid6.jpg" alt="">
        <div class="descri">
            <h5>Yusuf</h5>
            <h6>Tirunelveli, Palayamkottai</h6>
            <h4>9 years old</h4>
        </div>
        <div>
            <a href="#"><i class="fas fa-star cart"></i></a>
        </div>
   
    </div>
    <div class="pro" >
        <img src="children/kid14.png" alt="">
        <div class="descri">
            <h5>Yusuf</h5>
            <h6>Thanjavur, Punnainallur</h6>
            <h4>9 years old</h4>
        </div>
        <div>
            <a href="#"><i class="fas fa-star cart"></i></a>
        </div>
   
    </div>
    <div class="pro" >
        <img src="children/kid8.png" alt="">
        <div class="descri">
            <h5>Yusuf</h5>
            <h6>Tiruvannamalai, Girivalam Path</h6>
            <h4>9 years old</h4>
        </div>
        <div>
            <a href="#"><i class="fas fa-star cart"></i></a>
        </div>
   
    </div>
    <div class="pro" >
        <img src="children/kid9.png" alt="">
        <div class="descri">
            <h5>Yusuf</h5>
            <h6>Kanchipuram, Periya Kanchipuram</h6>
            <h4>9 years old</h4>
        </div>
        <div>
            <a href="#"><i class="fas fa-star cart"></i></a>
        </div>
   
    </div>
    <div class="pro" >
        <img src="children/kid10.png" alt="">
        <div class="descri">
            <h5>Yusuf</h5>
            <h6>Tuticorin, Muthiahpuram</h6>
            <h4>9 years old</h4>
        </div>
        <div>
            <a href="#"><i class="fas fa-star cart"></i></a>
        </div>
   
    </div>
    <div class="pro" >
        <img src="children/kid11.png" alt="">
        <div class="descri">
            <h5>Yusuf</h5>
            <h6>Tirichy, Srirangam</h6>
            <h4>9 years old</h4>
        </div>
        <div>
            <a href="#"><i class="fas fa-star cart"></i></a>
        </div>
   
    </div>
    <div class="pro" >
        <img src="children/kid12.png" alt="">
        <div class="descri">
            <h5>Yusuf</h5>
            <h6>Chennai, Perambur</h6>
            <h4>9 years old</h4>
        </div>
        <div>
            <a href="#"><i class="fas fa-star cart"></i></a>
        </div>
   
    </div>
    <div class="pro" >
        <img src="children/kid13.png" alt="">
        <div class="descri">
            <h5>Yusuf</h5>
            <h6>Chennai, Choolaimedu</h6>
            <h4>9 years old</h4>
        </div>
        <div>
            <a href="#"><i class="fas fa-star cart"></i></a>
        </div>
   
    </div>
    
</div>-->

</section>
    <!--<section id="product1" class="section-p1">
        <div class="procont">
            <?php
            $select_query = "SELECT * FROM products ORDER BY rand() limit 0,16";
            $result_query = mysqli_query($con, $select_query);
    
            while ($row = mysqli_fetch_assoc($result_query)) {
                $product_id = $row['product_id'];
                $product_title = $row['product_title'];
                $product_des = $row['product_des'];
                $pproduct_keyword = $row['product_keyword'];
                $categories_title = $row['categories_title'];
                $product_image = $row['product_image'];
                $product_price = $row['product_price'];
                echo "<div class='pro'>
                        <img src='images/Products/$product_image' alt='$product_title'>
                        <div class='descri'>
                            <h5>$product_title</h5>
                            <p>$product_des</p>
                            <div class='rate'>
                                <i class='fas fa-star'></i>
                                <i class='fas fa-star'></i>
                                <i class='fas fa-star'></i>
                                <i class='fas fa-star'></i>
                                <i class='fas fa-star'></i>
                            </div>
                            <h4>$product_price ₹</h4>
                        </div>
                        <a href='start.php?add_to_cart=$product_id'><i class='fas fa-shopping-cart cart'></i></a>
                    </div>";
            }
            
            ?> </div>
        </div>
    </section>-->
</body>

</html> 