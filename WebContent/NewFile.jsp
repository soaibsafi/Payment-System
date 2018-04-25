<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<% 
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		Connection conn =DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hr","hr");
		Statement stmt = conn.createStatement();
		String sql = "Select * from JOBS ORDER BY MIN_SALARY";
		ResultSet rs = stmt.executeQuery(sql);
		if(rs!=null)
		{ 
	%>
		<table border=1 cellpadding=5><tr><td>JOB ID</td><td>JOB Title</td><td>MinSal</td><td>MaxSal</td></tr>
	<%
		while(rs.next())
		{
			System.out.print("hi\n");
	%>		
			<tr>
			<td><%=rs.getString("JOB_ID") %></td>
			<td><%=rs.getString("JOB_TITLE") %></td>
			<td><%=rs.getString("MIN_SALARY") %></td>
			<td><%=rs.getString("MAX_SALARY") %></td>
			</tr>
	<% 
		}	
		}
	}
		catch(Exception e){
		e.printStackTrace();
}
	%>
</body>
</html>