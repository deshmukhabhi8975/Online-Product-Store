package test;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
@SuppressWarnings("serial")
@WebServlet("/adminLogin")
public class AdminLoginServlet extends HttpServlet
{
protected void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
{
	String uN=req.getParameter("uname");
	String pW=req.getParameter("pword");
	
	AdminBean ab=new AdminLoginDAO().login(uN,pW);
	if(ab==null)
	{
		req.setAttribute("msg","Invalid Login process...<br>");
		req.getRequestDispatcher("Msg.jsp").forward(req, res);
	}
	else
	{
		HttpSession hs=req.getSession();
		hs.setAttribute("abean",ab);
		req.getRequestDispatcher("AdminLoginSuccess.jsp").forward(req, res);
	}
}
}

