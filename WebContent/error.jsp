<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>에러 페이지</title>
   <!-- 폰트 -->
   <link rel="preconnect" href="https://fonts.googleapis.com">
   <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
   <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">
   <!-- css 링크 -->
   <link rel="stylesheet" href="./css/reset.css">
   <link rel="stylesheet" href="./css/common.css">
   <style>
   	    .ment { margin:300px 0; text-align:center; }
        h2{ margin-bottom:50px; }
        .btn { padding:10px; border:solid 1px gray; color:gray; font-size:20px; }
        [class*="li_"] { float:left; }
  </style>
</head>
<body>
<div class="wrap">
 <%@ include file = "header.jsp"%>
 		<!-- 본문 -->
        <div class="ment">
            <h2>잘못된 요청입니다.</h2>
            <a href="index_mem.html" class="btn">메인 페이지로 이동</a>
        </div>
 <%@ include file = "footer.jsp"%>
</div>
</body>
</html>