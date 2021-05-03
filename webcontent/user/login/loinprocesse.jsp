
<%@page import="java.util.ArrayList"%>
<%@page import="co.kr.jdbc.user.model.userdao"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<%@ page import="java.sql.*" %>

<jsp:useBean id="users" class="co.kr.jdbc.user.model.uservo" ></jsp:useBean>
<jsp:setProperty  name="users" property="*" />

<%

userdao dao = userdao.getinstance();
 
ArrayList<String>array= dao.select(users.getId(),users.getPwd());



if(array.get(0)!=null)
{
	session.setAttribute("sname",array.get(0));
	
	response.sendRedirect("welecome.jsp");
}
else
{
	response.sendRedirect("logine.jsp");
}

%>