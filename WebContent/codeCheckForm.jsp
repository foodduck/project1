<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 코드 중복 체크</title>
</head>
<body>
	<div class="wrap">
		<h3 class="pop_tit">상품코드 중복 확인</h3>
		<form action="codeCheckPro.jsp" method="post" onsubmit="return invalidCheck(this)">
			<div class="item_fr">	
				<label for="p_code" class="lb">상품아이디 : </label>
				<input type="text" name="p_code" id="p_code" placeholder="4~6 문자 및 숫자로 입력" required autofocus />
				<input type="submit" value="중복확인"/>
			</div>	
		</form>
		<script>
		function invalidCheck(f) {
			var p_code = f.p_code.value;
			p_code = p_code.trim();
			if(p_code.length!=4) {
				alert("아이디는 글자수가 4 이어야 합니다.");
				return false;
			}
		}
		</script>
	</div>	
</body>
</html>