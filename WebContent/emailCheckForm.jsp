<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 중복 체크 </title>
</head>
<body>
<div class="wrap">
	<h3 class="pop_tit">이메일 중복 확인</h3>
		<form action="emailCheckPro.jsp" method="post" onsubmit="return invalidCheck(this)">
			<div class="item_fr">
				<label for="" class="lb">이메일:</label>
				<input type="text" name="m_email" id="email" required autofocus />
				<input type="submit" value="중복확인"/>
			</div>
		</form>
		<script>
		function invalidCheck(f) {
			var email = f.email.value;
			email = email.trim();
			if(email.length<10) { 
				alert("유효한 이메일이 아닙니다.");
				return false;
			}
		}
		</script>
</div>
</body>
</html>