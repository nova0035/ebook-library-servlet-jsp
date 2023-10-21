import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class LogoutServlet extends HttpServlet{
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		response.setContentType("text/html");

		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
		
		Cookie[] ck = request.getCookies();
        if (ck != null) {
            for (Cookie cookie : ck) {
                if (cookie.getName().equals("username")) {
                    cookie.setMaxAge(0);
                    response.addCookie(cookie);
                    break; 
                }
            }
        }
        
        // Display an alert box with the "Logout Successfully" message
        out.println("<html><head><script>alert('Logout Successfully'); window.location.href = 'index.jsp';</script></head></html>");
	}
}