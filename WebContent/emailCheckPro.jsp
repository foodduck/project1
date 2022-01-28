<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>   
<%
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id="system";
		String pw="1234";
		String sql;
		String m_email = request.getParameter("m_email");
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(url, id, pw);
			out.println(m_email+"가 입력되었습니다.");
			sql = "select * from member1 where email=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, m_email);
			rs = stmt.executeQuery();
%>
<%		
			if(rs.next()) {
				out.println("<p>이미 사용중인 이메일 입니다.</p>");
			} else {
				out.println("<p>사용 가능한 이메일 입니다.</p>");
				out.println("<a href='javascript:apply(\""+m_email+"\")'>"+m_email+"[적용]</a>");
				out.println("<p>적용을 눌러야만 입력한 이메일을 사용할 수 있습니다.</p>");
%>
<script>
			function apply(email) {
				opener.document.joinform.m_email.value=email;
				opener.document.joinform.passbtn2.value="yes";
				window.close();
			}
</script>

<%
		}
		out.println("작업이 올바르게 처리되었습니다.");
		stmt.close();
		conn.close();
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩이 실패되었습니다.");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("DB연결이 실패되었거나 SQL을 처리하지 못했습니다.");
			e.printStackTrace();
		}
%>