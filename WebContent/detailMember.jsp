<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>회원 상세(관리자용)</title>
    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">
    <!-- css 링크 -->
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/common.css">
    <style>
        .tit { width:100px; margin:200px auto 50px; }
        .w_tit { clear:both; border-top:3px solid #333; width:1600px; margin:0 auto; height:36px; }
        .w_tit li {float:left; width:160px; margin:0 auto; text-align:center; line-height:36px; }
	    .w_list { list-style:none; clear:both; border-top:1px solid #333; width:1600px; margin:0 auto; height:36px; }
	    .w_list li { float:left; width:160px; margin:0 auto; text-align:center; line-height:36px; }
	    .w_list:last-child { border-bottom:3px solid #333; }
        .btn_wrap { width:220px; margin:20px auto; }
	    .in_btn { width:80px; margin:70px 10px; background-color:#adb1ba; color:#333; 
            text-align:center; border:0; outline:0; line-height:38px; }
	    .in_btn:hover { background-color:rgb(228, 208, 119); }
        [class*="li_"] { float:left; }
    </style>
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
		String u_id = request.getParameter("m_id");
		try { 
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(url, id, pw);
			sql = "select * from member1 where id=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, u_id);
			rs = stmt.executeQuery();
%>
   <h2 class="tit">회원 목록</h2>
        <div class="w_wrap">
            <ul class="w_tit">
                <li class="item1">회원아이디 </li>
                <li class="item2">회원비밀번호</li>
                <li class="item3">회원명</li>
                <li class="item4">이메일</li>
                <li class="item5">질문</li>
                <li class="item6">답</li>
                <li class="item7">우편번호</li>
                <li class="item8">주소</li>
                <li class="item9">가입일</li>
                <li class="item10">수정/삭제</li>
            </ul>
        </div>
<%		
			while(rs.next()) {
				String m_id = rs.getString("id");
				String m_pw = rs.getString("pw");
				String m_name = rs.getString("name");
				String m_email = rs.getString("email");
				String m_question = rs.getString("question");
				String m_answer = rs.getString("answer");
				String m_address1 = rs.getString("address1");
				String m_address2 = rs.getString("address2");
				Date m_regdate = rs.getDate("regdate");
%>
	     <div class="w_list">
                <ul class="lst">
                    <li class="item1"><%=m_id %></li>
                    <li class="item2"><%=m_pw %></li>
                    <li class="item3"><%=m_name %></li>
                    <li class="item4"><%=m_email %></li>
                    <li class="item5"><%=m_question %></li>
                    <li class="item6"><%=m_answer %></li>
                    <li class="item7"><%=m_address1 %></li>
                    <li class="item8"><%=m_address2%></li>
                    <li class="item9"><%=m_regdate %></li>
                    <li class="item10"><a href="updateMember.jsp?m_id=<%=m_id %>">페이지로 이동</a></li>
                </ul>
            </div>
<%			
		}
			rs.close();
			stmt.close();
			conn.close();
		} catch (Exception e) {
			response.sendRedirect("error.jsp");
		}
%>
</table>	
	
	<!-- 푸터 -->
	<%@ include file="footer.jsp" %>
</body>
</html>