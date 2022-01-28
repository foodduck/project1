<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<style>

</style>
</head>
<body>
	<!-- 헤더 -->
	<%@ include file="logonHeader.jsp" %>
	<h1>회원 정보 수정</h1>
<%
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id="system";
	String pw="1234";
	String sql;
	String m2_id = request.getParameter("m_id");
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection(url, id, pw);
		sql = "select * from member1 where id=?";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, m2_id);
		rs = stmt.executeQuery();

		if(rs.next()) {
			String m_pw = rs.getString("pw");		
			String m_name = rs.getString("name");
			String m_email = rs.getString("email");
			String m_question = rs.getString("question");
			String m_answer = rs.getString("answer");
			String m_address1 = rs.getString("address1");
			String m_address2 = rs.getString("address2");
			Date m_regdate = rs.getDate("regdate");
%>
	  <h2>회원정보 수정</h2>
        <form action="updateMemberPro.jsp" class="frm" method="post" name="joinform" onsubmit="return joinCheck(this)">
            <div class="datalist">
                <label for="m_id" class="inputs">아이디 </label>
                <input type="text" id="m_id" name="m_id" class="indata" value="<%=m_id %>" placeholder="ID" readonly />
            </div>
	        <div class="datalist">
	            <label for="m_pw" class="inputs">비밀번호 </label>
	            <input type="password" id="m_pw" name="m_pw" class="indata" value="<%=m_pw %>" required />
	        </div>
	        <div class="datalist">
	            <label for="m_pw2" class="inputs">비밀번호 확인</label>
	            <input type="password" id="m_pw2" name="m_pw2" class="indata" required />
	        </div>
	        <div class="datalist">
	            <label for="m_name" class="inputs">이름입력 </label>
	            <input type="text" id="m_name" name="m_name"  class="indata"  value="<%=m_name %>"  required />
	        </div>
	        <div class="datalist">
	            <label for ="m_email" class="inputs">이메일 </label>
	            <input type="text" id="m_email" name="m_email" class="indata" value="<%=m_email %>" pattern="\w+@\w+\.\w+" required />
	            <input type="button" value="중복확인" class="pushdata" onclick="emailCheck()">
	            <input type="hidden" name="passbtn2" id="passbtn2">
	        </div>
	        <div class="datalist">
	            <label for ="m_question" class="inputs">비밀번호를 찾기 위한 질문을 정하세요.</label>
	            <input type ="text" id="m_question" name ="m_question" class="indata"  value="<%=m_question %>" pattern="w{1-100}" required />
	        </div>
	        <div class="datalist">
	            <label for ="m_answer" class="inputs">질문의 답을 정하세요.</label>
	            <input type ="text" id="m_answer" name ="m_answer" class="indata"  value="<%=m_answer %>" pattern="w{1-100}" required />
	        </div>
	        <div class="datalist">
	            <label for="m_address1" class="inputs">우편번호</label>
	            <input type="text" name="m_address1" id="m_address1"  class="indata" value="<%=m_address1 %>" />
	            <input type="button" value="주소찾기" onclick="findAddr()" class="pushdata"/>
	        </div>
	        <div class="datalist">
	            <label for ="m_address2" class="inputs">주소</label>
	            <input type ="text" name="m_address2" id="m_address2"  class="indata"  value="<%=m_address2 %>" />
	        </div>
	        <div class="datalist">
	            <label for ="m_regdate" class="inputs">가입일</label>
	            <input type ="text" name="m_regdate" id="m_regdate"  class="indata"  value="<%=m_regdate %>"  readonly />
	        </div>
	        <div class="datalist">
	            <button type="submit" name="next" value="next" class="pushdata">수정 완료</button>
	        </div>
	    </form>
	    <input type="button" value="회원탈퇴" onclick="deleteConfirm()" class="pushdata"/>
<script>
	//다음카카오의 주소 API 이용
        function findAddr(){
            new daum.Postcode({
                oncomplete: function(data) {
                    console.log(data);                   
                    var roadAddr = data.roadAddress; // 도로명 주소 변수
                    var jibunAddr = data.jibunAddress; // 지번 주소 변수
                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('m_address1').value = data.zonecode;
                    if(roadAddr !== ''){
                        document.getElementById("m_address2").value = roadAddr;
                    } 
                    else if(jibunAddr !== ''){
                        document.getElementById("m_address2").value = jibunAddr;
                    }
                }
            }).open();
        }
    </script>
	<script src="http://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	
	function emailCheck() {
		window.open("emailCheckForm.jsp","emailwin","width:400, height:620")
	}
	
	function joinCheck(f) {
		
		
		if(f.m_pw.value!=f.m_pw2.value) {
			alert("비밀번호와 비밀번호 확인을 일치시키세요")
			return false;
		}
		if (f.passbtn2.value!="yes") {
			alert("이메일 중복 검사를 해주세요");
			return false;
		}
	}
	function deleteConfirm() {
		if(confirm("정말 삭제하겠습니까?")) {
			location.href="deleteMemberPro.jsp?m_id=<%=m_id %>"
		}
		
	}
	</script>
	<%			
		}
			System.out.println("작업이 올바르게 처리되었습니다.");
			rs.close();
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
	<%@ include file="footer.jsp" %>
</body>
</html>