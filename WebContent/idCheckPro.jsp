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
		String m_id = request.getParameter("m_id");
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(url, id, pw);
			out.println(m_id+"가 입력되었습니다.");
			sql = "select * from member1 where id=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, m_id);
			rs = stmt.executeQuery();
%>
<%		
			if(rs.next()) {
				out.println("<p>이미 사용중인 아이디 입니다.</p>");
			} else {
				out.println("<p>사용 가능한 아이디 입니다.</p>");
				out.println("<a href='javascript:apply(\""+m_id+"\")'>"+m_id+"[적용]</a>");
				out.println("<p>적용을 눌러야만 입력한 아이디를 사용할 수 있습니다.</p>");
%>
<script>
			function apply(id) {
				opener.document.joinform.m_id.value=id;
				//입력후 readonly
				opener.document.joinform.m_id.readonly=true;
				opener.document.joinform.passbtn1.value="yes";
				window.close();
			}
</script>

<%
		}
		rs.close();
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