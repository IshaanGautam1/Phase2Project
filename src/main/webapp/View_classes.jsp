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
<title>View Classes</title>
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
			String sql="select count(*) from classes";
			ResultSet result1 = statement.executeQuery(sql);
			int rowcount=0;
			String sql3="";
			String classname="";
			List<String> lclasses = new ArrayList<>();
			while(result1.next()){
				rowcount = result1.getInt(1);
			}
			if(rowcount>0){
				%><h2>Class Details</h2><%
				String sql2="select * from classes order by classname";
				ResultSet result2=statement.executeQuery(sql2);
				while(result2.next()){
					classname=result2.getString(1);
					lclasses.add(classname);
				}
				for(int j=0;j<rowcount;j++){
					%><h2><%=lclasses.get(j) %></h2>
					<%
					sql3="select * from "+ lclasses.get(j);
					ResultSet result3=statement.executeQuery(sql3);
					%>
					<br><br>
					<table>
					<tr>
					<th>Subject</th>
					<th>Teacher</th>
					</tr>
					<%
					while(result3.next()){
						%>
						<tr>
						<td>
						<%= result3.getString(1) %>
						</td>
						<td>
						<%= result3.getString(2) %>
						</td>
						</tr>
						<%
						
					}
					
					%>
					</table>
					<br><br>
					<h2>Students</h2>
					<%
					String sql4="select * from students where class like '" + lclasses.get(j) + "'";
					ResultSet result4=statement.executeQuery(sql4);
					%>
					<br><br>
					<table>
					<tr>
					<th>Student Name</th>
					</tr>
					<%
					while(result4.next()){
						%>
						<tr>
						<td>
						<%= result4.getString(1) %>
						</td>
						</tr>
						<%					
					}
					
					%>
					</table>
					<br><hr><br>
					<%
				}%>
				<a href="dashboard.jsp">Go back to dashboard</a>
				<%
				connection.close();
				break;
				
			}
			else{
				%><h2>There are no classes added yet</h2>
				<a href="dashboard.jsp">Go back to dashboard</a>
				<%
			}
			
		}}
		if(loggedin==false){
			%>
			<h1>Please login to View the requested page.<br><br><a href="index.html">Go to Login Page</a></h1>
			<%
			}
			%>
				
</body>
</html>