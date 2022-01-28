<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>  
<%@ page import="java.util.*"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*" %>   
<%
		Connection conn = null;
		PreparedStatement stmt = null;
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id="system";
		String pw="1234";
		String sql;
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");	    
		String n_title = request.getParameter("n_title");
		String n_content = request.getParameter("n_content");
		String n_img = request.getParameter("n_img");
		int n_no= Integer.parseInt(request.getParameter("n_no"));
		if (n_img=="") {
			n_img="./img/noimg.png";
		}
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(url, id, pw);
			sql = "update notice1 set title=?, content=?, img=? where no=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, n_title);
			stmt.setString(2, n_content);
			stmt.setString(3, n_img);
			stmt.setInt(4, n_no);
			int n = stmt.executeUpdate();
			if(n>=1) {
				//제품 등록 성공시 이동
				System.out.println("성공");
				response.sendRedirect("admin_notice.jsp");
			} else {
				//제품 등록 실패시 이동
				System.out.println("실패");
				response.sendRedirect("admin_notice_edit.jsp?n_no="+n_no);
			}
			stmt.close();
			conn.close();
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩이 실패되었습니다.");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("DB연결이 실패되었거나 SQL을 처리하지 못했습니다.");
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println("기타 오류");
			e.printStackTrace();
		}

%>