<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.sql.*" %>
 <%@ page import="java.util.*" %>
 <%@ page errorPage="error.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<style>
body{
text-align:center;
}
</style>
<meta charset="ISO-8859-1">
<title>Add subjects to classes</title>
</head>
<body>
	<% 
	boolean loggedin=false;
	Cookie ck[] = request.getCookies();
	for(int i=0;i<ck.length;i++){
		Cookie cookie = ck[i];
		if(cookie.getName().equals("u_name") && cookie.getValue().equals("admin")){
			loggedin=true;
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/phase2project";
			String username = "root";
			String password = "root";
			Connection connection = DriverManager.getConnection(url, username, password);
			Statement statement = connection.createStatement();
			String subject = request.getParameter("subject");
			String classname = request.getParameter("classname");
			String sql="select * from teachers where subject like '" +subject + "'";
			ResultSet result= statement.executeQuery(sql);
			%>
			<h2>Select Teacher for the Subject - </h2><%=subject %>
			<br><br>
			<form action="SubjectClass_Inserted.jsp">
				<select name="teacher">
			        <%  while(result.next()){ %>
			            <option><%= result.getString(1)%></option>
			        <% } %>
     			</select>
     			<br><br>
     			<input type=hidden name="classname" value=<%=classname%>>
     			<input type=hidden name="subject" value=<%=subject%> >
				<input type="submit" value= "submit">
			</form>
			<%break;}
		}
 		if(loggedin==false){
 		%> 
 		<h1>You need to login to access the requested page!</h1>
 			<br><br>
			<a href="index.html">Login Page</a>
 		<%
 	}
 %>
			
</body>
</html>