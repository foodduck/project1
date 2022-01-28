<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 상품목록보기</title>
</head>
<body>
	<!-- 헤더 -->
	<%@ include file="admin_header.jsp" %>
	
	<!--  회원목록  -->
	<%
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id="system";
		String pw="1234";
		String sql;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(url, id, pw);
			sql = "select * from notice1";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery(sql);
%>
    <h2>공지목록</h2>
	<table border="1"  cellpadding="5" cellspacing="0"> 
		<tr>
			<th>공지번호</th><th>제목</th>
			<th>내용</th><th>이미지</th>
			<th>수정</th>
			
		</tr>
<%		
			while(rs.next()) {
				int n_no = rs.getInt("no");
				String n_title = rs.getString("title");
				String n_content = rs.getString("content");
				String n_img = rs.getString("img");
			
%>
		<tr>
			<td><a href="updateNotice.jsp?n_no=<%=n_no %>"><%=n_no%></a></td>
			<td><%=n_title%></td>
			<td><%=n_content %></td>
			<td><img src='./img/<%=n_img %>'  alt='공지' /></td>
			<td><a href="updateNotice.jsp?n_no=<%=n_no %>">수정</a></td>
		</tr>
<%			
			}
			rs.close();
			stmt.close();
			conn.close();
		} catch (Exception e) {
			response.sendRedirect("error.jsp");
		}
%>
	<!-- 푸터 -->
	<%@ include file="footer.jsp" %>
</body>
</html>