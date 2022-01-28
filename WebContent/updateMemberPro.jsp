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
	String m_address1 = request.getParameter("m_address1");
	String m_address2 = request.getParameter("m_address2");
	
	
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
		sql = "update member1 set pw=?, name=?, email=?, question=?, answer=?, address1=?, address2=? where id =?";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, m_pw);
		stmt.setString(2, m_name);
		stmt.setString(3, m_email);
		stmt.setString(4, m_question);
		stmt.setString(5, m_answer);
		stmt.setString(6, m_address1);
		stmt.setString(7, m_address2);
		stmt.setString(8, m_id);
		int r = stmt.executeUpdate();
		if(r>0) {
			response.sendRedirect("change_done.jsp");	
		} else {
			response.sendRedirect("updateMember.jsp?m_id="+m_id);
		}
		stmt.close();
		conn.close();
	} catch (Exception e) {
		out.println("시스템 오류");
	}
	
%>