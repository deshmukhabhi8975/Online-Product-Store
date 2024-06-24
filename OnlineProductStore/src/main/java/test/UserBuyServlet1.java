package test;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/buyproduct")
public class UserBuyServlet1 extends HttpServlet
{
	protected void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
	{
		HttpSession hs=req.getSession(false);
		if(hs==null) 
		{
			req.setAttribute("msg","Session expired..<br>");
			req.getRequestDispatcher("Msg.jsp").forward(req, res);
		}
		else
		{
			req.getRequestDispatcher("BuyProduct.jsp").forward(req, res);
			
		}
	}
}

