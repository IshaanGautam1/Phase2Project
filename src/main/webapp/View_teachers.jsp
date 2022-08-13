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
table{
margin-left:auto;
margin-right:auto;
font-size:40px;
border: 1px solid black;
}
th, td{
border: 1px solid black;
}
</style>
<meta charset="ISO-8859-1">
<title>View Teachers</title>
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
		String sql1 = "select count(*) from teachers";
		Statement statement = connection.createStatement();
		ResultSet result = statement.executeQuery(sql1);
		int Countrow=0;
		while(result.next()){
		      Countrow= result.getInt(1);
		}
		if(Countrow==0){
			%>
			<h1>No Teachers in the list</h1>
			<%
		}
			
		else{
			String sql = "select * from teachers";
			ResultSet result1 = statement.executeQuery(sql);
			
			%>
			<h1>Teachers</h1>
			<br><br><br>
			<table>
			<tr>
			<th>Teacher Name</th>
			<th>Subject</th>
			</tr>
			<%
			while(result1.next()){
				%>
				<tr>
				<td>
				<%= result1.getString(1) %>
				</td>
				<td>
				<%= result1.getString(2) %>
				</td>
				</tr>
				<%
				
			}
			
			%>
			</table>
			
			<%
		
		}%>
		<br><br>
		<a href="dashboard.jsp">Go back to dashboard</a>
		<%
		connection.close();
		break;
		
	}
	
}
if(loggedin==false){
	%>
	<h1>Please login to View the requested page.<br><br><a href="index.html">Go to Login Page</a></h1>
	<%
	}
	%>
</body>
</html>