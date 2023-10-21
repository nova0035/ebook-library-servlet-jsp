import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class SignUpServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        out.println("<html><head><title>Sign Up Servlet</title></head><body>");

        String username = request.getParameter("username").trim();
        String user_email = request.getParameter("email").trim();
        String user_password = request.getParameter("password").trim();

        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/ebooks", "root", "");
            Statement stmt = conn.createStatement();
            ResultSet userdata;

            userdata = stmt.executeQuery("SELECT * FROM users WHERE user_email = '" + user_email + "';");

            if (userdata.next()) {
                out.println("<script>alert('Email Already In Use'); window.location.href='signup.jsp';</script>");
            }
            else{
                userdata = stmt.executeQuery("SELECT * FROM users WHERE username = '" + username + "';");

                if (userdata.next()) {
                    out.println("<script>alert('Username Already In Use'); window.location.href='signup.jsp';</script>");
                }
                else {
                    PreparedStatement pstmt = conn.prepareStatement("INSERT INTO users VALUES (?,?,?);");
                    pstmt.setString(1, username);
                    pstmt.setString(2, user_email);
                    pstmt.setString(3, user_password);

                    int reply = pstmt.executeUpdate();

                    if (reply == 1) {
                       
                        out.println("<script>alert('Registered Successfully'); window.location.href='index.jsp';</script>");
                    }
                    else {
                        out.println("<script>alert('Some Problem Occurred While Registering, Try Again Later'); window.location.href='index.jsp';</script>");
                    }
                }
            }
        }
        catch (Exception e) {
            // Log the error instead of printing it to the user
            e.printStackTrace();
            out.println("<script>alert('An error occurred while processing your request'); window.location.href='index.jsp';</script>");
        }
        out.println("</body></html>");
    }
}
