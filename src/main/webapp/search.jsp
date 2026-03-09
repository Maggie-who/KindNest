<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>medical info</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <link rel="stylesheet" href="style.css">

<title>search</title>
<style>
.search-results {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-around; /* Distribute evenly */
    gap: 20px; /* Adds spacing */
}
</style>
</head>
<body>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    String searchKeyword = request.getParameter("search_data"); // Get search input
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    if (searchKeyword != null && !searchKeyword.trim().isEmpty()) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Load MySQL Driver
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/nest", "root", ""); // DB connection

            // REGEXP pattern to match whole words only
            String query = "SELECT * FROM children WHERE keyword REGEXP ?";
            ps = con.prepareStatement(query);
            ps.setString(1, "\\b" + searchKeyword + "\\b"); // Match whole word
            rs = ps.executeQuery();
%>
<h2 >Search Results for <%= searchKeyword %></h2>
<!-- Check if results exist -->
<div class="search-results" >
    <% boolean hasResults = false; %>
    <% while (rs.next()) { hasResults = true; %>
        <div class="flashcard">
            <div class="card-inner">
                <div class="card-front">
                    <img src='getImage.jsp?name=<%= rs.getString("name") %>' alt='<%= rs.getString("name") %>'>
                    <h3> <%= rs.getString("name") %></h3>
                    <p>Age: <%= rs.getString("age") %></p>
                    <p>Place found: <%= rs.getString("place") %></p>
                </div>
                <div class="card-back">
                    <h4>Medical Records</h4>
                    <p>Health issues: <%= rs.getString("health_status") %></p>
                    <p>Diagnosed with: <%= rs.getString("diagnosed_with") %></p>
                    <p>Treatment: <%= rs.getString("treatment") %></p>
                    <p>Last Checkup: <%= rs.getString("checkup") %></p>
                </div>
            </div>
        </div>
  <% } %>

    <% if (!hasResults) { %>
        <h3>No records found for "<%= searchKeyword %>"</h3>
    <% } %>
</div>

<%
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        }
    }
%>
</body>
</html>