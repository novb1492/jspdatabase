<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%
    String url="jdbc:mysql://localhost:3306/study_db";
    String id="root";
    String pwd="6937544";
    String sql="select *from member";
    
    Connection conn=null;//db연동
    Statement stmt=null;///sql문관련
    ResultSet rs=null;//select관련
    try{
    	Class.forName("com.mysql.jdbc.Driver");
    	conn=DriverManager.getConnection(url,id,pwd);
    	stmt=conn.createStatement();
    	rs=stmt.executeQuery(sql);
    	while(rs.next())
    	{
    		out.println(rs.getString("id"));
    		out.println(rs.getString("pwd"));
    		out.println(rs.getString("name"));
    		out.println(rs.getString("position")+"<br>");
    	
    	}
    }
    catch(Exception e){
    	e.printStackTrace();
    }
    finally{
    	try{
    		conn.close();
    		stmt.close();
    		rs.close();
    	}
    	catch(Exception e){
    		e.printStackTrace();
    	}
    }
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>