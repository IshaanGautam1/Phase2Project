import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/login")
public class Login extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username= req.getParameter("username");
		String password=req.getParameter("password");
		Cookie ck = new Cookie("u_name",username);
		PrintWriter out = resp.getWriter();
		out.println(ck.getValue());
		if(username.equals("admin") && password.equals("admin")) {
			resp.addCookie(ck);
			out.print("cookie added");
			resp.sendRedirect("dashboard.jsp");
		}
		else {
			out.print("Invalid Credentials");
		}
		
	}
}
