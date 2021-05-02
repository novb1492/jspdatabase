<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% 
	String id="root";
	String pwd="6937544";
	String url="jdbc:mysql://localhost:3306/study_db";

	Connection conn = null;
	PreparedStatement pstmt=null;
	String sql ="insert into member(id,pwd,name,position)values(?,?,?,?)";
	try {
		Class.forName("com.mysql.jdbc.Driver");
		 conn=DriverManager.getConnection(url, id, pwd);///진짜 php 보다훨씬 짜증난다 ㅋㅋ
		System.out.println(conn+"접속완료");
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,"text3");
		pstmt.setString(2,"pwd");
		pstmt.setString(3,"name");
		pstmt.setString(4,"position");
		int a=pstmt.executeUpdate();

		if(a==1)
		{
			out.println("성공");
		}
		else
		{
			out.println("실패");
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally {
			try {
				conn.close();
				pstmt.cancel();
				
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}

%>