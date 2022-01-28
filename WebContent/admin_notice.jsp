<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <title>공지사항(관리자용)</title>
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">
    <!-- css 링크 -->
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/common.css">
    <style>
        .tit { width:100px; margin:200px auto 50px; }
        .n_wrap::after { content:""; display:block; clear:both; }
        .n_list { margin-left:100px; }
        .n_list li { float:left; margin:0 0 50px 200px; }
        .notice1 { width:300px; }
        [class*="li_"] { float:left; }
    </style>
</head>
<body>
	<!-- 헤더 -->
	<%@ include file="admin_header.jsp" %>
	
	
	 <!-- 공지목록 -->
        <h3 class="tit">공지사항</h3>
        <div class="n_wrap">
            <ul class="n_list">
                <li><a href="admin_notice_edit.jsp?n_no=1"><input type="image" src="./img/공지1.png" alt="공지이미지 버튼1" class="notice1"/></a></li>
                <li><a href="admin_notice_edit?n_no=2"><input type="image" src="./img/공지2.png" alt="공지이미지 버튼2" class="notice1"/></a></li>
                <li><a href="admin_notice_edit?n_no=3"><input type="image" src="./img/공지3.png" alt="공지이미지 버튼3" class="notice1"/></a></li>
            </ul>
        </div>
	<!-- 푸터 -->
	<%@ include file="footer.jsp" %>
</body>
</html>