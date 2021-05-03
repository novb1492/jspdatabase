

<%@page import="java.util.ArrayList"%>
<%@page import="co.kr.jdbc.user.model.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<%@ page import="java.sql.*" %>

<jsp:useBean id="users" class="co.kr.jdbc.user.model.uservo" ></jsp:useBean>
<jsp:setProperty  name="users" property="*" />

<%

userdao dao = userdao.getinstance();
 
ArrayList<uservo>array= dao.select(users.getId(),users.getPwd());

String name=null;
for(uservo user : array)
{
	name=user.getName();
}
session.setAttribute("username",name);
out.print(name);
response.sendRedirect("welcome.jsp");



%>