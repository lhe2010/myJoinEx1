<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제 페이지</title>
</head>
<body>
	<h2>삭제하려는 회원님의 정보를 입력하세요.</h2>
	<form method="post" action="04_deletePro.jsp">
		아이디 : <input type="text" name="id" id="id"><br>
		비밀번호 : <input type="password" name="passwd" id="passwd"><br>
		<input type="submit" value="탈퇴"> 
		<input type="reset" value="다시쓰기">
	</form>

</body>
</html>