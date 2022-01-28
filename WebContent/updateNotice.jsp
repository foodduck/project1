<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 상품수정</title>
</head>
<body>
	<!-- 헤더 -->
	<%@ include file="admin_header.jsp" %>
	<h1>공지 정보 수정</h1>
	<!-- 공지 등록 폼 -->
<%
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id="system";
	String pw="1234";
	String sql;
	String n_no = request.getParameter("n_no");
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection(url, id, pw);
		sql = "select * from notice1 where no=?";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, n_no);
		rs = stmt.executeQuery();

		if(rs.next()) {
			
			String n_title = rs.getString("title");	
			String n_content = rs.getString("content");
			String n_img = rs.getString("img");
%>
	<form action="updateNoticePro.jsp" class="frm" method="post" name="nform" onsubmit="return nCheck(this)">
		<table>
			<tr>
				<th class="item_name">
					<label for="n_title">제목</label>
				</th>
				<td class="item_val">
					<input type="text" name="n_title" id="n_title" class="in_data" value="<%=n_title %>"  required />
				</td>
			</tr>
			<tr>
				<th class="item_name">
					<label for="n_content">내용</label>
				</th>
				<td class="item_val">
					<input type="text" name="n_content" id="n_content" class="in_data" value="<%=n_content %>"  required />
				</td>
			</tr>
			<tr>
				<th class="item_name">
					<label for="n_img">이미지</label>
				</th>
				<td class="item_val">
					<input type="text" name="n_img" id="n_img" class="in_data" value="<%=n_img %>"/>
					<input type="button" value="이미지 업로드 체크" class="in_btn" onclick="imgCheck()" />
					<input type="hidden" value="" name="imgck" id="imgck" />
				</td>
			</tr>
			<tr>
				<td><input type="submit" value="공지수정" class="in_btn"/></td>
				<td><input type="reset" value="취소" class="in_btn"/></td>
			</tr>
		</table>
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