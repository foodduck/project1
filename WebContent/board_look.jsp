<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 조회 화면(회원용)</title>
    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">
    <!-- css 링크 -->
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/common.css">
    <style>
        .tit { padding-top:200px; line-height:50px; text-align:center; }
        form { padding-bottom:150px; }
        table { display:table; border-collapse:collapse; }
        tr { display:table-row; }
        th, td { display:table-cell; }
        .tb { width:900px; margin:20px auto; }
        .tb th, .tb td { line-height:42px; border-bottom:1px solid #333; }
        .tb th { background:#8c98b4; color:black; }
        .tb tr:first-child th, .tb tr:first-child td { border-top:1px solid #333; } 
        .in_data { display:block; line-height:32px; height:32px; margin-left:10px; padding-left:5px; width:800px; }
        .in_data_area { line-height:1.6; padding:5px; width:800px; height:600px; margin-left:10px; }
        .btn_wrap { width:220px; margin:20px auto; }
        .btn_wrap .in_btn { display:block; width:80px; margin:15px; background-color:#333; color:#fff; 
            text-align:center; border:0; outline:0; float:left; line-height:38px; }
        .btn_wrap .in_btn:hover { background-color:rgb(228, 208, 119); color:black; }
        .in_comment { padding-left:18px; }
        input[readonly] { background:#f1f1f1; }
        [class*="li_"] { float:left; }
    </style>
</head>
<body>
  <div class="wrap">
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
	ResultSet rs = null;
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id="system";
	String pw="1234";
	String sql;
	int b_no = Integer.parseInt(request.getParameter("b_no"));
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection(url, id, pw);
		sql = "select * from board1 where no=?";
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, b_no);
		rs = stmt.executeQuery();

		while (rs.next()) {
			int n_no = rs.getInt("no");
			String b_title = rs.getString("title");	
			String b_content = rs.getString("content");
%>
   <!-- 글보기 -->
        <h2 class="tit">게시글 조회</h2>
        <form action="EditNoticeCtrl" method="post" id="frm" name="frm">
            <table class="tb">
                <tbody>
                    <tr>
                        <th class="col_hd">
                            <label for="title" >제목</label>
                        </th>
                        <td class="col_data">
                            <input type="text" class="in_data" value=<%=b_title %>/>
                        </td>
                    </tr>
                    <tr>
                        <th class="col_hd">
                            <label for="content">글 내용</label>
                        </th>
                        <td class="col_data">
                            <input type="text" class="in_data" value=<%=b_content %>/>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="btn_wrap">	
                <button type="reset" class="in_btn" onclick="">수정</button>
                <button type="reset" class="in_btn" onclick="">삭제</button>
            </div>	
        </form>
        <%			
			}
			rs.close();
			stmt.close();
			conn.close();
		} catch(Exception e) {
			response.sendRedirect("error.jsp");
		}
%>	
        <%@ include file = "footer.jsp" %>
  </div>
</body>
</html>