

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.LocalTime;

@WebServlet("/donateservlet")
public class donateservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  try {
			   PrintWriter out = response.getWriter();
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/nest", "root", "");
	            String name = request.getParameter("name");
	            String amt = request.getParameter("amount");
	            String date = request.getParameter("date");
	            String key = name;
	            LocalDateTime currentTime = LocalDateTime.now();  // This will get the current Date + Time
	            String dateTime = date + "  " + LocalTime.now().toString().substring(0, 8); 
	            PreparedStatement ps = con.prepareStatement("insert into donation (name, amount, keyword, dayt) values (?, ?, ?, ?)");
	            ps.setString(1, name);
	            ps.setString(2, amt);
	            ps.setString(3, key);
	            ps.setString(4, dateTime);
	            int rowsAffected = ps.executeUpdate();
	            if(rowsAffected > 0) {
	            	out.println("Thank you for your kindness");
	            } else {
	                out.println("Looks like there was an error, try again later");
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
