<%@ page language="java" 
         contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"
         import="test.*,java.util.*"
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	UserBean ub=(UserBean)session.getAttribute("ubean");
	ArrayList<ProductBeanUser> al=(ArrayList<ProductBeanUser>)session.getAttribute("alist_u");
	String pCode=request.getParameter("pcode");
	//out.println("Page Belongs to User: "+ub.getfName()+"<br>");
	int rQty=Integer.parseInt(request.getParameter("req"));
	Iterator<ProductBeanUser> it=al.iterator();
	while(it.hasNext())
	{
		ProductBeanUser pb=(ProductBeanUser)it.next();
		if(pb.getCode().equals(pCode))
		{
			out.println("TotalAmout:"+(pb.getPrice()*rQty));
			out.println("<a href='payment?pcode="+pCode+"&required="+rQty+"'>Payment</a>");
			//out.println("<a href='" + request.getContextPath() + "/payment?pcode=" + pCode + "&required=" + rQty + "'>Payment</a>");

		break;
		}
	}
	%>
	<a href="logout">Logout</a>
</body>
</html>




