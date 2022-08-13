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
<title>Add Class</title>
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
			String classname=request.getParameter("classname").toUpperCase();
			String sql1="select * from classes where classname like '"+classname +"'";
			Statement statement = connection.createStatement();
			ResultSet result = statement.executeQuery(sql1);
			if(result.next()){
				%>
				<h1>This class already exists</h1>
				<br><br>
				<a href="dashboard.jsp">Go back to dashboard</a>
				<%
			}
			else{
				String sql2 = "Insert into classes values (\"" +classname + "\")";
				int result2 = statement.executeUpdate(sql2);
				String sql3="create table "+classname + "(subject varchar(35),teacher varchar(35))";
				
				if(result2>0){
					%>
					<h1>Class Inserted Successfully</h1>
					<br><br>
					<a href="dashboard.jsp">Go back to dashboard</a>
					<%
					int result3=statement.executeUpdate(sql3);
				}
				else{
					%>
					<h1>Class Not Inserted</h1>
					<br><br>
					<a href="dashboard.jsp">Go back to dashboard</a>
					<%
					
				}
			}
			connection.close();
			break;
			}
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