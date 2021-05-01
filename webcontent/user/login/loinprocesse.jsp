<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
String id=request.getParameter("id");
String pwd=request.getParameter("pwd");

	String dbid="root";
	String dbpwd="6937544";
	String url="jdbc:mysql://localhost:3306/study_db";
	Connection conn=null;
	Statement stmt=null;
	ResultSet rs=null;
	String sql="select * from users where id='"+id+"'";
try{
	Class.forName("com.mysql.jdbc.Driver");
	conn=DriverManager.getConnection(url,dbid,dbpwd);
	System.out.println(conn+"접속완료");
	stmt =conn.createStatement();
	rs=stmt.executeQuery(sql);////////select에서만20210427이유는 여러정보를 가져오기 때문
	if(rs.next())//////if문에서도 잘먹힌다 20210501
	{
		if(rs.getString("id").equals(id)&&rs.getString("pwd").equals(pwd))
		{
			session.setAttribute("userid",id);
			session.setAttribute("username",rs.getString("name"));
			session.setAttribute("userphone1",rs.getString("phone1"));
			session.setAttribute("userphone2",rs.getString("phone2"));
			session.setAttribute("userphone3",rs.getString("phone3"));
			session.setAttribute("gender",rs.getString("gender"));
			response.sendRedirect("welcome.jsp");
		}
		else
		{
			response.sendRedirect("login.jsp");
		}
	}
	else
	{
		response.sendRedirect("login.jsp");
	}
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
	rs.close();
}
catch(Exception e2)
{
	
}
}

%>