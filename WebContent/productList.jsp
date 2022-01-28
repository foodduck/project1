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
		
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection(url, id, pw);
		sql = "select * from product1";
		stmt = conn.prepareStatement(sql);
		rs = stmt.executeQuery(sql);
%>
    <h2>제품목록</h2>
	<table border="1"  cellpadding="5" cellspacing="0"> 
		<tr>
			<th>제품코드</th><th>제품명</th>
			<th>설명</th><th>규격</th><th>가격</th>
			<th>이미지</th><th>수정 및 삭제</th>
		</tr>
<%		
		while(rs.next()) {
			String p_id = rs.getString("id");
			String p_name = rs.getString("name");
			String p_description = rs.getString("description");
			String p_standard = rs.getString("standard");
			int p_price = rs.getInt("price");
			String p_img = rs.getString("img");
%>
		<tr>
			<td><a href="updateProduct.jsp?p_id=<%=p_id %>"><%=p_id %></a></td>
			<td><%=p_name %></td>
			<td><%=p_description %></td>
			<td><%=p_standard %></td>
			<td><%=p_price %></td>
			<td><img src='./img/<%=p_img %>'  alt='자동차' /></td>
			<td><a href="updateProduct.jsp?p_id=<%=p_id %>">수정</a>	</td>
		</tr>
<%			
		}
		//out.println("작업이 올바르게 처리되었습니다.");
		stmt.close();
		conn.close();
%>
</table>	

	
	<!-- 푸터 -->
	<%@ include file="footer.jsp" %>
</body>
</html>