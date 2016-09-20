<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "javax.sql.*"  %>
    <%@ page import = "java.sql.*"  %>
     <%@ page import = "java.util.*"  %>
     <%@ page import = "java.io.FileInputStream"  %>
     <%@ page import = "java.io.IOException"  %>
    <%@ page import = "java.io.InputStream"  %> 
    <%@ page import="java.io.File" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
System.out.println("first name"+request.getParameter("first name"));
System.out.println("last namee"+request.getParameter("last name"));
System.out.println("usermaile"+request.getParameter("usermail"));
System.out.println("password"+request.getParameter("password"));
out.print(request.getParameter("first name"));
out.print("</div>");

Class.forName("com.mysql.jdbc.Driver");
String category =request.getParameter("category");
InputStream input = getServletContext().getResourceAsStream("/WEB-INF/resources/login.properties");
Properties p = new Properties(System.getProperties());
p.load(input); 
Connection cnn =DriverManager.getConnection(p.getProperty("database"),p.getProperty("dbuser"),p.getProperty("dbpassword"));
//String command="";
//command="INSERT INTO movies.users  (userid,firstname,lastname,password,rating)VALUES ("+request.getParameter("usermail")+request.getParameter("first name"),request.getParameter("last name"),request.getParameter("password"),null);
PreparedStatement updateemp = cnn.prepareStatement
("insert into movies.users values(?,?,?,?)");
updateemp.setString(1,request.getParameter("usermail"));
updateemp.setString(2,request.getParameter("first name"));
updateemp.setString(3,request.getParameter("last name"));
updateemp.setString(4,request.getParameter("password"));

updateemp.executeUpdate();

response.sendRedirect("login.html");
%>
</body>
</html>