<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String m_id = (String) session.getAttribute("m_id");
	if(m_id!=null) {
		System.out.println("<h3>"+m_id+"님</h3>");
	} else {
		response.sendRedirect("login.html");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 헤더</title>
	<link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">
    <!-- css 링크 -->
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/common.css">
</head>
<body>
  <!-- 헤더 영역 -->
    <div class="wrap">
        <header class="hd">
            <h1 class="logo"><a href="index.jsp"><img src="./img/typea-logo.png"></a></h1>
            <div class="hd_wrap">
                <nav class="tnb">
                    <ul class="right">
                        <li><a href="change.jsp?m_id=<%=m_id %>">정보수정</a></li>
                        <li><a href="logout.jsp">로그아웃</a></li>
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
                                <li><a href="back.html">회원게시판</a></li>
                                <li><a href="back.html">건의게시판</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="" class="menu">ABOUT US</a>
                            <ul class="sub">
                                <li><a href="news.html">뉴스</a></li>
                                <li><a href="company.html">회사소개</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>
        </header>
       </div>
</body>
</html>