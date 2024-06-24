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
@SuppressWarnings("serial")
@WebServlet("/delete")
public class DeleteProductServlet extends HttpServlet
{
	@SuppressWarnings("unchecked")
	@Override
	protected void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
	{
		HttpSession hs=req.getSession(false);
		if(hs==null) 
		{
			req.setAttribute("msg", "Session expired..<br>");
			req.getRequestDispatcher("Msg.jsp").forward(req, res);
		}
		else 
		{
			ArrayList<ProductBean> al=(ArrayList<ProductBean>)hs.getAttribute("alist");
			String pCode=req.getParameter("pcode");
			Iterator<ProductBean> it=al.iterator();
			while(it.hasNext())
			{
				ProductBean pb=(ProductBean)it.next();
				if(pCode.equals(pb.getCode())) 
				{
					al.remove(pb);
					int k=new DeleteProductDAO().deleteProduct(pb);
					if(k>0)
					{
						req.setAttribute("msg", "Product Deleted Succefully..<br>");
						req.getRequestDispatcher("DeleteProduct.jsp").forward(req, res);
					}
				}
			}//loop
		}
	}
}
