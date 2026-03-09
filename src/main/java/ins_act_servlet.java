import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/insact")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, 
    maxFileSize = 1024 * 1024 * 10,      
    maxRequestSize = 1024 * 1024 * 50    
)
public class ins_act_servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        Connection con = null;
        PreparedStatement ps = null;
        
        try {
            // Database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/nest", "root", "");

            // Retrieve form data
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            String date = request.getParameter("date");

            // Retrieve file data
            Part filePart = request.getPart("image");
            InputStream is = filePart.getInputStream();
            byte[] imageBytes = is.readAllBytes();

            // Debugging Output
            out.println("Title: " + title + "<br>");
            out.println("Description: " + description + "<br>");
            out.println("Date: " + date + "<br>");
            out.println("Image size: " + imageBytes.length + " bytes<br>");
            out.println("Received Parameters: " + request.getParameterMap().keySet() + "<br>");
         

            // Insert into database
            String sql = "INSERT INTO acties (title, description, date, image) VALUES (?, ?, ?, ?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, description);
            ps.setString(3, date);
            ps.setBytes(4, imageBytes);

            int row = ps.executeUpdate();
            if (row > 0) {
                out.println("Insertion Successful!<br>");
            } else {
                out.println("Insertion Failed");
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            // Close resources
            try { if (ps != null) ps.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (con != null) con.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }
}
