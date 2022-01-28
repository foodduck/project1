<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
	String a_id = (String) session.getAttribute("a_id");
	if(a_id!=null){
		session.removeAttribute("a_id");
		session.removeAttribute("a_pw");
	}
	response.sendRedirect("admin.jsp");
%>