<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원게시판</title>
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">
    <!-- css 링크 -->
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/common.css">
     <style>
         .mem_bd { padding-bottom: 150px; }
         /* 공지목록 스타일 */
        .tit { margin:200px 100px 100px 100px; text-align:center; }
        .n_tit { margin:90px 90px 80px 250px; text-align:left; }
        .n_wrap::after { content:""; display:block; clear:both; }
        .n_list { margin-left:100px; }
        .n_list li { float:left; margin:0 0 50px 200px; }
        .notice1 { width:300px; }
        /* 글목록 스타일 */
        .w_tit { clear:both; border-top:3px solid #333; width:900px; margin:0 auto; height:36px; }
        .w_tit li {float:left; width:200px; margin:0 auto; text-align:center; line-height:36px; }
	    .w_list { list-style:none; clear:both; border-top:1px solid #333; width:900px; margin:0 auto; height:36px; }
	    .w_list li { float:left; width:200px; margin:0 auto; text-align:center; line-height:36px; }
	    .w_list:last-child { border-bottom:3px solid #333; }
	    .in_btn { width:220px; margin:70px auto; display:block; width:80px; background-color:#adb1ba; color:#333; 
            text-align:center; border:0; outline:0; line-height:38px; }
	    .in_btn:hover { background-color:rgb(228, 208, 119); }
        [class*="li_"] { float:left; }
     </style>
</head>
<body>
	<!-- 헤더 -->
<%   
		String m2_id = (String) session.getAttribute("m_id");
		if (m2_id!=null) {
%>
			<%@ include file='logonHeader.jsp'%>
<%
		} else {
%>
			<%@ include file='header.jsp'%>
<%
		}
%>
	
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
			sql = "select * from board1";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery(sql);
%>
 <div class="wrap">
    <section class="mem_bd">
            <!-- 공지목록 -->
            <h2 class="tit"><br><hr/><br>회원게시판</h2>
            <h3 class="n_tit">공지사항</h3>
            <div class="n_wrap">
                <ul class="n_list">
                    <li><a href="notice_look.jsp?n_no=1"><input type="image" src="./img/공지1.png" alt="이미지 버튼" class="notice1"/></a></li>
                    <li><a href="notice_look.jsp?n_no=2"><input type="image" src="./img/공지2.png" alt="이미지 버튼" class="notice1"/></a></li>
                    <li><a href="notice_look.jsp?n_no=3"><input type="image" src="./img/공지3.png" alt="이미지 버튼" class="notice1"/></a></li>
                </ul>
            </div>
             <!-- 글목록 -->
            <h3 class="n_tit">글목록</h3>
            <div class="w_wrap">
                <ul class="w_tit">
                    <li class="item1">글번호 </li>
                    <li class="item2">제목</li>
                    <li class="item3">ID</li>
                    <li class="item4">작성일</li>
                </ul>
<%		
			while(rs.next()) {
				int w_no = rs.getInt("no");
				String w_title = rs. getString("title");
				String w_writer = rs. getString("writer");		
				String w_content = rs.getString("content");
				Date w_regdate = rs.getDate("regdate");
				int w_delpw = rs.getInt("delpw");
%>
		
                <ul class="w_list">
                    <li class="item1"><%=w_no %></li>
                    <li class="item2"><a href="board_look.jsp?no=<%=w_no %>"><%=w_title %></a></li>
                    <li class="item3"><%=w_writer %></li>
                    <li class="item4"><%=w_regdate %></li>
                </ul>
<%	
		}
%>
					
	            </div>
	       <input type="button" class="in_btn" value="글 작성" onclick="logincheck()"/>
        </section>
  </div>
<%
			stmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
			//response.sendRedirect("index.jsp");
		}
%>
<script>
		function logincheck() {
			String m2_id = (String) session.getAttribute("m_id");
			if (m_2id==null) {
				alert("로그인 후 이용 가능합니다.");
			} else {
				location.href="board_write.jsp?m2_id=<%=m2_id %>"
			}
		}		
</script>
	<!-- 푸터 -->
	<%@ include file="admin_footer.jsp" %>
</body>
</html>