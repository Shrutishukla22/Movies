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
Class.forName("com.mysql.jdbc.Driver");
String category =request.getParameter("category");
InputStream input = getServletContext().getResourceAsStream("/WEB-INF/resources/login.properties");
Properties p = new Properties(System.getProperties());
p.load(input); 
Connection cnn =DriverManager.getConnection(p.getProperty("database"),p.getProperty("dbuser"),p.getProperty("dbpassword"));
String args[] = request.getParameterValues("star");
System.out.println("inside JSP" + args.length);
int rating=0;
for(int i=0;i<args.length;i++) {
	//out.print(args[i]);
	rating=Integer.parseInt(args[i]);
}
System.out.println(" titleis : " + request.getParameter("title"));
System.out.println("rating is : " + rating);
PreparedStatement updateemp = cnn.prepareStatement
("insert into movies.rating values(?,?)");
updateemp.setString(1,request.getParameter("title"));
updateemp.setInt(2,rating);
updateemp.executeUpdate();
%>
<jsp:forward page="movies.jsp" /> 
</body>
</html>