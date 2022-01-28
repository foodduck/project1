q<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String m_id = request.getParameter("m_id");
	String m_pw = request.getParameter("m_pw");
	
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	String url ="jdbc:oracle:thin:@localhost:1521:xe";
	String id ="system";
	String pw ="1234";
	String sql;
	
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection(url, id, pw);
		out.println(m_id+"가 입력되었습니다.");
		sql = "select * from member1 where id=? and pw=?";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, m_id);
		stmt.setString(2, m_pw);
		rs = stmt.executeQuery();
		
		if(rs.next()) {
			session.setAttribute("m_id", rs.getString("id"));
			session.setAttribute("m_pw", rs.getString("pw"));
			response.sendRedirect("index.jsp");
			rs.close();
			stmt.close();
			conn.close();
		} else {
			response.sendRedirect("login.jsp");
		}
	} catch(Exception e) {
		out.println("시스템 오류");
	}

%>