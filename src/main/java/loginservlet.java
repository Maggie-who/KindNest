

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
import java.sql.ResultSet;
import java.sql.SQLException;


@WebServlet("/loginservlet")
public class loginservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		   try {
			   PrintWriter out = response.getWriter();
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/nest", "root", "");
	            String name = request.getParameter("name");
	            String pass = request.getParameter("pass");
	   
	            PreparedStatement ps = con.prepareStatement("select uname from login where uname=? and password=?");
	            ps.setString(1, name);
	            ps.setString(2, pass);
	            ResultSet rs = ps.executeQuery();
	            System.out.println(ps);
	            if(rs.next()) {
	            	if(name.equals("Adminonest") && pass.equals("7890")) {
	            		RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
		            	rd.forward(request, response);
	            	}
	            	else {
	            	RequestDispatcher rd = request.getRequestDispatcher("User.jsp");
	            	rd.forward(request, response);}
	            
	            }
	            else {
	            	
	            		   out.println("Login failed");
	            		   out.println("You entered: " + name + " and " + pass);
	            		

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
