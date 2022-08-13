import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/logout")
public class Logout extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Cookie[] ck = req.getCookies();
		if(ck!=null){
		for(int i=0;i<ck.length;i++){
			Cookie cookie = ck[i];
			cookie.setMaxAge(0);
			resp.addCookie(cookie);
		}
			
		}
		resp.sendRedirect("index.html");
	}
}
