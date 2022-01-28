<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	String m_id = request.getParameter("m_id");
	String m_pw = request.getParameter("m_pw");
	String m_name = request.getParameter("m_name");
	String m_email = request.getParameter("m_email");
	String m_question = request.getParameter("m_question");
	String m_answer = request.getParameter("m_answer");
	String address1 = request.getParameter("address1");
	String address2 = request.getParameter("address2");
	
	
	Connection conn = null;
	PreparedStatement stmt = null;
	
	String url ="jdbc:oracle:thin:@localhost:1521:xe";
	String id ="system";
	String pw ="1234";
	String sql;
	
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection(url, id, pw);
		out.println(m_id+"가 입력되었습니다.");
		sql = "insert into member1 values (?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, m_id);
		stmt.setString(2, m_pw);
		stmt.setString(3, m_name);
		stmt.setString(4, m_email);
		stmt.setString(5, m_question);
		stmt.setString(6, m_answer);
		stmt.setString(7, address1);
		stmt.setString(8, address2);
		int r = stmt.executeUpdate();
		if(r>0) {
			response.sendRedirect("join_done.jsp");	
		} else {
			response.sendRedirect("join.jsp");
		}
		stmt.close();
		conn.close();
	} catch (Exception e) {
		out.println("시스템 오류");
	}
	
%>