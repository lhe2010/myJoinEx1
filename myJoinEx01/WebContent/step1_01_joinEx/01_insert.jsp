<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
</head>
<body>

	<form method="post" action="02_insertPro.jsp">
		아이디 : <input type="text" name="id" id="id"><br>
		비밀번호 : <input type="password" name="passwd" id="passwd"><br>
		이름 : <input type="text" name="name" id="name"><br>
		<input type="submit" value="가입">
		<input type="reset" value="초기화">		
	</form>
</body>
</html>