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
			String classname=request.getParameter("classname");
			String subject = request.getParameter("subject");
			String teacher = request.getParameter("teacher");
			String sql = "insert into "+ classname + " values (\"" +subject +"\",\"" + teacher + "\")";
			int rs = statement.executeUpdate(sql);
			if(rs>0){
				%>
				<h1>Subject <%=subject%> inserted into class <%=classname%> Successfully!</h1>
			<%}%>
		
 			<a href="dashboard.jsp">Go back to dashboard</a>
 			<%connection.close();
 			break;
 			}}
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