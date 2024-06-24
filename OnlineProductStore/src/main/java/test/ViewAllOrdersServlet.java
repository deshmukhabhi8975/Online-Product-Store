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
@WebServlet("/vieworders")
public class ViewAllOrdersServlet extends HttpServlet
{
	
	@Override
	public void doGet(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException
	{
		HttpSession hs=req.getSession();
		if(hs==null) 
		{
			req.setAttribute("msg", "Session Expired..<br>");
			req.getRequestDispatcher("Msg.jsp").forward(req, res);
		}
		else
		{
			ArrayList<OrdersDetailsInfoBean> orders=new ViewAllOrdersDAO().retrive();
			hs.setAttribute("ordersList", orders);
			req.getRequestDispatcher("ViewOrders.jsp").forward(req, res);
		}
	}
}


