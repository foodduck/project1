<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정 화면(관리자용)</title>
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
        .btn_wrap .in_btn { display:block; width:80px; margin:18px auto;  background-color:#333; color:#fff; 
            text-align:center; border:0; outline:0; line-height:38px; }
        .btn_wrap .in_btn:hover { background-color:rgb(228, 208, 119); color:black; }
        input[readonly] { background:#f1f1f1; }
        [class*="li_"] { float:left; }
    </style>
</head>
<body>
	<!-- 헤더 -->
	<%@ include file="admin_header.jsp" %>
<%
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id="system";
	String pw="1234";
	String sql;
	String n_no2 = request.getParameter("n_no");
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection(url, id, pw);
		sql = "select * from notice1 where no=?";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, n_no2);
		rs = stmt.executeQuery();

		if(rs.next()) {
			int n_no = rs.getInt("no");
			String n_title = rs.getString("title");	
			String n_content = rs.getString("content");
			String n_img = rs.getString("img");
%>
	 <h2 class="tit">공지사항 수정</h2>
        <form action="updateNoticePro.jsp" method="post" id="frm" name="nform" onsubmit="return nCheck(this)">
            <table class="tb">
                <tbody>
                    <tr>
                        <th class="col_hd">
                            <label for="title" >제목</label>
                        </th>
                        <td class="col_data">
                            <input type="text" class="in_data" value="<%=n_title %>"/>
                        </td>
                    </tr>
                    <tr>
                        <th class="col_hd">
                            <label for="content">내용</label>
                        </th>
                        <td class="col_data">
                            <input type="text" class="in_data" value="<%=n_title %>"/>
                        </td>
                    </tr>
                    <tr>
                        <th class="col_hd">
                            <label for="img">이미지</label>
                            <input type="text" class="in_data" value="<%=n_img %>"/>
                        </th>
                        <td class="col_data">
                            <input type="text" name=n_img id="n_img" class="in_data" value="<%=n_img %>"/>
                            <input type="button" onclick="imgCheck()" value="이미지 변경"/>
                            <input type="hidden" name="imgck" id="imgck" value="" />
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="btn_wrap">	
                <button type="submit" class="in_btn" onclick="">수정완료</button>
            </div>	
        </form>
<script>
	function imgCheck() {
		window.open("noticeImgCheckForm.jsp", "imguploadcheck", "width=300, height=300");
	}
	
	function nCheck(f) {
		if(f.imgck.value!="yes"){
			alert("이미지 체크가 되어 있지 않습니다.");
			return false;
		}
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
	<!-- 푸터 -->
	<%@ include file="footer.jsp" %>
</body>
</html>