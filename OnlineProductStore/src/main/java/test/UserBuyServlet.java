package test;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/buy")

public class UserBuyServlet extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
	{
		HttpSession hs=req.getSession(false);
		if(hs==null)
		{
			req.setAttribute("msg", "session expired..<br>");
			req.getRequestDispatcher("Msg.jsp").forward(req, res);
		}
		else 
		{
			req.getRequestDispatcher("UserBuy.jsp").forward(req, res);
		}
	}


}



