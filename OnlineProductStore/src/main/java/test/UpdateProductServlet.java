package test;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/update")
@SuppressWarnings("serial")
public class UpdateProductServlet extends HttpServlet
{
   @SuppressWarnings("unchecked")
   @Override
   protected void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
   {
	   HttpSession hs=req.getSession(false);
	   if(hs==null)
	   {
		   req.setAttribute("msg","Session Expired..<br>");
		   req.getRequestDispatcher("Msg.jsp").forward(req, res);
	   }
	   else
	   {
		   ArrayList<ProductBean>al=(ArrayList<ProductBean>)hs.getAttribute("alist");
		   String pCode=req.getParameter("pcode");
		   Iterator<ProductBean>it=al.iterator();
		   while(it.hasNext())
		   {
			   ProductBean pb=(ProductBean)it.next();
			   if(pCode.equals(pb.getCode()))
			   {
				   pb.setPrice(Float.parseFloat(req.getParameter("price")));
				   pb.setQty(Integer.parseInt(req.getParameter("qty")));
				   int k=new UpdateProductDAO().update(pb);
				   if(k>0)
				   {
					   req.setAttribute("msg","Product Updated Successfully...<br>");
					   req.getRequestDispatcher("UpdateProduct.jsp").forward(req, res);
				   }
				   break;
			   }
		   }
	   }
   }
}
