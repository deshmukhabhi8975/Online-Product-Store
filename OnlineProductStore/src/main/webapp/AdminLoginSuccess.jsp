<%@ page language="java"
         contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"
         import="test.AdminBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login Success...</title>
</head>
<body>
<%
AdminBean ab=(AdminBean)session.getAttribute("abean");
out.println("Welcome Admin:"+ab.getfName()+"<br>");
%>
<a href="product.html">AddProduct</a>
<a href="view1">ViewAllProducts</a>
<a href="vieworders">View All Orders</a>
<a href="viewUsers">View all Users</a>
<a href="logout">Logout</a>
</body>
</html>
