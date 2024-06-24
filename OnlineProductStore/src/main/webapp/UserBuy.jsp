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
	//out.println("Page Belongs to User: "+ub.getFirstName()+"<br>");
	Iterator<ProductBeanUser> it=al.iterator();
	while(it.hasNext())
	{
		ProductBeanUser pb=(ProductBeanUser)it.next();
		if(pCode.equals(pb.getCode())){
			%>
		ProductCode:<%=pb.getCode() %><br>
		ProductName:<%=pb.getName() %><br>
		ProductPrice:<%=pb.getPrice() %><br>
		ProductQuantity<%=pb.getQty() %><br>
		<form action="buyproduct" method="post">
			<input type="hidden" name="pcode" value=<%=pb.getCode() %>>
		    Required<input type="text" name="req">
			<input type="submit" value="BuyProduct">
		</form>
		<%
		break;
		}
	}
	%>
	<a href="logout">Logout</a>

</body>
</html>


