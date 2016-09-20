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
<link rel="stylesheet" href="style.css">
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
String command="";
command="select round(avg(rating),2) from rating where title ='"+request.getParameter("title")+"'";
Statement selectMovie=cnn.createStatement();
ResultSet rs=selectMovie.executeQuery(command);
String avgrating="";
while(rs.next()){
	//System.out.println(" avg rating is  : " + rs.getString(1));
	avgrating=rs.getString(1);
	//System.out.println("rating is : " + rating);
}

%>	

<div class="img">

	   <img src="images/<%=request.getParameter("cat").concat("/").concat(request.getParameter("title").concat(".jpg")) %>"
	   alt="n" style="width:100%">

</div>
<div class="img1">
<h1 class="center">

	  Movie Synopsis <%=request.getParameter("title")%>
</h1>

 <p>A film, also called a movie, motion picture, theatrical film or photoplay, is a series of still images which,
  when shown on a screen, creates the illusion of moving images due to the phi phenomenon. 
  This optical illusion causes the audience to perceive continuous motion between separate objects viewed rapidly in succession. The process of filmmaking is both an 
  art and an industry. A film is created by photographing actual scenes with a motion picture camera; 
  by photographing drawings or miniature models using traditional animation techniques; by means of CGI and computer animation;
   or by a combination of some or all of these techniques and other visual effects.</p>
 
 
 <form action="rating.jsp" method ="get"">
	<p class="thick">Current Rating of Movie: <%=avgrating%>  </p>
	<p class="thick">Rate the Movie </p>
	
  <input type="radio" name="star" value=1> <span class="star">&#9734</span><br>
  <input type="radio" name="star" value=2> <span class="star">&#9734</span><span class="star">&#9734</span><br>
  <input type="radio" name="star" value=3> <span class="star">&#9734</span><span class="star">&#9734</span><span class="star">&#9734</span><br>
  <input type="radio" name="star" value=4> <span class="star">&#9734</span><span class="star">&#9734</span><span class="star">&#9734</span> <span class="star">&#9734</span><br>
  <input type="radio" name="star" value=5> <span class="star">&#9734</span><span class="star">&#9734</span><span class="star">&#9734</span><span class="star">&#9734</span><span class="star">&#9734</span><br>
  <input type="hidden" name="title" value="<%=request.getParameter("title")%>"/>
  <input type = "submit" value = "submit"/>
</form>
 	
</div>
</body>
</html>