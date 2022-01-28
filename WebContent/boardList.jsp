<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>
</head>
<body>
	<!-- 헤더 -->
	<%@ include file="header.jsp" %>
	
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
		sql = "select * from board1";
		stmt = conn.prepareStatement(sql);
		rs = stmt.executeQuery(sql);
%>
    <h2>게시글 목록</h2>
	<table border="1"  cellpadding="5" cellspacing="0"> 
		<tr>
			<th>게시글번호</th>
			<th>게시자</th>
			<th>제목<th>
			<th>게시일자</th>
		</tr>
<%		
		while(rs.next()) {
			String w_no = rs.getString("no");
			String w_writer = rs.getString("writer");
			String w_title = rs. getString("title");			
			Date w_regdate = rs. getDate("regdate");
			
%>

		<tr>
			<td><%=w_no %></td>
			<td><a href="board_look.jsp?w_no=<%=w_no %>"><%=w_title %></a></td>
			<td><%=w_writer %></td>
			<td><%=w_regdate %></td>
		</tr>
		
<%			
		}
		//out.println("작업이 올바르게 처리되었습니다.");
		stmt.close();
		conn.close();
%>
</table>	
	
	<!-- 푸터 -->
	<%@ include file="admin_footer.jsp" %>
</body>
</html>