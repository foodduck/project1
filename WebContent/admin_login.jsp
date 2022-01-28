<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String a_id = request.getParameter("a_id");
	String a_pw = request.getParameter("a_pw");
	if(a_id.equals("admin")){
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id="system";
		String pw="1234";
		String sql;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(url, id, pw);
			out.println(a_id+"가 입력되었습니다.");
			sql = "select * from admin where id=? and pw=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, a_id);
			stmt.setString(2, a_pw);
			rs = stmt.executeQuery();
			
			if(rs.next()) {
				session.setAttribute("a_id", rs.getString("id")); 
				session.setAttribute("a_pw", rs.getString("pw")); 
				response.sendRedirect("admin.jsp");
				
				rs.close();
				stmt.close();
				conn.close();	
			} else {
				response.sendRedirect("admin_login.html");
			}
	} catch(Exception e) {
		out.println("시스템에 오류가 있습니다.");
	}	
	} else {
		response.sendRedirect("index.jsp");
	}
%>    