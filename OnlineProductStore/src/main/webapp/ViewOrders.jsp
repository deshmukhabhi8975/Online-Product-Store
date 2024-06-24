<%@ page language="java" 
         contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"
         import="test.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	AdminBean ab = (AdminBean)session.getAttribute("abean");
    ArrayList<OrdersDetailsInfoBean> al=(ArrayList<OrdersDetailsInfoBean>)session.getAttribute("ordersList");
    out.println("Page Belongs to Admin: "+ab.getfName()+"<br>");
    if(al.size()==0)
    {
        out.println("No Product Available..<br>");
    }
    else
    {
        out.println("<table>");
        out.println("<tr>"
                +"<th>UserName</th>"
                +"<th>ProductCode</th>"
                +"<th>Quantity</th>"+
                "</tr>");

        Iterator<OrdersDetailsInfoBean> it=al.iterator();
        while(it.hasNext())
        {
        	OrdersDetailsInfoBean pb=(OrdersDetailsInfoBean)it.next();
            out.println("<tr>"
                    +"<td>"+pb.getuName()+"</td>"
                    +"<td>"+pb.getpCode()+"</td>"
                    +"<td>"+pb.getQuant()+"</td>"
                    +"</tr>");
        }
        out.println("</table>");
    }
    %>
    <a href="logout">Logout</a>
</body>
</html>
