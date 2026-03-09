

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


@WebServlet("/registerrah")
public class uregisterservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 try {
			   PrintWriter out = response.getWriter();
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/nest", "root", "");
	            String name = request.getParameter("name");
	            String pass = request.getParameter("pass");
	   
	            PreparedStatement ps = con.prepareStatement("insert into login (uname, password) values (?, ?)");
	            ps.setString(1, name);
	            ps.setString(2, pass);
	            int rowsAffected = ps.executeUpdate();

	            
	            if(rowsAffected > 0) {
	                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
	                rd.forward(request, response);
	            } else {
	                out.println("Registration failed");
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
