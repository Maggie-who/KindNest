<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>activities</title>
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
    </style>
</head>

<body >
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
    <section id="header">
        <a href="#"><div class="logo"><img src="vdo/logo/1.png" alt="Logo" height="110" width="110"></div></a>
         
        <div>
           <ul id="navbar">
               <li><a class="active" href="activities.jsp">Activities</a></li>
               <li><a href="http://localhost:8080/login/udoante.jsp">Donate</a></li>
               <li><a href="http://localhost:8080/login/uddetails.jsp">Kindhearts</a></li>
               </a></li>
               
            </ul>
            
        </div>
     </section>
 <section id="" class="section-p1">
        
        <div class="activity-container">
        <% String url = "jdbc:mysql://localhost:3306/nest";
        String username = "root";
        String password = "";

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, username, password);

            String select_query = "SELECT * FROM acties ORDER BY RAND() ";
            ps = con.prepareStatement(select_query);
            rs = ps.executeQuery();

            while (rs.next()) {
                String title = rs.getString("title");
                String des = rs.getString("description");
                String image = rs.getString("image");
                String dayt = rs.getString("date");
                 %>
        <div class="activity-box" >
        
       <img src='getImage.jsp?name=<%= rs.getString("title") %>' alt='<%= rs.getString("title") %>'>
        <div class="descri">
            <h5><%= title %></h5>
            <h6><%= des%></h6>
            <h4><%= dayt %></h4>
        </div>
        
   
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

        
    <div class="activity-box" >
        <img src="acties/act4.png" alt="">
        <div class="descri">
            <h5>Children's Day Special</h5>
            <h6>On this joyful Children's Day, the kids had a wonderful time playing with colorful musical instruments, filling the room with laughter and cheerful melodies. These instruments were generously donated by Mr. Karthick, bringing smiles and excitement to each child. Watching them explore music and create their own little tunes was truly heartwarming. A big thank you to Mr. Karthick for spreading happiness and making this day extra special for the kids!</h6>
            <h4>April 15, 2018</h4>
        </div>
        
   
    </div> 
     <div class="activity-box" >
        <img src="acties/act5.png" alt="">
        <div class="descri">
            <h5>A Day of Learning and Laughter</h5>
            <h6>

The room was filled with eager faces and curious minds as the children gathered for their evening study session. With colorful books in hand and chalkboards on their laps, they dived deep into the world of letters and numbers. Some were learning the alphabet, others were solving sums, but all were united by their love for learning. The air echoed with giggles, little discussions, and the occasional hum of a nursery rhyme. Despite the modest space, their dreams were vast. Every child here holds the hope of a brighter tomorrow — and today, they took one step closer to it. </h6>
            <h4>April 15, 2018</h4>
        </div>
       
   
    </div> 
    <div class="activity-box" >
        <img src="acties/act6.png" alt="">
        <div class="descri">
            <h5>Happy Fun-Filled Event</h5>
            <h6>The room is alive with joy as the children burst into laughter, their eyes wide with excitement. Some of them lean towards each other, giggling, while others clap and cheer with boundless energy. One girl in a red shirt stands in the front, smiling as she watches her friends enjoy the moment. It feels like they have found a brief escape from their routine, a moment where they can be simply kids — carefree, happy, and surrounded by friends who feel like family.</h6>
            <h4>April 15, 2018</h4>
        </div>
        
   
    </div> 
    <div class="activity-box" >
        <img src="acties/act7.png" alt="">
        <div class="descri">
            <h5>Gift Distribution by Saahem Team</h5>
            <h6>The porch is filled with vibrant energy as children sit on the floor, sketching and drawing with immense focus. Volunteers, dressed in light brown uniforms, stand nearby with warm smiles, handing over gifts and drawing kits to the children. One little girl in a green dress eagerly reaches out to receive her gift, her eyes sparkling with joy. The volunteers, moved by the pure happiness of the children, can’t help but feel a deep sense of purpose. It's not just about giving away gifts — it’s about creating a memory these kids will cherish.</h6>
            <h4>April 15, 2018</h4>
        </div>
       
   
    </div> 
    <div class="activity-box" >
        <img src="acties/act8.png" alt="">
        <div class="descri">
            <h5>Children with a Staff Member</h5>
            <h6>The children gather close, shoulder to shoulder, their faces gleaming with shy yet excited smiles. Wearing colorful clothes, they stand proudly for a group photo in their cozy home. A man, possibly a staff member, stands behind them, smiling like a proud guardian who has seen these kids grow. Some kids giggle softly, nudging their friends, while the younger ones stand still, confused by the sudden seriousness of a group photo. Yet, deep down, they all share one thing in common — the warmth of a family built through love and care.

</h6>
            <h4>April 15, 2018</h4>
        </div>
       
    </div> 
    <div class="activity-box" >
        <img src="acties/act1.png" alt="">
        <div class="descri">
            <h5>The Playground Rush</h5>
            <h6>The ground trembles with the footsteps of eager children playing different games. Some are dashing across the field, their voices bursting with excitement, while others are sitting and giggling over small conversations. The shade of the large tree offers a brief resting spot, but no one stays still for long. In this space, there are no worries — only the thrill of running, the joy of friendship, and the sweet exhaustion that comes from playing to their heart’s content.</h6>
            <h4>April 15, 2018</h4>
        </div>
        
   
    </div> 
    <div class="activity-box" >
        <img src="acties/act2.png" alt="">
        <div class="descri">
            <h5>Marbles and Memories</h5>
            <h6>Two kids sit on the warm ground, completely engrossed in a game of marbles. One carefully aims, hoping to strike a marble out of the circle, while the other watches with quiet anticipation. Their hands are dusty, but their spirits are high. This simple game is not just about winning marbles; it’s about the joy of small victories and shared laughter. The circle drawn on the ground holds not just marbles but moments they will cherish forever.</h6>
            <h4>April 15, 2018</h4>
        </div>
        
   
    </div> 
    <div class="activity-box" >
        <img src="acties/act9.png" alt="">
        <div class="descri">
            <h5>Elder People Visit from Yercaud</h5>
            <h6>It’s a beautiful clash of generations as two elderly women sit comfortably, their laps and arms filled with children. One toddler clutches a toy car, showing it off to another child, while a young girl leans in close to one of the grandmothers, seeking comfort in her warmth. The grandmothers’ faces, lined with age and wisdom, light up with soft smiles as they watch the children chatter away. The room feels less like an institution and more like a home, where love flows without condition and the children find the warmth of family, even if it’s not by blood.</h6>
            <h4>April 15, 2018</h4>
        </div>
        
   
    </div> 
</div>

</section>
</body>

</html> 