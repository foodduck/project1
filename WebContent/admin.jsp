<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
</head>
<body>
	<!-- 헤더 -->
	<%@ include file="admin_header.jsp" %>
 <!-- 본문 -->
        <div class="admin_wrap">
            <h2>관리자 페이지</h2>
            <ul class="admin_list">
                <li><a href="memberList.jsp">회원목록</a></li>
                <li><a href="boardList.jsp">게시글목록</a></li>
                <li><a href="admin_notice.jsp">공지목록</a></li>
                <li><a href="productList.jsp">제품목록</a></li>
                <li><a href="admin_logout.jsp">관리자 로그아웃</a></li>
            </ul>
        </div>
	<!-- 푸터 -->
	<%@ include file="footer.jsp" %>
</body>
</html>