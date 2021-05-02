<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
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
	PreparedStatement pstmt=null;
String sql="update users set name=?,phone1=?,phone2=?,phone3=?,gender=? where id=?";
	/*String sql="update users set name='"+name+"',phone1='"+phone1+"',phone2='"+phone2+"',phone3='"+phone3+"',gender='"+gender+"' where id='"+id+"'";*/
	
try{
	Class.forName("com.mysql.jdbc.Driver");
	conn=DriverManager.getConnection(url,dbid,dbpwd);
	System.out.println(conn+"접속완료");
	pstmt =conn.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setString(2, phone1);
	pstmt.setString(3, phone2);
	pstmt.setString(4, phone3);
	pstmt.setString(5, gender);
	pstmt.setString(6, id);
	//out.print(sql);
	int rn=pstmt.executeUpdate();
	if(rn==1)
	{
		session.setAttribute("userid",id);
		session.setAttribute("username",name);
		session.setAttribute("userphone1",phone1);
		session.setAttribute("userphone2",phone2);
		session.setAttribute("userphone3",phone3);
		session.setAttribute("usergender",gender);
		response.sendRedirect("welcome.jsp");
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
	pstmt.close();
}
catch(Exception e2)
{
	
}
}

%>