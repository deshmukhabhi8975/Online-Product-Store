<%@ page language="java" 
         contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"
         import="test.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
AdminBean ab=(AdminBean)session.getAttribute("abean");
ArrayList<ProductBean>al=(ArrayList<ProductBean>)session.getAttribute("alist");
String pCode=request.getParameter("pcode");
//out.println("Page belongs to Admin:"+ab.getfName()+"<br>");
Iterator<ProductBean>it=al.iterator();
while(it.hasNext())
{
	ProductBean pb=(ProductBean)it.next();
	if(pCode.equals(pb.getCode()))
	{
		%>
		<form action="update" method="post">
		<input type="hidden" name="pcode" value=<%=pb.getCode() %>>
		productPrice:<input type="text" name="price" value=<%=pb.getPrice() %>><br>
		productQty:<input type="text" name="qty" value=<%=pb.getQty() %>><br>
		<input type="submit" value="UpdateProduct">
		</form>
		<%
		break;
	}
	
}
%>
</body>
</html>

