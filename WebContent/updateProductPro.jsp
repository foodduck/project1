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
		String p_id = request.getParameter("p_id");
		String p_name = request.getParameter("p_name");
		String p_description = request.getParameter("p_description");
		String p_standard = request.getParameter("p_standard");
		int p_price = Integer.parseInt(request.getParameter("p_price"));
		String p_img = request.getParameter("p_img");
		if (p_img=="") {
			p_img="./img/noimg.png";
		}
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(url, id, pw);
			sql = "update product1 set name=?, description=?, standard=?, price=?, img=? where id=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, p_name);
			stmt.setString(2, p_description);
			stmt.setString(3, p_standard);
			stmt.setInt(4, p_price);
			stmt.setString(5, p_img);
			stmt.setString(6, p_id);
			int n = stmt.executeUpdate();
			if(n>=1) {
				//제품 등록 성공시 이동
				System.out.println("성공");
				//response.sendRedirect("productList.jsp");
			} else {
				//제품 등록 실패시 이동
				System.out.println("실패");
				//response.sendRedirect("updateProduct.jsp?p_id="+p_id);
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
		}

%>