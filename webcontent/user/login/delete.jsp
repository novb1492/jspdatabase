<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
String id=(String)session.getAttribute("userid");

	String dbid="root";
	String dbpwd="6937544";
	String url="jdbc:mysql://localhost:3306/study_db";
	Connection conn=null;
	Statement stmt=null;

	String sql="delete from users where id='"+id+"'";
try{
	Class.forName("com.mysql.jdbc.Driver");
	conn=DriverManager.getConnection(url,dbid,dbpwd);
	System.out.println(conn+"접속완료");
	stmt =conn.createStatement();
	int rn=stmt.executeUpdate(sql);
		response.sendRedirect("login.jsp");
}
catch(Exception e)
{
e.printStackTrace();
}
finally
{
try{
	conn.close();
	stmt.close();
}
catch(Exception e2)
{
	
}
}

%>