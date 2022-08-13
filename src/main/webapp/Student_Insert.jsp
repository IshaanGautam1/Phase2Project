<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.sql.*" %>
 <%@ page import="java.util.*" %>
 <%@ page errorPage="error.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style >
body{
text-align:center;
}
</style>
<title>Insert title here</title>
</head>
<body>
 <%
 Cookie[] ck = request.getCookies();
 boolean loggedin=false;
	for(int j=0;j<ck.length;j++){
		Cookie cookie=ck[j];
		if(cookie.getName().equals("u_name") && cookie.getValue().equals("admin")){
			loggedin=true;
	Class.forName("com.mysql.cj.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/phase2project";
	String username = "root";
	String password = "root";
	Connection connection = DriverManager.getConnection(url, username, password);
	String student_name=request.getParameter("student_name");
	String student_class = request.getParameter("student_class");
 	Statement statement = connection.createStatement();
 	String sql="Insert into students Values(\"" +student_name+"\",\""+student_class+"\")"; 
 	int result = statement.executeUpdate(sql);
 	if(result>0){
 			%><h1>Student <%=student_name %> Added to Class <%= student_class %>successfully </h1>
 			
 			<%
 	}
 	
 	 %> <br><br>
 			<a href="dashboard.jsp">Go back to dashboard</a><%
	connection.close();
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

