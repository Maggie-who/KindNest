import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
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

@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 10,      // 10MB
    maxRequestSize = 1024 * 1024 * 50    // 50MB
)
@WebServlet("/up_servlet")
public class up_servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            PrintWriter out = response.getWriter();
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/nest", "root", "");

            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String health_status = request.getParameter("health");
            String dia = request.getParameter("diagnose");
            String treat = request.getParameter("treat");
            String check = request.getParameter("check");
            Part filePart = request.getPart("image");

            InputStream is = filePart.getInputStream();
            byte[] imageBytes = is.readAllBytes();

            String query;
            PreparedStatement ps;
            if (filePart.getSize() > 0) {
                // If a new image is uploaded
                query = "UPDATE children SET name=?, image=?, health_status=?, diagnosed_with=?, treatment=?, checkup=? WHERE id=?";
                ps = con.prepareStatement(query);
                ps.setString(1, name);
                ps.setBytes(2, imageBytes);
                ps.setString(3, health_status);
                ps.setString(4, dia);
                ps.setString(5, treat);
                ps.setString(6, check);
                ps.setString(7, id);
            } else {
                // If no new image, skip updating image
                query = "UPDATE children SET name=?, health_status=?, diagnosed_with=?, treatment=?, checkup=? WHERE id=?";
                ps = con.prepareStatement(query);
                ps.setString(1, name);
                ps.setString(2, health_status);
                ps.setString(3, dia);
                ps.setString(4, treat);
                ps.setString(5, check);
                ps.setString(6, id);
            }

            int row = ps.executeUpdate();
            if(row > 0) {
            	RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
            	rd.forward(request, response);

            } else {
                out.println("Updation Failed");
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}
