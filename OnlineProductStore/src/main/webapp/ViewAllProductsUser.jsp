<%@page import="java.util.Iterator"%>
<%@page import="test.*"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
UserBean ub =(UserBean) session.getAttribute("ubean");
ArrayList<ProductBeanUser> al = (ArrayList<ProductBeanUser> ) session.getAttribute("alist_u");

//out.println("page belongs to User:"+ub.getfName()+"<br>");
if(al.size()==0)
{
	out.println("No Products available...<br>");
 }
else
{
	 out.println("<table>");
     out.println("<tr>"+
             "<th>Code</th>"
             +"<th>Name</th>"
             +"<th>Price</th>"
             +"<th>Quantity</th>"
             +"<th>Operation</th>"+
             "</tr>");

     Iterator<ProductBeanUser> it=al.iterator();
     while(it.hasNext())
     {
         ProductBeanUser pb=(ProductBeanUser)it.next();
         out.println("<tr>"
                 +"<td>"+pb.getCode()+"</td>"
                 +"<td>"+pb.getName()+"</td>"
                 +"<td>"+pb.getPrice()+"</td>"
                 +"<td>"+pb.getQty()+"</td>"
                 +"<td>" +"<a href='buy?pcode="+pb.getCode()+"'>Buy</a>"+ " </td>"
                 +"</tr>");
     }
     out.println("</table>");
}
%>
<a href="logout">Logout</a>

</body>
</html>
