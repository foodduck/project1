<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String a_id = (String) session.getAttribute("a_id");
	if(a_id==null) {
		response.sendRedirect("admin_login.html");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">
    <!-- css 링크 -->
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/common.css">
    <style>
        .admin_wrap { width:1200px; margin:200px auto 150px; }
        h2 { text-align:center; }
        .admin_list { margin:50px auto; }
        .admin_list li { border:1px solid #666; width:180px; margin:20px auto; text-align:center; font-size:25px; }
        [class*="li_"] { float:left; }
    </style>
</head>
<body>
    <!-- 헤더 영역 -->
        <header class="hd">
            <h1 class="logo"><a href="index.jsp"><img src="./img/typea-logo.png"></a></h1>
            <div class="hd_wrap">
                <nav class="tnb">
                    <ul class="right">
                        <li><a href="login.jsp">로그인</a></li>
                        <li><a href="agreement.jspl">회원가입</a></li>
                    </ul>
                </nav>
            </div>
            <!-- 메뉴 -->
            <div class="hd_wrap">
                <nav class="gnb">
                    <ul>
                        <li>
                            <a href="" class="menu">PRODUCT</a>
                            <ul class="sub">
                                <li><a href="product_2020.html">2020</a></li>
                                <li><a href="product_2021.html">2021</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="" class="menu">COMMUNICATION</a>
                            <ul class="sub">
                                <li><a href="">회원게시판</a></li>
                                <li><a href="">건의게시판</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="" class="menu">ABOUT US</a>
                            <ul class="sub">
                                <li><a href="https://search.naver.com/search.naver?where=news&sm=tab_jum&query=%ED%98%84%EB%8C%80%EC%98%A4%ED%86%A0%EC%97%90%EB%B2%84" target="blank">뉴스</a></li>
                                <li><a href="company.html">회사소개</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>
        </header>