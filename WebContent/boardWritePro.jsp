<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String w_writer = request.getParameter("w_writer");
	String w_title = request.getParameter("w_title");
	String w_content = request.getParameter("w_content");
	String w_delpw = request.getParameter("w_delpw");
	
	Connection conn = null;
	PreparedStatement stmt = null;
	
	String url ="jdbc:oracle:thin:@localhost:1521:xe";
	String id ="system";
	String pw ="1234";
	String sql;
	
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection(url, id, pw);
		out.println(w_title+"가 입력되었습니다.");
		sql = "insert into board1 values (aaa.nextval, ?, ?, ?, ?, sysdate)";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, w_writer);
		stmt.setString(2, w_title);
		stmt.setString(3, w_content);
		stmt.setString(4, w_delpw);
		int r = stmt.executeUpdate();
		if(r>0) {
			response.sendRedirect("boardList.jsp");	
		} else {
			response.sendRedirect("board_write.jsp");
		}
		stmt.close();
		conn.close();
	} catch (Exception e) {
		out.println("시스템 오류");
	}
	
%>