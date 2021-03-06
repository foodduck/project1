<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>  
    <!DOCTYPE html>  
    <html>
    <head>
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/common.css">
    <link rel="stylesheet" href="./css/ban.css">
      <meta charset="UTF-8">
      <title>현대오토에버 메인</title>
      <script src="./js/jquery.js"></script>
      <!-- 문서 메타포 설정 -->
      <meta name="title" content="현대오토에버"/>
      <meta name="keywords" content=""/>
      <meta name="description" content="모빌리티 테크 기업인 현대오토에버는 In Car, Out Car 등 모빌리티 전반에 디지털 혁신을 제공하고 있습니다." />   
      <meta name="author" content="https://www.hyundai-autoever.com" />
      <!-- 소셜 네트워크 서비스에서의 공통 오픈 그래프 설정 -->
      <meta property="og:title" id="ogTitle" content="현대오토에버" />
      <meta name="og:description" id="ogDescription" content="모빌리티 테크 기업인 현대오토에버는 In Car, Out Car 등 모빌리티 전반에 디지털 혁신을 제공하고 있습니다." />      
          <meta property="og:image" id="ogImage" content="http://www.hyundai-autoever.com/common/images/no_img.jpg" />
      <meta property="og:url" content="https://www.hyundai-autoever.com/kor/main/index.do?" />
      <meta property="og:type" content="article" />
      <meta property="og:site_name" content="현대오토에버" />

      <link rel="shortcut icon" href="https://www.hyundai-autoever.com/favicon.ico" type="image/x-icon" />
      <!-- 폰트 -->
      <link rel="preconnect" href="https://fonts.googleapis.com">
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
      <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">
      <!-- css 링크 -->
      <link rel="stylesheet" href="./css/reset.css">
      <link rel="stylesheet" href="./css/common.css">

      <style>
          /* 회사사진 스타일 */
          .com { padding:150px 10px 100px 200px; }
          .com li { float:left; padding:10px; }
          .com .li_pt1 { width:700px; height:200px; }
          .com .li_pt2 { width:700px; height:200px; margin:30px;}
          .com img { width:350px; }
          .li_paju_ { margin:0 0 0 30px; }
          .com p { margin-top:10px; line-height:150%; }
          .pj { padding-top:30px; }
          .com::after { content:""; clear:both; display:block; }
          /* 뉴스 스타일 */
          .items { padding:100px 50px 200px 200px; }
          .items img { width:350px; display:block; }
          .items h3 { font-size:17px; padding-top:30px; }
          .items ul { margin-bottom:20px; }
          .items li:nth-child(2) { padding:15px 10px; }
          .items li:last-child { padding:0px 10px 10px 10px; }
          .items::after { content:""; clear:both; display:block; }
          .li_news { width:500px; height:300px; }
          .li_news3 { margin:30px; }
          [class*="li_"] { float:left; }
      </style>
      <link rel="stylesheet" href="./css/ban.css">
      <style>
          .main { clear:both; width:100%; min-height:800px; }
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
        <!-- 메인화면 -->
          <div class="main">
            <figure class="vs">
              <ul class="img_box">
                  <li>
                      <img src="./img/main.jpg" alt="메인이미지1" class="vs_img">
                      <div class="tit_box">
                          <h2 class="vs_tit">모빌리티 혁신과<br>미래를 선도하는 기업</h2>
                          <p class="vs_com">현대오토에버는 4차 산업혁명 미래에 맞춰 패러다임의 변화를 선도합니다.</p>
                          <a href="company.jsp" class="more">자세히 보러가기</a>
                      </div>
                  </li>
                  <li>
                      <img src="./img/content1.jpg" alt="메인이미지2" class="vs_img">
                      <div class="tit_box">
                          <h2 class="vs_tit">현대오토에버, 2021년<br>지속가능경영보고서 발간</h2>
                          <p class="vs_com">현대오토에버는 지속가능한 경영활동을 위해 ESG 3대 목표 및 5대 전략을 수립하여 이행하고 있습니다.<br>
                                                                             현대오토에버의 다양한 ESG 추진 노력을 지속가능경영보고서를 통해 확인 바랍니다.</p>
                          <a href="https://www.hyundai-autoever.com/kor/sustainable-management/report/contents.do?cntnSeq=221" class="more" target="_blank">자세히 보러가기</a>
                      </div>
                  </li>
                  <li>
                      <img src="./img/content3.jpg" alt="메인이미지3" class="vs_img">
                      <div class="tit_box">
                          <h2 class="vs_tit">현대오토에버 채용정보</h2>
                          <p class="vs_com">현대오토에버와 함게 할 인재를 모집합니다.</p>
                          <a href="https://hyundai-autoever.recruiter.co.kr/appsite/company/index" class="more" target="_blank">자세히 보러가기</a>
                      </div>
                  </li>
              </ul>
            </figure>
            <script src="./js/ban.js"></script>
       </div>
       <!-- 메인화면 회사사진 -->
       <section class="com">
           <div class="box">
               <h2>Company</h2>
               <div class="com li_pt1">
                   <ul>
                       <li class="li_seoul"><img src="./img/본사.jpg"></li>
                       <li class="li_seoul_">
                         <h3>본사</h3>
                         <p>서울시 강남구 테헤란로 510</p>
                       </li>
                   </ul>
               </div>
               <div class="com li_pt2">
                   <ul>
                       <li class="li_paju"><img src="./img/파주.jpg"></li>
                       <li class="li_paju_">
                           <h3>파주지점</h3>
                           <p class="pj">경기도 파주시 조리읍 팔학골길 148-43</p>
                       </li>
                   </ul>
               </div>
           </div>
       </section>
       <!-- 메인화면 뉴스 -->
       <section class="items">
           <div class="box">
               <h2>News</h2>
               <div class="li_news">
                   <a href="https://www.sedaily.com/NewsView/22TXR7F6DC" class="list" target="_blank">
                       <ul>
                           <li><img src="./img/news1.png" alt="뉴스이미지1"></li>
                           <li><h3>온라인 화이트해커 경진대회 개최</h3></li>
                       </ul>
                   </a>
               </div>
               <div class="li_news">
                   <a href="https://zdnet.co.kr/view/?no=20210913111608" class="list" target="_blank">
                       <ul>
                           <li><img src="./img/news2.png" alt="뉴스이미지2"></li>
                           <li><h3>취약계층 아동 대상 '스마트 모빌리티 박람회' 개최</h3></li>
                       </ul>
                   </a>
               </div>
               <div class="li_news3">
                 <a href="https://www.hankyung.com/life/article/202110183993g" class="list" target="_blank">
                       <ul>
                           <li><img src="./img/news3.png" alt="뉴스이미지3"></li>
                           <li><h3>'새만금 상용차 자율주행 테스트 베드' 구축</h3></li>
                       </ul>
                   </a>
               </div>
           </div>
       </section>
       <%@ include file = "footer.jsp" %>
     </div>
   </body>
 </html>