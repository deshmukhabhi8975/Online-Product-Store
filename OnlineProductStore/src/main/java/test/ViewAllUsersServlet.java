package test;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@SuppressWarnings("serial")
@WebServlet("/viewUsers")

public class ViewAllUsersServlet extends HttpServlet
{
	public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
	{
        HttpSession hs=req.getSession();
		if(hs==null) 
		{
			req.setAttribute("msg", "Session Expired..<br>");
			req.getRequestDispatcher("Msg.jsp").forward(req, res);
		}
		else
		{
			
			ArrayList<UserBean> users=new ViewAllUsersDAO().retrive();
			
			hs.setAttribute("uList", users);
			//System.out.println("jjj");
			System.out.println(users.size());
			//System.out.println("sss");
			req.getRequestDispatcher("ViewAllUser.jsp").forward(req, res);
		}
	}      }
