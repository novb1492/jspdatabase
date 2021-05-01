<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.sql.*" %>
    
    <%
   // request.setCharcterEncoding("utf-8");
    String name=request.getParameter("name");
    String id=request.getParameter("id");
    String pwd=request.getParameter("pwd");
    String phone1=request.getParameter("phone1");
    String phone2=request.getParameter("phone2");
    String phone3=request.getParameter("phone3");
    String gender=request.getParameter("gender");
 
    String dbid="root";
   	String dbpwd="6937544";
   	String url="jdbc:mysql://localhost:3306/study_db";
   	Connection conn=null;
   	Statement stmt=null;
   	String sql="INSERT INTO users(name,id,pwd,phone1,phone2,phone3,gender)VALUES('"+name+"','"+id+"','"+pwd+"','"+phone1+"','"+phone2+"','"+phone3+"','"+gender+"')";
try{
	Class.forName("com.mysql.jdbc.Driver");
	out.print(sql);
	conn=DriverManager.getConnection(url,dbid,dbpwd);
	System.out.println(conn+"접속완료");
	stmt =conn.createStatement();
	int rn=stmt.executeUpdate(sql);
	if(rn==1)
	{
		session.setAttribute("userid",id);
		response.sendRedirect("joinsuccess.jsp");
	}
	else
	{
		response.sendRedirect("joinform.jsp");
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
	}
	catch(Exception e2)
	{
		
	}
}
    %>
