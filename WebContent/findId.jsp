<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 찾기 결과 페이지</title>
     <!-- 폰트 -->
     <link rel="preconnect" href="https://fonts.googleapis.com">
     <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
     <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">
     <!-- css 링크 -->
     <link rel="stylesheet" href="./css/reset.css">
     <link rel="stylesheet" href="./css/common.css">
     <style>
         .rs { margin:300px 0; text-align:center; }
         h2{ margin-bottom:50px; }
         .btn { padding:10px; border:solid 1px gray; color:gray; font-size:20px; }
         [class*="li_"] { float:left; }
     </style>
     <style>
         [class*="li_"] { float:left; }
     </style>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	String m_name = request.getParameter("m_name");
	String m_email = request.getParameter("m_email");
	
	
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
		sql = "select id from member1 where name=? and email=?";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, m_name);
		stmt.setString(2, m_email);
		rs = stmt.executeQuery();
		if(rs.next()) {
			String m_id = rs.getString("id");
%>
<%@ include file ="header.jsp"%>
		 <!-- 본문 -->
        <div class="rs">
            <h2>당신의 ID는 "<%=m_id %>" 입니다.</h2>
            <a href="login.html" class="btn">로그인 페이지로 돌아가기</a>
        </div>
<%@ include file ="footer.jsp"%>
<%	
		} else {
			response.sendRedirect("find_id.html");
		}
		rs.close();
		stmt.close();
		conn.close();
	} catch (Exception e) {
		out.println("시스템 오류");
	}
	
%>
</body>
</html>