

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.annotation.MultipartConfig;

@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 10,      // 10MB
    maxRequestSize = 1024 * 1024 * 50    // 50MB
)
@WebServlet("/ins_servlet")
public class ins_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 try {
			   PrintWriter out = response.getWriter();
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/nest", "root", "");
	            String name = request.getParameter("name");
				String place = request.getParameter("place");
				String key = request.getParameter("keyword");
				String dob = request.getParameter("dob");
				String gender = request.getParameter("gender");
				String health_status = request.getParameter("health");
				String dia = request.getParameter("diagnose");
				String treat = request.getParameter("treat");
				String check = request.getParameter("check");
				Part filePart = request.getPart("image");
				InputStream is = filePart.getInputStream();
				byte[] imageBytes = is.readAllBytes();
				
				// Insert into database
				PreparedStatement ps = con.prepareStatement(
				    "INSERT INTO children (name, place, dob, image, gender, health_status, diagnosed_with, treatment, checkup, keyword) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
				ps.setString(1, name);
				ps.setString(2, place);
				ps.setString(3, dob);
				ps.setBytes(4, imageBytes);
				ps.setString(5, gender);
				ps.setString(6, health_status);
				ps.setString(7, dia);
				ps.setString(8, treat);
				ps.setString(9, check);
				ps.setString(10, key);
				
				
				int row = ps.executeUpdate();
				if(row > 0) {
					out.println("Registration Successful!<br>");
					
				} else {
					out.println(" Registration Failed");
				}



		   } 
		   catch (ClassNotFoundException e) {
	            e.printStackTrace();
	           
	        }
		   catch (SQLException e) {
	            e.printStackTrace();
	           
	        }
	}

}
