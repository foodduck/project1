<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인 페이지</title>
    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">
    <!-- css 링크 -->
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/common.css">
     <style>
        .con_tit { padding:70px 0 30px 0; margin-left:48%; }
        .content { margin-top:100px; }
        .frm fieldset { width:600px; padding:100px; margin:30px auto 100px; } 
        .indata { display:block; width:600px; height:48px; line-height:48px; text-indent:16px; margin:30px auto; }
        .btn_fr { width:600px; }
        .btn_fr li:first-child { float:left; }
        .btn_fr li:last-child { float:right; }
        .inbtn { display:block; width:240px; height:48px; line-height:48px; text-align:center; 
            background-color:#333; color:#fff; border:0; outline:0; border-radius:28px; }
        .btn_sc { width:400px; margin-left:77px; }
        .btn_sc li:first-child { float:left; }
        .btn_sc li:last-child { float:right; }
        .btns { display:block; width:140px; height:40px; line-height:40px; text-align:center;
            background-color:rgb(102, 102, 102); color:white; margin:100px 0 0 50px; border-radius:14px; }
        [class*="li_"] { float:left; }
     </style>
</head>
<body>
  <div class="wrap">
  <%@include file="header.jsp" %>
    <!-- 로그인  -->
        <section class="content" style="background-color: #f1f1f1;">
            <h2 class="con_tit">로그인</h2>
            <form action="loginPro.jsp" method="post" class="frm">
                <fieldset>
                    <input type="text" class="indata" id="m_id" name="m_id" placeholder="아이디 입력" autofocus required />
                    <input type="password" class="indata" id="m_pw" name="m_pw" placeholder="비밀번호 입력" required />
                    <br /><br />
                    <ul class="btn_fr">
                        <li><input type="submit" class="inbtn" value="로그인"/></li>
                        <li><input type="reset" class="inbtn" value="취소"/></li>
                    </ul>
                    <ul class="btn_sc">
                        <li><a href="find_id.html" class="btns">ID 찾기</a></li>
                        <li><a href="find_pw.html" class="btns">PW 찾기</a></li>
                    </ul>
                </fieldset>
            </form>
        </section>  
        <%@ include file = "footer.jsp" %>
  </div>
</body>
</html>