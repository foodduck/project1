<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 결과 페이지</title>
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

	String m_answer = request.getParameter("m_answer");
	String m_id = request.getParameter("m_id");
	
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
		sql = "select pw from member1 where answer=? and id=?";
		stmt = conn.prepareStatement(sql);
		
		stmt.setString(1, m_answer);
		stmt.setString(2, m_id);
		
		rs = stmt.executeQuery();
		if(rs.next()) {
			String m_pw = rs.getString("pw");
%>
<%@ include file ="header.jsp"%>
			 <!-- 본문 -->
       <div class="rs">
           <h2>당신의 비밀번호는 "<%=m_pw %>" 입니다.</h2>
           <a href="login.jsp" class="btn">로그인 페이지로 돌아가기</a>
       </div>
<%@ include file ="footer.jsp"%>

<%	
		} else {
			response.sendRedirect("findPw.jsp");
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