<%@page import="co.kr.jdbc.user.model.userdao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.sql.*" %>
    
<jsp:useBean id="users" class="co.kr.jdbc.user.model.uservo" ></jsp:useBean>
<jsp:setProperty  name="users" property="*" />

<%
	userdao dao= userdao.getinstance();
	
%>
