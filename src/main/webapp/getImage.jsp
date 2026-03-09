<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>image conversion</title>
</head>
<body>
<%@ page import="java.io.*, java.sql.*" %>
<%
    String name = request.getParameter("name"); // Using name instead of ID

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/nest", "root", "");

        String query = "SELECT image FROM children WHERE name=?";
        ps = con.prepareStatement(query);
        ps.setString(1, name);
        rs = ps.executeQuery();

        if (rs.next()) {
            byte[] imgData = rs.getBytes("image");
            response.setContentType("image/jpeg");
            OutputStream o = response.getOutputStream();
            o.write(imgData);
            o.flush();
            o.close();
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (con != null) con.close();
    }
%>

</body>
</html>