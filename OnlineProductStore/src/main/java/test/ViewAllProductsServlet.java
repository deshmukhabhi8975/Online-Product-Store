package test;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
@SuppressWarnings("serial")
@WebServlet("/view1")
public class ViewAllProductsServlet extends HttpServlet
{
    protected void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
    	HttpSession hs=req.getSession(false);
    	if(hs==null)
    	{
    		req.setAttribute("msg","Session Expired...<br>");
    		req.getRequestDispatcher("Msg.jsp").forward(req, res);
    	}
    	else
    	{
    		ArrayList<ProductBean>al=new ViewAllProductsDAO().retrieve();
    		hs.setAttribute("alist",al);
    		req.getRequestDispatcher("ViewAllProducts.jsp").forward(req, res);
    	}
    }
}
