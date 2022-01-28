<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String m_id = (String) session.getAttribute("m_id");
	if(m_id!=null) {
		session.invalidate();
		System.out.println("로그아웃 되었습니다.");
	}
	response.sendRedirect("index.jsp");
%>