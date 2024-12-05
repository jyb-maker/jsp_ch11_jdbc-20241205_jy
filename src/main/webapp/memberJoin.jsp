<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>abc_school 회원 가입</title>
</head>
<body>
	<h2>abc 스쿨 회원가입</h2>
	<hr>
	<form action="memberJoinOk.jsp" method="post">
		이름 : <input type="text" name="sname"><br><br>
		학년 : <input type="text" name="sgrade"><br><br>	
		주소 : <input type="text" name="saddr"><br><br>
		<input type="submit" value="회원등록">					
	</form>
</body>
</html>