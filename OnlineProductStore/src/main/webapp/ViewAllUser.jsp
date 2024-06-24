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
	AdminBean ab = (AdminBean)session.getAttribute("abean");
    ArrayList<UserBean> al= (ArrayList<UserBean>)session.getAttribute("uList");
    
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
                +"<th>FirstName</th>"
                +"<th>LastName</th>"
                +"<th>Address</th>"
                +"<th>Mail</th>"
                +"<th>Phone no</th>"+
                "</tr>");

        Iterator<UserBean> it=al.iterator();
        while(it.hasNext()){
        	UserBean pb=(UserBean)it.next();
            out.println("<tr>"
            		+"<td>"+pb.getUserName()+"</td>"
                    +"<td>"+pb.getFirstName()+"</td>"
                    +"<td>"+pb.getLastName()+"</td>"
                    +"<td>"+pb.getAddress()+"</td>"
                    +"<td>"+pb.getMailId()+"</td>"
                    +"<td>"+pb.getPhoneNumber()+"</td>"
                    //+"<td>" +"<a href='buy?pcode="+pb.getCode()+"'>Buy</a>"+ " </td>"
                    +"</tr>");
        }
        out.println("</table>");
    }
	%>
	<a href="logout">Logout</a>

</body>
</html>
