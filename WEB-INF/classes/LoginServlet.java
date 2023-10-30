import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        out.println("<html><head><title>Login Servlet</title></head><body>");

        String usernameOrEmail = request.getParameter("userinput").trim();
        String password = request.getParameter("password").trim();

        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/ebooks", "root", "");
            Statement stmt = conn.createStatement();
            ResultSet userData;

            userData = stmt.executeQuery("SELECT username,user_password FROM users WHERE username = '" + usernameOrEmail + "' OR user_email = '" + usernameOrEmail + "';");

            if (userData.next()) {
                if (userData.getString(2).equals(password)) {
                    String username = userData.getString(1);

                    // Create a cookie and set the username as its value
                    Cookie ck = new Cookie("username", username);
                    ck.setMaxAge(60 * 60);  // Cookie will expire in 1 hour
                    response.addCookie(ck);

                    // Display a success message with an alert box and redirect
                    out.println("<script>alert('Login Successful: " + username + "'); window.location.href='index.jsp';</script>");
                }
                else {
                    // Display an alert for an incorrect password
                    out.println("<script>alert('Password Is Invalid'); window.location.href='login.jsp';</script>");
                }
            }
            
            else {
                // Display an alert for username or email not found
                out.println("<script>alert('Username or Email Not Found'); window.location.href='login.jsp';</script>");
            }
        }
        catch (SQLException e) {
            out.print(e.getMessage());
        }

        out.println("</body></html>");
    }
}
