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
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="style.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="Style.css">
</head>
<body>


<form  method ="get">
<input class="searchform" type="text" name="category">
<input class="searchform2" type="submit" value="search by category">
</form>

<%
Class.forName("com.mysql.jdbc.Driver");
String category =request.getParameter("category");
InputStream input = getServletContext().getResourceAsStream("/WEB-INF/resources/login.properties");
Properties p = new Properties(System.getProperties());
p.load(input); 
Connection cnn =DriverManager.getConnection(p.getProperty("database"),p.getProperty("dbuser"),p.getProperty("dbpassword"));
String command="";
if (category == null||category.isEmpty())
command= "select title,category from movielist";	

else
	command="select title,category from movielist where category like '%"+category+"%'";
   Statement selectMovie=cnn.createStatement();
   ResultSet rs=selectMovie.executeQuery(command);
  String title="";
   while(rs.next()){
	   title=rs.getString("title");
	   System.out.println(" title  : " + title);
%>
	 <div class="img" >
	 
	<a href=<%= "\"movieinfo.jsp?title=" + rs.getString("title") +"&cat="+rs.getString("category")+"\"" %> >
	 	    		<img src="images/<%=rs.getString("category").concat("/").concat(rs.getString("title").concat(".jpg"))  %>" alt="n" 
	 	    		width="300" height="200">
	 </a>  		
	    	 		
    
	<%
	
	String command2="select round(avg(rating),2) from rating where title ='"+title+"'";
	Statement selectrating=cnn.createStatement();
	ResultSet  rs1=selectrating.executeQuery(command2);
	String avgrating="";
	while(rs1.next()){
		System.out.println(" avg rating is  : " + rs1.getString(1));
		avgrating=rs1.getString(1);
		//System.out.println("rating is : " + rating);
	}
	// out.print("<h5>"+ "Rating    ".concat(rs.getString("Avg_Rating"))+"</h5>");
	float avrating=Float.parseFloat(avgrating);
	int x=Math.round(avrating);
	for(double i=0;i<x ;i++){
		
	%>
	
		<span class="star">&#9734</span>
	
	<%
	}
	// out.print(rs.getString("category").concat("/").concat(rs.getString("title").concat(".jpg")));
	
	out.print("</div>");
	}
   %>
   
	           </div>  
</body>
</html>