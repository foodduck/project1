<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 체크</title>
</head>
<body>
<div class="wrap">
	<h3 class="pop_tit">아이디 중복 확인</h3>
		<form action="idCheckPro.jsp" method="post" onsubmit="return invalidCheck(this)">
			<div class="item_fr">
				<label for="" class="lb">아이디:</label>
				<input type="text" name="m_id" id="id" required autofocus />
				<input type="submit" value="중복확인"/>
			</div>
		</form>
		<script>
		function invalidCheck(f) {
			var id = f.id.value;
			id = id.trim();
			if(id.length<5 || id.length>12) { 
				alert("아이디의 글자수: 5~12");
				return false;
			}
		}
		</script>
</div>
</body>
</html>