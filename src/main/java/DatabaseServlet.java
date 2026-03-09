import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DatabaseServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            // Load JDBC-ODBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/nest", "root","");

            // Create SQL statement
            stmt = conn.createStatement();

            // Execute query
            rs = stmt.executeQuery("SELECT * FROM test");

            // Process result set
            while (rs.next()) {
                out.println("\t" + rs.getObject(1).toString());
                out.println(rs.getObject(2).toString());
                out.println("<br>");
            }

        } catch (SQLException e) {
            out.println(e.getNextException());
        } catch (ClassNotFoundException e) {
            out.println(e.getException());
        } finally {
            // Close resources
            try {
                if (rs != null) { rs.close(); rs = null; }
                if (stmt != null) { stmt.close(); stmt = null; }
                if (conn != null) { conn.close(); conn = null; }
            } catch (Exception e) {
                out.close();
            }
        }
    }
}
