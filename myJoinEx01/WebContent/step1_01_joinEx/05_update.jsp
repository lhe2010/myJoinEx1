<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정페이지</title>
</head>
<body>
	<h2>이름을 수정하실 회원님의 아이디와 비밀번호를 입력하세요</h2>
	<form method="post" action="06_updatePro.jsp">
		아이디 : <input type="text" name="id" id="id"><br>
		비밀번호 : <input type="password" name="passwd" id="passwd"><br>
		변경할 이름 : <input type="text" name="name" id="name"><br>
		<input type="submit" value="수정하기">
		<input type="reset" value="다시쓰기">
	</form>

</body>
</html>