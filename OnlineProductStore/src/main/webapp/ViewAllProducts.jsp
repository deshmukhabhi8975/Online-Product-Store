<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="test.*,java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Product Management</title>

</head>
<body>
<%
AdminBean ab=(AdminBean)session.getAttribute("abean");
ArrayList<ProductBean>al=(ArrayList<ProductBean>)session.getAttribute("alist");
//out.println("page belongs to Admin:"+ab.getfName()+"<br>");
if(al.size()==0)
{
	out.println("No Products available...<br>");
 }
else
{
	Iterator<ProductBean>it=al.iterator();
	while(it.hasNext())
	{
		ProductBean pb=(ProductBean)it.next();
		out.println(pb.getCode()+"&nbsp&nbsp"+pb.getName()+"&nbsp&nbsp"+pb.getPrice()+"&nbsp&nbsp"+pb.getQty()+"&nbsp&nbsp"+
		"<a href='edit?pcode="+pb.getCode()+"'>Edit</a>"+"&nbsp&nbsp"+
		"<a href='delete?pcode="+pb.getCode()+"'>Delete</a><br>");
	}
}
%>
<a href="product.html">AddProduct</a>
<a href="logout">Logout</a>
</body>

</html>
