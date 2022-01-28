<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>비밀번호 찾기 페이지2</title>
    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">
    <!-- css 링크 -->
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/common.css">
    <style>
         h2 { margin:200px 100px 0 100px; text-align:center; }
        form { margin:40px 0 100px 850px; font-size:20px; }
        .datalist { padding:15px; }
        .inputs { display:block; }
        button { width:120px; height:50px; color:white; background-color:rgb(161, 161, 161); border-radius:10px; font-size:16px; }
        [class*="li_"] { float:left; }
    </style>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	String m_name = request.getParameter("m_name");
	String m_email = request.getParameter("m_email");
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
		sql = "select question from member1 where name=? and email=? and id=?";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, m_name);
		stmt.setString(2, m_email);
		stmt.setString(3, m_id);
		rs = stmt.executeQuery();
		if(rs.next()) {
			String m_question = rs.getString("question");
			
%>
<%@ include file ="header.jsp"%>
 		<form action="findPwRs.jsp" class="frm" method="post" name="joinform" onsubmit="return joinCheck(this)">
        <div class="datalist">
	        <label for="m_question" class="inputs">가입시 입력한 질문: <%=m_question %></label>
	        <input type="text" id="m_answer" name="m_answer"  class="indata"  required>
	    </div>
 		<div class="datalist">
	         <button type="submit" name="next" value="next" class="next_btn">조회</button>
	    </div>
</form>
<%@ include file ="footer.jsp"%>

<%	
		} else {
			response.sendRedirect("find_pw.html");
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