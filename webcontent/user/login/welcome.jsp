
<%@page import="co.kr.jdbc.user.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String name =(String)session.getAttribute("username");
%>
<%=name %>


